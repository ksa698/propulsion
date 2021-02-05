%% Props HW6 Problem 4c
%Calculate the variation in mass flow rate
%Values below are calculated using the Virginia Tech compressible flow calculator
Ta=217;
pa=2.65E3;

%% For Mach=2
% Oblique Shock Values 1-2
p_rat21= 2.19465313;
t_rat21=1.26937635;

% Normal Shock Values 2-3
M2=0.72121947;
p_rat32=2.27177835;
t_rat32=1.28440097;

% Values
P3=p_rat21*p_rat32*pa;  %Pa
T3=t_rat21*t_rat32*Ta;  %K
M3=M2;
rho3=P3/(287*T3);       %kg/m^3
h=30-29.6*tand(15);     %m
A3=(h/100)*cosd(15);    %m^2
u3a=M3*sqrt(1.4*287*T3); %m/s

mdot2=rho3*A3*u3a;
disp('Mass flow rate [kg/s] of M=2 is: ')
disp(mdot2)

%% For Mach=3
% Oblique Shock Values 1-2
p_rat21=2.82156232;
t_rat21=1.38825750;

% Normal Shock Values 2-3
M2=0.53993390;
p_rat32=5.76534844;
t_rat32=1.90579794;

% Values
P3=p_rat21*p_rat32*pa;  %Pa
T3=t_rat21*t_rat32*Ta;  %K
M3=M2;
rho3=P3/(287*T3);       %kg/m^3
h=30-47.6*tand(15);     %m
A3=(h/100)*cosd(15);    %m^2
u3b=M3*sqrt(1.4*287*T3); %m/s

mdot3=rho3*A3*u3b;
disp('Mass flow rate [kg/s] of M=3 is: ')
disp(mdot3)

%% Variance
disp('Variance of mass flow rate [kg/s] between M=3 and M=2 is:')

var=mdot3-mdot2;
disp(var)

%% Props HW6 Problem 4d
%air velocity downstream
disp('Downstream velocity [m/s] at M=2:')
disp(u3a)

disp('Downstream velocity [m/s] at M=3:')
disp(u3b)
