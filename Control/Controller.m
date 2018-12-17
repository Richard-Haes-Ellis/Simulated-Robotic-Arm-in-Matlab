function senalControl = Controller(in)

qr   = [in(1);  in(2);  in(3)];
q    = [in(4);  in(5);  in(6)];
qpr  = [in(7);  in(8);  in(9)];
qp   = [in(10); in(11); in(12)];
qppr = [in(13); in(14); in(15)];

t = in(16);

q1 = q(1); q2 = q(2); q3 = q(3);
Ga = [0;
(1716581734779868317*cos(q2 + q3))/180143985094819840 + (1378921849378812531*cos(q2))/28147497671065600;
(5364317921187089*cos(q2 + q3))/562949953421312];

Kp = diag([19.000000	10.000000	8.800000]);
Ki = diag([Kp(1,1)/Inf	Kp(2,2)/Inf	Kp(3,3)/Inf]);
Kd = diag([Kp(1,1)*7.069546	Kp(2,2)*93.075326	Kp(3,3)*10.987823]);

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
Imk = Kp*ek + Kd*epk + Ki*ek_i + Ga;

% Actualizamos error del instante k-1
ek_1 = ek;

senalControl = Imk;
disp(t);
end