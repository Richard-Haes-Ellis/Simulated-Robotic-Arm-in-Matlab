function trayectoria = genTrayectoria3(in)

    iPos = [in(1); in(2); in(3)];    % Start point
    fPos = [in(4); in(5); in(6)];    % Stop  point
    N    = in(7);              % Number of points in-between trajectory
    sT   = in(8);              % Start time
    tT   = in(9);              % Trajectory time
    t    = in(10);

    T = tT/N;   % Ciclo de un tramo
    
    % Recta que pasa por los dos puntos
    p = @(t) (fPos-iPos)*((t-sT)/tT) + iPos; % Line that pases through the two points

    % Dividimos la trayectoria en partes iguales segun N
    tP = sT:T:(sT+tT);  % We devide the time interval by the numeber N
    pm = p(tP);         % We calculate the points for those times
    % Con el MCI calculamos las coordenadas articulares para cada uno de esos puntos
    q = [];     % Creamos un espacio de memoria para las coordenadas articulares
    fst = 1;    % Determina si se ha calculado ya las articulaciones para el primer punto
    
    for i = 1:N+1 
        % Modelo cinematico Inverso
        if fst % Si es el primer punto claculamos los angulos en una configuracion
            q = [q mci(pm(:,i)',[1 1 1],1)];
            fst = 0;
        else % Si ya se calculo el primero, caluclamos las dos posiblidades
            q1 = mci(pm(:,i)',[1 1 1],0);
            q2 = mci(pm(:,i)',[1 1 1],1);
            % Miramos cual es el minimo recorrido a las dos posiblidades y la
            % asignamos
            if(min(abs((q(3,i-1)-q1(3))),abs((q(3,i-1)-q2(3))))==abs((q(3,i-1)-q1(3))))
                q = [q q1];
            else
                q = [q q2];
            end
        end

    end
    
    % Condiciones de contorno para el calculo de los parametros del polinomio de interpolacion
    % Condiciones de contorno de posicion
    
    Params  = [];
    sParams = zeros(4,N,3);
    qSt     = [];

    % Matriz con los coericientes de las ecuaciones del polinomio interpolador
    % con sus derivadas primeras y segundas para un tiempo (t-ti) = T
    TM = [1 0 0   0  ;
          0 1 0   0  ;
          1 T T^2 T^3;
          0 1 T   T^2];

    dq = zeros(1,N+1);
    for i=1:N % Para N tramos
        Params = [];
        for j=1:3  % Para las tres articulaciones
            % Calculamos las velocidades por los puntos
            for k=1:N+1 % N+1 puntos
                if(k==1 || k==N+1) % Si es el final o inicial lo igualamos a cero
                    dq(k) = 0;
                else
                    if(sign(q(j,k)-q(j,k-1))~=sign(q(j,k+1)-q(j,k)))
                        dq(k) = 0; % Velocidad en ese punto es cero
                        % Si alguna recta es horizonal o si las pendientes son iguales de signo
                    elseif( sign(q(j,k)-q(j,k-1))==sign(q(j,k+1)-q(j,k)) || q(j,k-1)==q(j,k) || q(j,k+1)==q(j,k) )
                        % Cojemos la media de las pendientes de las rectas adjacentes
                        dq(k) = (1/2)*((q(j,k+1)-q(j,k))/T+(q(j,k)-q(j,k-1))/T);
                    end
                end
            end
            qini  = q(j,i);
            qfin  = q(j,i+1);
            
            % Condiciones de contorno de velocidades (Criterio heuristico)
            dqini = dq(i);
            dqfin = dq(i+1);
            
            a = qini;
            b = dqini;
            c =  (3/T^2)*(qfin-qini) - (1/T)*(dqfin + 2*dqini);
            d = -(2/T^3)*(qfin-qini)+(1/T^2)*(dqfin +   dqini);

            Params = [Params [a;b;c;d]];
            % La velocidad final del tramo i sera la velocidad inicial del tramo i+1
        end
        sParams(:,i,:) = Params;
    end
    
    
    % Vectores del polinomio interpolador con su primera y segunda derivada

    sEc   = @(t,ti) [1  (t-ti)   (t-ti)^2    (t-ti)^3];
    dsEc  = @(t,ti) [0  1      2*(t-ti)    3*(t-ti)^2];
    ddsEc = @(t,ti) [0  0      2           6*(t-ti)^1]; 
    
    i=1;

    if(t>sT && t<=sT+tT)
        i = ceil((t-sT)/T);
        
        
        disp(i);
        % Posiciones articulares q1 q2 q3
        trayectoria = [sEc(t,sT+T*(i-1))*sParams(:,i,1);
                       sEc(t,sT+T*(i-1))*sParams(:,i,2);
                       sEc(t,sT+T*(i-1))*sParams(:,i,3);
           
        % Velocidades articulares q1 q2 q3
                       dsEc(t,sT+T*(i-1))*sParams(:,i,1);
                       dsEc(t,sT+T*(i-1))*sParams(:,i,2);
                       dsEc(t,sT+T*(i-1))*sParams(:,i,3);
            
        % Aceleraciones articulares q1 q2 q3
                       ddsEc(t,sT+T*(i-1))*sParams(:,i,1);
                       ddsEc(t,sT+T*(i-1))*sParams(:,i,2);
                       ddsEc(t,sT+T*(i-1))*sParams(:,i,3)];
        
    elseif(t>=sT+tT)
        trayectoria = [mci(fPos,[1 1 1],1)' 0 0 0 0 0 0]';
    else
        trayectoria = [mci(iPos,[1 1 1],1)' 0 0 0 0 0 0]';
    end
end
