

addpath('F:\Richard\Documents\Documents\Universidad\4º GIERM\Asignaturas nuevas\CPR\Proyecto - CPR\robotics_toolbox')
startRobot

fin = xyz_fin(1,:)';
ini = xyz_ini(1,:)';
N = N(1);
tt  = tT(1);
ts  = sT(1);

figure('units','normalized','outerposition',[0 0 1 1])
robot.plot([0 ini']);

T = tT/N;   % Ciclo de un tramo

tr  = [ts:0.01:ts+tt];
tP = [ts:T:(ts+tt)];

p = @(t) (fin-ini)*((t-ts)/tt) + ini; % La recta

a  = p(tr); % Puntos continuos
pm = p(tP); % Puntos que le damos al robot



% Con el MCI calculamos las coordenadas articulares para cada uno de esos puntos
qp = [];     % Creamos un espacio de memoria para las coordenadas articulares
xyz = zeros(3,N);
fst = 1;    % Determina si se ha calculado ya las articulaciones para el primer punto

hold on
plot3(a(1,:) ,a(2,:) ,a(3,:),'r',...    % La recta
    pm(1,:),pm(2,:),pm(3,:),'-*',...  % Puntos de la recta
    xr,yr,zr,'b');              % Lo que me saca el generador
xlabel('x');
ylabel('y');
zlabel('z');

for i = 1:N+1
    % Modelo cinematico Inverso
    if fst % Si es el primer punto claculamos los angulos en una configuracion
        qp = [qp mci(pm(:,i)',1)];
        fst = 0;
    else % Si ya se calculo el primero, caluclamos las dos posiblidades
        q1 = mci(pm(:,i)',0);
        q2 = mci(pm(:,i)',1);
        % Miramos cual es el minimo recorrido a las dos posiblidades y la
        % asignamos
        if(min(abs((qp(3,i-1)-q1(3))),abs((qp(3,i-1)-q2(3))))==abs((qp(3,i-1)-q1(3))))
            qp = [qp q1];
        else
            qp = [qp q2];
        end
    end
end

for i =1:50:length(q(:,1))
    robot.plot([0 q(i,:)]);
end

figure;
subplot(3,1,1)
plot(t,q(:,1),tP,qp(1,:),'-*');
subplot(3,1,2)
plot(t,dq(:,1));
subplot(3,1,3)
plot(t,ddq(:,1));

figure;
subplot(3,1,1)
plot(t,q(:,2),tP,qp(2,:),'-*');
subplot(3,1,2)
plot(t,dq(:,2));
subplot(3,1,3)
plot(t,ddq(:,2));

figure;
subplot(3,1,1)
plot(t,q(:,3),tP,qp(3,:),'-*');
subplot(3,1,2)
plot(t,dq(:,3));
subplot(3,1,3)
plot(t,ddq(:,3));

