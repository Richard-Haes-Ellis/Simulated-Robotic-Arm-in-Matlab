
figure;

subplot(3,1,1);
plot(tout,Im(:,1));
title('Corrientes');

subplot(3,1,2);
plot(tout,Im(:,2));

subplot(3,1,3);
plot(tout,Im(:,3));

figure;

subplot(3,1,1);
plot(t,qi(:,1),t,qr(:,1),tout,q(:,1));
title('q');
grid;
xlabel('t');
ylabel('rad');

subplot1 = subplot(3,1,2);
plot1 = plot(t,qi(:,2),t,qr(:,2),tout,q(:,2));
set(plot1(1),'DisplayName','Ideal');
set(plot1(2),'DisplayName','Real');
set(plot1(3),'DisplayName','Robot');
legend(subplot1,'show');
grid;
xlabel('t');
ylabel('rad');

subplot(3,1,3);
plot(t,qi(:,3),t,qr(:,3),tout,q(:,3));
grid;
xlabel('t');
ylabel('rad');