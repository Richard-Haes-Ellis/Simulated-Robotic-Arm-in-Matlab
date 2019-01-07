function senalControl = Controller(in)

qr   = [in(1);  in(2);  in(3)];
q    = [in(4);  in(5);  in(6)];
qpr  = [in(7);  in(8);  in(9)];
qp   = [in(10); in(11); in(12)];
qppr = [in(13); in(14); in(15)];

t = in(16);

q1 = q(1); q2 = q(2); q3 = q(3);
qd1 = qp(1); qd2 = qp(2); qd3 = qp(3);

Ma = [(8749142379102285*cos(2*q2 + q3))/9007199254740992 + (4863660311026109*cos(2*q2))/2251799813685248 + (869319926168789*cos(2*q2 + 2*q3))/4503599627370496 + (8749142379102285*cos(q3))/9007199254740992 + 304568926980111349/18014398509481984 0 0;
0 (8749142379102285*cos(q3))/4503599627370496 + 604805318231236341/9007199254740992 (8749142379102285*cos(q3))/9007199254740992 + 2878025402216719/9007199254740992;
28787562541836903/9007199254740992 (8749142379102285*cos(q3))/9007199254740992 + 2878025402216719/9007199254740992 28787562541836903/9007199254740992];

Ca = [-(qd1*(38909282488208872*qd2*sin(2*q2) + 3477279704675156*qd2*sin(2*q2 + 2*q3) + 3477279704675156*qd3*sin(2*q2 + 2*q3) + 8749142379102285*qd3*sin(q3) + 17498284758204570*qd2*sin(2*q2 + q3) + 8749142379102285*qd3*sin(2*q2 + q3) - 27013907841777028))/9007199254740992;
(6686021228173115*qd2)/9007199254740992 - (8749142379102285*qd3^2*sin(q3))/9007199254740992 + (8749142379102285*qd1^2*sin(2*q2 + q3))/9007199254740992 + (4863660311026109*qd1^2*sin(2*q2))/2251799813685248 + (869319926168789*qd1^2*sin(2*q2 + 2*q3))/4503599627370496 - (8749142379102285*qd2*qd3*sin(q3))/4503599627370496;
(1309976233964021*qd3)/4503599627370496 + (8749142379102285*qd1^2*sin(q3))/18014398509481984 + (8749142379102285*qd2^2*sin(q3))/9007199254740992 + (8749142379102285*qd1^2*sin(2*q2 + q3))/18014398509481984 + (869319926168789*qd1^2*sin(2*q2 + 2*q3))/4503599627370496];

Ga = [0;
(1716581734779868317*cos(q2 + q3))/180143985094819840 + (1378921849378812531*cos(q2))/28147497671065600;
(5364317921187089*cos(q2 + q3))/562949953421312];

R = diag([50.000000 30.000000 15.000000]);
K = diag([0.500000 0.400000 0.350000]);

Kp = diag([2420.934442	17109.539368	1861.913577]);
Ki = diag([Kp(1,1)/0.137525	Kp(2,2)/0.134791	Kp(3,3)/0.132876]);
Kd = diag([Kp(1,1)*0.034385	Kp(2,2)*0.033700	Kp(3,3)*0.033219]);

persistent ek_i ek_1
Ts = 0.001;
% Errores a cero
if(t<1e-8)
    ek_i = [0;0;0];     % Error integral
    ek_1 = [0;0;0];     % Error intante k-1
    senalControl = [0;0;0];
else

% Calculo de errores proporcional (Parte proporcional)
ek = qr-q;

% Calculo del error derivativo (Parte derivativa)
epk = qpr-qp;

% Calculo del error integral (Parte integral) (Metodo trapezoidal)
ek_i = ek_i + (Ts/2)*(ek+ek_1);

% Cálculo de la señal de control incremental generada por el controlador C(z)
Imk = Kp*ek + Kd*epk + Ki*ek_i + inv(R*K)*Ma*qppr + inv(R*K)*Ca + inv(R*K)*Ga;

% Actualizamos error del instante k-1
ek_1 = ek;

senalControl = Imk;
disp(t);
end