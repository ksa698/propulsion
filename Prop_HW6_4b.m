%% Props HW6 Problem 3b
%Plot stagnation pressure ratio for combo of oblique and normal
M1=linspace(0,5,1000);
theta=15*pi/180;
%weak shock
for i=1:length(M1) 
    myfun=@(bet,thet) -tan(thet)+(2*cot(bet)*(M1(i)^2*sin(bet)^2-1)/((M1(i)^2*(1.4+cos(2*bet)))+2));
    thet=theta;
    fun=@(bet)myfun(bet,thet);
    %wave angle initial guess
        bet=fzero(fun,30*pi/180);
    %EQN
        Mn=M1(i)*sin(bet);
        rho_rat=((2.4)*Mn^2)/(2+(0.4*Mn^2));
        p_rat=1+(2.8/2.4)*(Mn^2-1);
        Mn2=sqrt((1+0.2*Mn^2)/(1.4*Mn^2-0.2));
        M2=(Mn2)/sin(bet-theta);
        s_rat=p_rat*(rho_rat)^-1;
        stag_p_rat=p_rat*(s_rat^-1)^3.5;
                    p1=p_rat;
            sp1=stag_p_rat;
MN=M2;
        rho_rat=((2.4)*MN^2)/(2+(0.4*MN^2));
        p_rat=1+(2.8/2.4)*(MN^2-1);
        Mn2=sqrt((1+0.2*MN^2)/(1.4*MN^2-0.2));
        M2=(Mn2)/sin(bet-theta);
        s_rat=p_rat*(rho_rat)^-1;
        stag_p_rat=p_rat*(s_rat^-1)^3.5;
            p3=p_rat;
            sp3=stag_p_rat;
    sp(i)=sp1*sp3;
end

plot(M1,sp,'linewidth',1.5)
hold on
plot(2,0.9,'o', 'MarkerFaceColor', 'r')
plot(3,0.54,'o', 'MarkerFaceColor', 'r')
grid on
title('Inlet: Stag Pressure Ratio vs Mach #')
xlabel('Mach')
ylabel('P03/P01')
xlim([2,5])