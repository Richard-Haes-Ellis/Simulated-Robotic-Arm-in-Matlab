
    PI = sym('pi');
    
    syms q1 q2 q3 L0 L1 L2 L3 real

   

    A01 = fun_MDH  ( 0  , L0 , 0  ,  0   );
    A12 = fun_MDH  ( q1 , L1 , 0  , PI/2 );
    A23 = fun_MDH  ( q2 , 0  , L2 ,  0   );
    A34 = fun_MDH  ( q3 , 0  , L3  , 0   );

    A04 = A01*A12*A23*A34;

    T =vpa(A04);
    
    xyz = T(1:3,4)
    
    