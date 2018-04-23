%%control plots
%%% Loading Data %%%%
%%This is a change maight be to be seen in gitHub?! 23.04.2018. 15:18 %%

load afdb_1;
rr1=rr;
targetsrr1=targetsRR;

load afdb_2;
rr2=rr;
targetsrr2=targetsRR;

load afdb_3;
rr3=rr;
targetsrr3=targetsRR;

load afdb_4;
rr4=rr;
targetsrr4=targetsRR;

%% Just Plotting %%%
figure(1)
hold on
plot(rr1);
plot(targetsrr1);
title('data 1');
legend('rr1', 'targetsrr1', 'DeltaRR1')
hold off

figure(2)
hold on;
plot(rr2)
plot(targetsrr2);
title('data 2');
legend('rr2', 'targetsrr2')
hold off

figure(3)
hold on
plot(rr3)
plot(targetsrr3)
title('data 3')
legend('rr3', 'targetsrr3')
hold off;


figure(4)
hold on
plot(rr4)
plot(targetsrr4)
title('data 4')
legend('rr4', 'targetsrr4')
hold off;