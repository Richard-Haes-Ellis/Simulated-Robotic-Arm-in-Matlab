
%% Simulacion

fprintf('SImulando...\n');
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
grid;

% Error q1
subplot(3,2,2);
plot(t,q(:,1)-qrs(:,1));
ylabel('Error q1');
grid;
% Error q2
subplot(3,2,4);
plot(t,q(:,2)-qrs(:,2));
ylabel('Error q2');
grid;
% Error q3
subplot(3,2,6);
plot(t,q(:,3)-qrs(:,3));
ylabel('Error q3');
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
grid;
% Plot qd3 vs qdr3
splt = subplot(3,2,5);
plt  = plot(t,qd(:,3),'r',t,qdr(:,3),'b',t,qdrs(:,3),'k');
set(plt(1),'DisplayName','$\dot q_3$ ','Color',[1 0 0]);
set(plt(2),'DisplayName','$\dot q_3$ referencia');
set(plt(3),'DisplayName','$\dot q_3$ ref. muestreado');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
ylabel('rad/s');
grid;

% Error qd1
subplot(3,2,2);
plot(t,qd(:,1)-qdrs(:,1));
ylabel('Error qd1');
grid;
% Error qd2
subplot(3,2,4);
plot(t,qd(:,2)-qdrs(:,2));
ylabel('Error qd2');
grid;
% Error qd3
subplot(3,2,6);
plot(t,qd(:,3)-qdrs(:,3));
ylabel('Error qd3');
grid;


figure('units','normalized','outerposition',[0 0 1 1])

% Corriente Im1
subplot(3,2,1);
plot(t(1:end-3),Im(:,1));
ylabel('Corriente Im2');
grid;
% Corriente Im2
subplot(3,2,3);
plot(t(1:end-3),Im(:,2));
ylabel('Corriente Im2');
grid;
% Corriente Im3
subplot(3,2,5);
plot(t(1:end-3),Im(:,3));
ylabel('Corriente Im3');
grid;

% Trayectoria de referencia vs medida
subplot(3,2,[2 4 6]);
plot(xyz(:,2),xyz(:,3),'r',xyzr(:,2),xyzr(:,3),'b');
ylabel('Y');
xlabel('Z');
grid;

answer = questdlg('¿Guardar Controlador?','Prompt','Si','No','Si');

switch answer
    case 'Si'
        uisave({'Crl1','Crl2','Crl3','Gs1','Gs2','Gs3'});
    case 'No'
end
