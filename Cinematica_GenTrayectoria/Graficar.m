

figure;


splt = subplot(3,1,1);
plt = plot(t,q(:,1),t,q(:,2),t,q(:,3));
set(plt(1),'DisplayName','Articulacion $q_1$');
set(plt(2),'DisplayName','Articulacion $q_2$');
set(plt(3),'DisplayName','Articulacion $q_3$');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
grid;
xlabel('t');
ylabel('rad');

splt = subplot(3,1,2);
plt = plot(t,qd(:,1),t,qd(:,2),t,qd(:,3));
set(plt(1),'DisplayName','Articulacion $\dot q_1$');
set(plt(2),'DisplayName','Articulacion $\dot q_2$');
set(plt(3),'DisplayName','Articulacion $\dot q_3$');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
grid;
xlabel('t');
ylabel('rad/s');

splt = subplot(3,1,3);
plt = plot(t,qdd(:,1),t,qdd(:,2),t,qdd(:,3));
set(plt(1),'DisplayName','Articulacion $\ddot q_1$');
set(plt(2),'DisplayName','Articulacion $\ddot q_2$');
set(plt(3),'DisplayName','Articulacion $\ddot q_3$');
leg = legend(splt,'show');
set(leg,'Interpreter','latex');
grid;
xlabel('t');
ylabel('rad/s²');


