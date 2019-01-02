 

R1 = R(1,1);  
 R2 = R(2,2);
 R3 = R(3,3);

syms qd1 qd2 qd3 real
        
        B1 = diff(V_num(1),qd1)
        B2 = diff(V_num(2),qd2)    
        B3 = diff(V_num(3),qd3)
       
        pause();
        q1  = 0; q2  = 0; q3  = 0;
        qd1 = 0; qd2 = 0; qd3 = 0;
        
        A1 = eval(M_num(1,1))
        A2 = eval(M_num(2,2))
        A3 = eval(M_num(3,3))
        
        B1 = eval(B1)
        B2 = eval(B2)
        B3 = eval(B3)