function trayectoria_trap = trapezoi(in)

    iPos = [in(1); in(2); in(3)];    % Start point
    fPos = [in(4); in(5); in(6)];    % Stop  point
    sT   = in(7);              % Start time
    tT   = in(8);              % Trajectory time
    t    = in(9);
   %velocidad y aceleraciones maximas de cada una de las articulaciones
    %V=[4 5 13];
    a=[50 70 190];
    syms x tau q dq ddq real;
for i=1:1:3
    s(i)=sign(in(i+3)-in(i));
    sol=solve((x^2)/a(i)+x*(-tT-sT)+s(i)*(in(i+3)-in(i))==0);
    if(sol(1)>sol(2)) V(i)=sol(2);
    else V(i)=sol(1);
    end
    tau(i)=V(i)/a(i);
end
   % T(i)=s(i)*(in(i+3)-in(i))/V(i)+(V(i)/a(i));



for i=1:1:3
    if(t<sT)
       aux = mci(iPos,1)';
       q(i)=aux(i);
       dq(i)=0;
       ddq(i)=0;
       
    elseif(sT<t && t<=tau(i)+sT)
       q(i)=in(i)+s(i)*(a(i)/2)*t^2;
       dq(i)=2*s(i)*(a(i)/2)*t;
       ddq(i)=s(i)*a(i);
       
   elseif(tau(i)+sT<t && t<=(tT-tau(i)))
       q(i)=in(i)-s(i)*((V(i)^2)/(2*a(i)))+s(i)*V(i)*t;
       dq(i)=s(i)*V(i);
       ddq(i)=0;
     
   elseif (tT-tau(i)<t && t<tT+sT)
       q(i)=in(i+3)+s(i)*((-a(i)*T(i)^2)/2+a(i)*T(i)*t-a(i)/2*t^2);
       dq(i)=s(i)*(a(i)*T(i)-a(i)*t);
       ddq(i)=s(i)*(-a(i));
       
    elseif(t>sT+tT) 
       aux = mci(iPos,1)';
       q(i)=aux(i);
       dq(i)=0;
       ddq(i)=0;
   end
end   
% q
% dq
% ddq
trayectoria_trap=[q(1);q(2);q(3);dq(1);dq(2);dq(3);ddq(1);ddq(2);ddq(3)];       

end