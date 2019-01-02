function q = mci(xyz,pose)

    x = xyz(1);
    y = xyz(2);
    z = xyz(3);
    
    L0 = 0.4;
    L1 = 0.5;
    L2 =   1;
    L3 = 0.5;
    
    r2 = x^2 + y^2;
    cosq3 = ( r2 + (z-(L1+L0))^2 -L2^2 -L3^2 )/( 2*L2*L3 );
    
    beta = atan( (z-(L1+L0)) / sqrt(r2) );
    
    if pose == 1
        q(3) = atan2( abs(sqrt(1-cosq3^2)) , cosq3 );
    else
        q(3) = atan2( -abs(sqrt(1-cosq3^2)) , cosq3 );
    end 
    
    alfa = atan2( L3*sin(q(3)) , (L2 + L3*cos(q(3))) );
    
    q(2)  = beta - alfa;
    q(1)  = atan2( ,x);
    
    q = q';
    
end