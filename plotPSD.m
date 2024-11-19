

clc
clear all

data=readmatrix('psd_data.csv');

freq=data(1:501,1);
dry=data(1:501,2);
wet=data(1:501,3);

figure()
plot(freq,dry,'color','b','LineWidth',1.5);
hold on
plot(freq,wet,'color','r','LineWidth',1.5);
hold off
legend('Dry Electrode','Wet Electrode');

figure()
plot(freq,dry,'color','b','LineWidth',1.5);
hold on
plot(freq,wet,'color','r','LineWidth',1.5);
axis([0,100,-90,0]);
hold off