
addpath('F:\Richard\Documents\Documents\Universidad\4º GIERM\Asignaturas nuevas\CPR\Proyecto - CPR\robotics_toolbox')

startup_rvc
L0=0.4;
L1=0.5;
L2=1;
L3=0.5;
L(1)= Link([  0     L0    0       0    , 0]);
L(2)= Link([  0     L1    0      pi/2  , 0]);
L(3)= Link([  0     0    L2       0    , 0]); 
L(4)= Link([  0     0    L3       0    , 0]);   

%Unimos las articulaciones para formar el brazo
robot=SerialLink(L);