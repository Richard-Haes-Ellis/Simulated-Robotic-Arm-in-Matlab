function qdd = modeloIdeal(in1,in2)
%MODELOIDEAL
%    QDD = MODELOIDEAL(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    31-Dec-2018 16:16:49

Im1 = in2(1,:);
Im2 = in2(2,:);
Im3 = in2(3,:);
q2 = in1(5,:);
q3 = in1(6,:);
qd1 = in1(1,:);
qd2 = in1(2,:);
qd3 = in1(3,:);
t2 = q2.*2.0;
t3 = q3.*2.0;
t4 = t2+t3;
t5 = sin(t4);
t6 = q3+t2;
t7 = sin(t6);
t8 = cos(q3);
t9 = sin(q3);
t10 = qd1.^2;
t11 = sin(t2);
t12 = t8.*4.533724588223511e32;
t13 = t8.^2;
t34 = t13.*7.654749236980359e31;
t14 = t12-t34+1.740258789400148e34;
t15 = 1.0./t14;
t16 = q2+q3;
t17 = cos(t16);
t18 = t5.*t10.*1.930277995596061e-1;
t19 = Im1.*2.5e1;
t20 = qd2.*t11.*3.890928248820887e16;
t21 = qd2.*t5.*3.477279704675156e15;
t22 = qd3.*t5.*3.477279704675156e15;
t23 = qd3.*t9.*8.749142379102285e15;
t24 = qd2.*t7.*1.749828475820457e16;
t25 = qd3.*t7.*8.749142379102285e15;
t26 = t20+t21+t22+t23+t24+t25-2.701390784177703e16;
t27 = qd1.*t26.*1.110223024625157e-16;
t28 = t19+t27;
t29 = t8.*8.749142379102285e15;
t30 = t29+2.878025402216719e15;
t31 = cos(t6);
t32 = cos(t2);
t33 = cos(t4);
t35 = qd3.*2.908731553317214e-1;
t36 = t17.*9.528942828018019;
t37 = t9.*t10.*4.856749657501538e-1;
t38 = qd2.^2;
t39 = t9.*t38.*9.713499315003077e-1;
t40 = t7.*t10.*4.856749657501538e-1;
t41 = Im3.*(-2.1e1./4.0)+t18+t35+t36+t37+t39+t40;
t42 = qd2.*7.42297471065036e-1;
t43 = t17.*9.528942828018018;
t44 = cos(q2);
t45 = t44.*4.898914516284991e1;
t46 = qd3.^2;
t47 = t7.*t10.*9.713499315003077e-1;
t48 = t10.*t11.*2.159899064502695;
t49 = Im2.*-1.2e1+t18+t42+t43+t45+t47+t48-t9.*t46.*9.713499315003077e-1-qd2.*qd3.*t9.*1.942699863000615;
t50 = t8.*5.83276158606819e15;
t51 = t50+2.016017727437454e17;
t52 = t31.*3.045154384989215e50;
t53 = t32.*6.771222083935876e50;
t54 = t33.*6.051366569263692e49;
t55 = t8.*4.425986018047797e50;
t56 = t8.*t31.*7.933240386000875e48;
t57 = t8.*t32.*1.76403970726927e49;
t58 = t8.*t33.*1.576502849721634e48;
t59 = t13.*-1.538074722808847e49+t52+t53+t54+t55+t56+t57+t58-t8.*t13.*1.339449819013315e48-t13.*t31.*1.339449819013315e48-t13.*t32.*2.978408004380701e48-t13.*t33.*2.661770416612944e47+5.300287521553107e51;
t60 = 1.0./t59;
qdd = [(t28.*1.801439850948198e16)./(t8.*1.749828475820457e16+t31.*1.749828475820457e16+t32.*3.890928248820887e16+t33.*3.477279704675156e15+3.045689269801113e17);t15.*t49.*-2.592953118726431e32+t15.*t30.*t41.*9.007199254740992e15+t28.*t30.*t60.*5.185906237452861e32;t15.*t30.*t49.*9.007199254740992e15-t15.*t41.*t51.*2.702159776422298e16-t28.*t51.*t60.*1.555771871235858e33];
