
%% Simulacion

fprintf('Simulando...\n');
% Tiempo de muestreo del generador de trayecotrias
Ts_reference = 0.015;
% Tiempo de muestreo del control 
Ts_control = 0.001;
% Tiempo de simulacion
fin=8;
% Tiempo de muestreo para analisis 
ts = 0.001;

sim('SimulacionControl.slx');

fprintf('Fin simulacion.\n\n');

%% Graficamos resutlados

figure('units','normalized','outerposition',[0 0 1 1])
% Plot q1 vs qr1 vs qr1s
splt = subplot(3,2,1);
plt  = plot(t,q(:,1),'r',t,qr(:,1),'b',t,qrs(:,1),'k');
set(plt(1),'DisplayName','$q_1$','Color',[1 0 0]);
set(plt(2),'DisplayName','$q_1$ referencia');
set(plt(3),'DisplayName','$q_1$ ref. muestreado');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad');
xlabel('time');
grid;
% Plot q2 vs qr2
splt = subplot(3,2,3);
plt  = plot(t,q(:,2),'r',t,qr(:,2),'b',t,qrs(:,2),'k');
set(plt(1),'DisplayName','$q_2$','Color',[1 0 0]);
set(plt(2),'DisplayName','$q_2$ referencia');
set(plt(3),'DisplayName','$q_2$ ref. muestreado');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad');
xlabel('time');
grid;
% Plot q3 vs qr3
splt = subplot(3,2,5);
plt  = plot(t,q(:,3),'r',t,qr(:,3),'b',t,qrs(:,3),'k');
set(plt(1),'DisplayName','$q_3$','Color',[1 0 0]);
set(plt(2),'DisplayName','$q_3$ referencia');
set(plt(3),'DisplayName','$q_3$ ref. muestreado');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad');
xlabel('time');
grid;

% Error q1
splt = subplot(3,2,2);
plt = plot(t,q(:,1)-qrs(:,1));
set(plt(1),'DisplayName','Error de $q_1$');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad');
xlabel('time');
grid;
% Error q2
splt = subplot(3,2,4);
plt = plot(t,q(:,2)-qrs(:,2));
set(plt(1),'DisplayName','Error de $q_2$');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad');
xlabel('time');
grid;
% Error q3
splt = subplot(3,2,6);
plt = plot(t,q(:,3)-qrs(:,3));
set(plt(1),'DisplayName','Error de $q_3$');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad');
xlabel('time');
grid;

figure('units','normalized','outerposition',[0 0 1 1])
% Plot qd1 vs qdr1
splt = subplot(3,2,1);
plt  = plot(t,qd(:,1),'r',t,qdr(:,1),'b',t,qdrs(:,1),'k');
set(plt(1),'DisplayName','$\dot q_1$','Color',[1 0 0]);
set(plt(2),'DisplayName','$\dot q_1$ referencia');
set(plt(3),'DisplayName','$\dot q_1$ ref. muestreado');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad/s');
xlabel('time');
grid;
% Plot qd2 vs qdr2
splt = subplot(3,2,3);
plt  = plot(t,qd(:,2),'r',t,qdr(:,2),'b',t,qdrs(:,2),'k');
set(plt(1),'DisplayName','$\dot q_2$','Color',[1 0 0]);
set(plt(2),'DisplayName','$\dot q_2$ referencia');
set(plt(3),'DisplayName','$\dot q_2$ ref. muestreado');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad/s');
xlabel('time');
grid;
% Plot qd3 vs qdr3
splt = subplot(3,2,5);
plt  = plot(t,qd(:,3),'r',t,qdr(:,3),'b',t,qdrs(:,3),'k');
set(plt(1),'DisplayName','$\dot q_3$ ');
set(plt(2),'DisplayName','$\dot q_3$ referencia');
set(plt(3),'DisplayName','$\dot q_3$ ref. muestreado');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad/s');
xlabel('time');
grid;

% Error qd1
splt = subplot(3,2,2);
plt = plot(t,qd(:,1)-qdrs(:,1));
set(plt(1),'DisplayName','Error de $\dot q_1$ ');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad/s');
xlabel('time');
grid;
% Error qd2
splt = subplot(3,2,4);
plt = plot(t,qd(:,2)-qdrs(:,2));
set(plt(1),'DisplayName','Error de $\dot q_2$ ');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad/s');
xlabel('time');
grid;
% Error qd3
splt = subplot(3,2,6);
plt = plot(t,qd(:,3)-qdrs(:,3));
set(plt(1),'DisplayName','Error de $\dot q_3$ ');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad/s');
xlabel('time');
grid;

figure('units','normalized','outerposition',[0 0 1 1])

% Corriente Im1
splt = subplot(3,2,1);
plt = plot(t(1:end-3),Im(:,1));
set(plt(1),'DisplayName','Corriente $Im_1$');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('Amperaje');
xlabel('time');
grid;
% Corriente Im2
splt = subplot(3,2,3);
plt = plot(t(1:end-3),Im(:,2));
set(plt(1),'DisplayName','Corriente $Im_2$');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('Amperaje');
xlabel('time');
grid;
% Corriente Im3
splt = subplot(3,2,5);
plt = plot(t(1:end-3),Im(:,3));
set(plt(1),'DisplayName','Corriente $Im_3$');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('Amperaje');
xlabel('time');
grid;

% Trayectoria de referencia vs medida
splt = subplot(3,2,[2 4]);
plt  = plot(xyz(:,2),xyz(:,3),'r',xyzr(:,2),xyzr(:,3),'b');
set(plt(1),'DisplayName','Trayectoria medida');
set(plt(2),'DisplayName','Trayectoria referencia');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('Y');
xlabel('Z');
grid;

splt = subplot(3,2,6);
plt  = plot(t(1:end-3),vecnorm((xyz-xyzr)')','b');
set(plt(1),'DisplayName','Error distancia');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('Metros');
xlabel('time');
grid;

%% Guardar controlador

answer = questdlg('¿Guardar Controlador?','Prompt','Si','No','Si');

switch answer
    case 'Si'
        uisave({'Crl1','Crl2','Crl3','Gs1','Gs2','Gs3','M_num','V_num','G_num','tipoControl'});
    case 'No'
end
