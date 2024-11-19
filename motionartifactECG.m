%% plot ecg
clc
clear all

%% Export

wet = readmatrix("test5 wet motionartifacts 2.csv");
awet = wet(:,2);
twet = wet(:,1);



dry = readmatrix("test5 dry motionartifacts 1.csv");
adry = dry(:,2);
tdry = dry(:,1);


%% Figure

figure
tiledlayout(2,1)

plot(nexttile,twet,awet,"LineWidth",1.5,'Color','r');
ylabel("Amplitude (mV)");
legend("Wet Electrode");



plot(nexttile,tdry,adry,"LineWidth",1.5,'color','b');
xlabel("Time (s)");
ylabel("Amplitude (mV)");
legend("Dry Electrode");





