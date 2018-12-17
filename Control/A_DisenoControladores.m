
clear all;

answer = questdlg('¿Crear nuevo o cargar existente?','Diseño','Nuevo','Cargar','Cargar');
switch answer
    case 'Cargar'
        uiopen('load');
        answer = questdlg('¿Desea editarlo?','Diseño','Editar','No','No');
        switch answer    
            case 'Editar'
                while(~strcmp(answer,'No'))
                    answer = questdlg('Seleciona controlador:','Diseño','C1','C2','C3','C3');
                    switch answer    
                        case 'C1'
                            rltool(Gs1,Crl1);
                            fprintf('Presiona una tecla Terminar...\n');
                            pause();
                            Crl1 = C;
                        case 'C2'
                            rltool(Gs2,Crl2);
                            fprintf('Presiona una tecla Terminar...\n');
                            pause();
                            Crl2 = C;
                        case 'C3'
                            rltool(Gs3,Crl3);
                            fprintf('Presiona una tecla Terminar...\n');
                            pause();
                            Crl3 = C;
                    end
                    answer = questdlg('¿Seguir editando?:','Diseño','Si','No','No');
                end
            case 'No'
        end
    case 'Nuevo'
        answer = questdlg('Elija modelo del sistema','Diseño','Ideal','Real','Ideal');
        switch answer
            case 'Ideal'
                load('modeloIdeal.mat');
            case 'Real'
                load('modeloReal.mat');
        end
        syms qd1 qd2 qd3 real
        
        B1 = diff(V_num(1),qd1);
        B2 = diff(V_num(2),qd2);    
        B3 = diff(V_num(3),qd3);
        
        q1  = 0; q2  = 0; q3  = 0;
        qd1 = 0; qd2 = 0; qd3 = 0;
        
        A1 = eval(M_num(1,1));  A2 = eval(M_num(2,2));  A3 = eval(M_num(3,3));
        B1 = eval(B1);          B2 = eval(B2);          B3 = eval(B3);
        C1 = 0;                 C2 = 0;                 C3 = 0;
        
        answer = questdlg('Reductoras:','Diseño','Con R','Sin R','Con R');
        switch answer
            case 'Con R'
                R1 = R(1,1);
                R2 = R(2,2);
                R3 = R(3,3);
            case 'Sin R'
                R1 = 1;
                R2 = 1;
                R3 = 1;
        end
        % Funciones de trasferencia de los tres eslabones
        Gs1 = tf([Kt(1,1)*R1],[A1 B1 C1]);
        Gs2 = tf([Kt(2,2)*R2],[A2 B2 C2]);
        Gs3 = tf([Kt(3,3)*R3],[A3 B3 C3]);
        
         % Root-locus (Calculo de controladores)
        rltool(Gs1);
        fprintf('Presiona una tecla para continuar con siguente controlador...\n');
        pause();
        Crl1 = C;
        rltool(Gs2);
        fprintf('Presiona una tecla para continuar con siguente controlador...\n');
        pause();
        Crl2 = C;
        rltool(Gs3);
        fprintf('Terminado...\n');
        pause();
        Crl3 = C;
end

% Extraemos los parametros de los controladores diseñados
[Kp1,Ti1,Td1,N1] = pidstddata(Crl1);
[Kp2,Ti2,Td2,N2] = pidstddata(Crl2);
[Kp3,Ti3,Td3,N3] = pidstddata(Crl3);

fprintf('Parametros del controlador 1:\nKp: %f\nTi: %f\nTd: %f\n\n',Kp1,Ti1,Td1);
fprintf('Parametros del controlador 1:\nKp: %f\nTi: %f\nTd: %f\n\n',Kp2,Ti2,Td2);
fprintf('Parametros del controlador 1:\nKp: %f\nTi: %f\nTd: %f\n\n',Kp3,Ti3,Td3);

%% Generacion del codigo del controlador

file = fopen( 'Controller.m', 'wt' );
code = ['function senalControl = Controller(in)\n\n'... 
'qr   = [in(1);  in(2);  in(3)];\n'... 
'q    = [in(4);  in(5);  in(6)];\n'... 
'qpr  = [in(7);  in(8);  in(9)];\n'... 
'qp   = [in(10); in(11); in(12)];\n'...  
'qppr = [in(13); in(14); in(15)];\n\n'... 
't = in(16);\n\n'];
fprintf(file,code);
comps = questdlg('¿Añadir Compensador?','Diseño','Si','No','No');
switch comps
    case 'Si'
        answer = questdlg('¿Modelo real o ideal?','Diseño','Ideal','Real','Ideal');
        switch answer
            case 'Ideal'
                load('modeloIdeal.mat');
            case 'Real'
                load('modeloReal.mat');
        end
        list = {'Compensador con q medida',...
                'Compensador con q de referencia',...
                'Compensador dynamico con q medida',...
                'Compensador dynamico con q referencia'};
        [indx,tf] = listdlg('PromptString','Selecionar Compensador','SelectionMode','single','ListSize',[350,70],'ListString',list);
    switch indx
        case 1
            % Compensador estatico con medidas
            fprintf(file,'q1 = q(1); q2 = q(2); q3 = q(3);\n');
        case 2
            % Compensador estatico con referencias
            fprintf(file,'q1 = qr(1); qr2 = q(2); qr3 = q(3);\n');
        case 3
            % Compensador dinamico con medidas
        case 4
            % Compensador dinamico con referencias
    end
    fprintf(file,'Ga = [%s;\n%s;\n%s];\n\n',char(G_num(1)),char(G_num(2)),char(G_num(3)));
    case 'No'
end
fprintf(file,'Kp = diag([%f\t%f\t%f]);\n',Kp1,Kp2,Kp3);
fprintf(file,'Ki = diag([Kp(1,1)/%f\tKp(2,2)/%f\tKp(3,3)/%f]);\n',Ti1,Ti2,Ti3);
fprintf(file,'Kd = diag([Kp(1,1)*%f\tKp(2,2)*%f\tKp(3,3)*%f]);\n\n',Td1,Td2,Td3);

code = ['persistent ek_i ek_1\n' ...
'Ts = 0.001;\n' ...
'%% Errores a cero\n' ...
'if(t<1e-8)\n' ...
'    ek_i = [0;0;0];     %% Error integral\n' ...
'    ek_1 = [0;0;0];     %% Error intante k-1\n' ...
'    senalControl = [0;0;0];\n' ...
'else\n\n' ...
'%% Calculo de errores proporcional (Parte proporcional)\n' ...
'ek = qr-q;\n\n' ...
'%% Calculo del error derivativo (Parte derivativa)\n' ...
'epk = qpr-qp;\n\n' ...
'%% Calculo del error integral (Parte integral) (Metodo trapezoidal)\n' ...
'ek_i = ek_i + (Ts/2)*(ek+ek_1);\n\n' ...
'%% Cálculo de la señal de control incremental generada por el controlador C(z)\n'];
fprintf(file,code);
switch comps
    case 'Si'
        fprintf(file,'Imk = Kp*ek + Kd*epk + Ki*ek_i + Ga;\n\n');
    case 'No'
        fprintf(file,'Imk = Kp*ek + Kd*epk + Ki*ek_i;\n\n');
end

code = ['%% Actualizamos error del instante k-1\n' ...
'ek_1 = ek;\n\n' ...
'senalControl = Imk;\n' ...
'disp(t);\n' ...
'end'];
fprintf(file,code);
fclose(file);
msg = sprintf(['Controladores generados:\n\n'...
    'Controlador 1:\nKp: %f\nTi: %f\nTd: %f\n\n' ...
    'Controlador 2:\nKp: %f\nTi: %f\nTd: %f\n\n' ...
    'Controlador 3:\nKp: %f\nTi: %f\nTd: %f\n'],Kp1,Ti1,Td1,Kp2,Ti2,Td2,Kp3,Ti3,Td3);
msgbox(msg);

