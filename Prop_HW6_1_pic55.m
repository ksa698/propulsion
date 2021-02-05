%% HW 6 Problem 1
%a) optimum fan pressure ratio (pi_f) for pi_c=55, find sp_thrust, TSFC
%b) if pi_c=55, what are new pi_f, sp_thrust, TSFC

%% Constants
Ta=217; Pa=18E3; Ma=0.78; B=8.6;
Tmax=1750; T04=Tmax; 
eta_d=0.95; eta_n=0.97; eta_b=0.99; 
eta_pc=0.925; eta_pf=0.925; eta_pt=0.94; %polytropic efficiencies for compressor/fan
HR=45E6; rb=0.95; gc=1.4; gh=1.32; R=287;

%% Eqns pi_c=45
pi_c=55;
cpc=(gc/(gc-1))*R;  gc_=(gc-1)/2;
cph=(gh/(gh-1))*R;
u=Ma*sqrt(gc*R*Ta);
pi_f=linspace(1,2.64,1000);
%% FUNCTION WOOO
    T02=Ta*(1+gc_*Ma^2);
    divc=(gc-1)/gc;
    divh=(gh-1)/gh;
for i=1:length(pi_f) 
% Finding u7
    %finding T06
    Toc=T02*(pi_c^((gc-1)/(eta_pc*gc))-1);
    Tof=T02*(pi_f(i)^((gc-1)/(eta_pf*gc))-1);
    T03=T02+Toc;
    f=(T04-T03)/(eta_b*HR/cph-T04);
    Tot=(cpc*Toc+B*cpc*Tof)/((1+f)*cph);
    T06=(T04-abs(Tot));
    %findging T7s
        pi_t=(T06/T04)^(gh/(eta_pt*(gh-1)));
    rat06_7=pi_t*rb*pi_c*(1+eta_d*(gc-1)/2*Ma^2)^(gc/(gc-1));
    T7s=T06*(1/rat06_7)^divh;
    u7s=sqrt(2*cph*(T06-T7s));
    u7=u7s*sqrt(eta_n);

% Finding u17
T013=Tof+T02;
    rat016_17=pi_f(i)*(1+eta_d*gc_*Ma^2)^(1/divc);
T17s=T013*(1/rat016_17)^divc;

u17s=sqrt(2*cpc*(T013-T17s));
u17=u17s*sqrt(eta_n);

% Specific Thrust
sp_thrust(i)=(1/(1+B))*(((1+f)*u7-u)+B*(u17-u));
TSFC_(i)=f/(sp_thrust(i)*(1+B));
end

%% Final values
%Finding maximum sp_thrust and pi_f aka optimum
[sp_thrust_max, index] = max(sp_thrust);
pi_f_max = pi_f(index);
%Finding TSFC
TSFC=f/(sp_thrust_max*(1+B));

disp('Given pi_c the optimum pi_f is:')
disp(pi_f_max)
disp('The following specific thrust [m/s]:')
disp(sp_thrust_max)
disp('The following TSFC [kg/s /N]:')
disp(TSFC)

%% Plotting
yyaxis left
plot(pi_f,sp_thrust,'linewidth',1.5)
ylabel('Specific Thrust [m/s]')
hold on
plot(pi_f_max,sp_thrust_max,'o', 'MarkerFaceColor', 'r')
grid on
yyaxis right
plot(pi_f,TSFC_,'linewidth',1.5)
ylabel('TSFC [kg/s /N]')
title('Optimum fan pressure ratio for \pi_c=55')
xlabel('\pi_f')
xlim([1,3]) %since there are imaginary values before 1 and ~3