
load('TrasferFunctions.mat');

uiopen('load');

% Fun. Trasf. para el problema de Regulacion
GbcPert1 = Gs1/(1+Gs1*Crl1);
GbcPert2 = Gs2/(1+Gs2*Crl2);
GbcPert3 = Gs3/(1+Gs3*Crl3);

% Fun. Trasf. para el problema de Seguimineto
Gbc1 = Crl1*Gs1/(1+Gs1*Crl1);
Gbc2 = Crl2*Gs2/(1+Gs2*Crl2);
Gbc3 = Crl3*Gs3/(1+Gs3*Crl3);

figure('units','normalized','outerposition',[0 0 1 1])
subplot(3,2,1);
step(Gbc1);
title('Seguimiento');
grid;
subplot(3,2,2);
step(GbcPert1);
title('Regulación');
grid;
subplot(3,2,3);
step(Gbc2);
title('Seguimiento');
grid;
subplot(3,2,4);
step(GbcPert2);mu
title('Regulación');
grid;
subplot(3,2,5);
step(Gbc3);
title('Seguimiento');
grid;
subplot(3,2,6);
step(GbcPert3);
title('Regulación');
grid;