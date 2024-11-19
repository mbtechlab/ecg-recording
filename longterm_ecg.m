%% plot long ecg
clc
clear all

%% Export

wet = readmatrix("test5 wet longdata 4.csv");
awet = wet(:,2)';
% twet = wet(:,1);
twet = (0:.0001:10-.0001);


dry = readmatrix("test5 dry longdata 2.csv");
adry = dry(:,2)';
% tdry = dry(:,1);
tdry = (0:.0001:10-.0001);


%% Figure

figure
tiledlayout(2,1)

plot(nexttile,twet,awet,"LineWidth",1.5,'Color','r')
ylabel("Amplitude (mV)");
legend("Wet Electrode");
xlim([0 10]);
ylim([1 3.5]);

plot(nexttile,tdry,adry,"LineWidth",1.5,'color','b')
xlabel("Time (s)");
ylabel("Amplitude (mV)");
legend("Dry Electrode");
xlim([0 10]);
ylim([1 3.5]);




