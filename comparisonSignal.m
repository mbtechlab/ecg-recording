%% plot ecg
clc
clear all

%% Export

wet = readmatrix("test5 wet 2.csv");
awet = wet(3400:5400,2)';
twet = (0:0.0025:5);


dry = readmatrix("test5 dry 4.csv");
adry = dry(6000:8000,2)';
tdry = (0:0.0025:5);


%% DAC
% Analog Value = (Digital Value / (2^ADC Resolution)) * Reference Voltage
% Resolution= 16bit, Reference V= 5V.

% awet = (awet./(2.^16)).*5000; %mV
% adry = (adry./(2.^16)).*5000;

%% Figure

figure
tiledlayout(2,1)

plot(nexttile,twet,awet,"LineWidth",1.5,'Color','r');
ylabel("Amplitude (mV)");
legend("Wet Electrode");
% xlim([0 4]);
% ylim([-100 100]);


plot(nexttile,tdry,adry,"LineWidth",1.5,'color','b');
xlabel("Time (s)");
ylabel("Amplitude (mV)");
legend("Dry Electrode");
% xlim([0 4]);
% ylim([-100 100]);




