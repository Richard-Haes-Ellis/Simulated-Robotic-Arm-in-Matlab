
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
plot(t,qm(:,1),'r',tout,q(:,1));
title('q');
subplot1 = subplot(3,1,2);
plot1 = plot(t,qm(:,2),'r',tout,q(:,2));
set(plot1(1),'DisplayName','Estimated','Color',[1 0 0]);
set(plot1(2),'DisplayName','Real');
legend(subplot1,'show');
subplot(3,1,3);
plot(t,qm(:,3),'r',tout,q(:,3));

