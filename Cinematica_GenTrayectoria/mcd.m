function xyz = mcd(q)
   
    PI = sym('pi');

    q1 = q(1);
    q2 = q(2);
    q3 = q(3);
    
    L0 = 0.4;
    L1 = 0.5;
    L2 =   1;
    L3 = 0.5;
% 
%     A01 = fun_MDH  ( 0  , L0 , 0  ,  0   );
%     A12 = fun_MDH  ( q1 , L1 , 0  , PI/2 );
%     A23 = fun_MDH  ( q2 , 0  , L2 ,  0   );
%     A34 = fun_MDH  ( q3 , 0  , L3  , 0   );
% 
%     A04 = A01*A12*A23*A34;
% 
%     T =vpa(A04);
%     
%     xyz = T(1:3,4);
    
xyz = [  L2*cos(q1)*cos(q2) + L3*cos(q1)*cos(q2)*cos(q3) - 1.0*L3*cos(q1)*sin(q2)*sin(q3);
             L2*cos(q2)*sin(q1) + L3*cos(q2)*cos(q3)*sin(q1) - 1.0*L3*sin(q1)*sin(q2)*sin(q3);
             L0 + L1 + L2*sin(q2) + L3*cos(q2)*sin(q3) + L3*cos(q3)*sin(q2)];

    
end