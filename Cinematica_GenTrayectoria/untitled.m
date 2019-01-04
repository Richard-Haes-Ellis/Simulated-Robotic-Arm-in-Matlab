    iPos = [1.5   0   0.9];    % Start point
    fPos = [-0.5   -0.8   1.8];    % Stop  point
    sT   = 1;              % Start time
    tT   = 4;              % Trajectory time
    t    = 0;
   %velocidad y aceleraciones maximas de cada una de las articulaciones
    %V=[4 5 13];
    a=[50 70 190];
    
    
persistent s tau V


if(t<1e-8)
    syms x real;
    for i=1:1:3    
        s(i)=sign(in(i+3)-in(i));
        sol=solve((x^2)/a(i)+x*(-tT)+s(i)*(in(i+3)-in(i))==0)
        if(sol(1)>sol(2)) 
            V(i)=sol(2);
        else
            V(i)=sol(1);
        end
        tau(i)=V(i)/a(i);
        tau
        V
    end
end