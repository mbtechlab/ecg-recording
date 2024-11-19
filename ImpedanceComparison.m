
clc;
clear all;
close all;

%% Wet Data

A1 = importdata('impedance wet 1.csv');
A2 = importdata('impedance wet 2.csv');
A3 = importdata('impedance wet 3.csv');
A4 = importdata('impedance wet 4.csv');
A5 = importdata('impedance wet 5.csv');

%% in this part, 50 hz noise is demonstrated manually
X1=(A1(60,13)-A1(70,13))/9;
X2=(A2(60,13)-A2(70,13))/9;
X3=(A3(60,13)-A3(70,13))/9;
X4=(A4(60,13)-A4(70,13))/9;
X5=(A5(60,13)-A5(70,13))/9;

for v=1:+1:9
    A1(60+v,13)=A1(60,13)-X1*v;
    A2(60+v,13)=A2(60,13)-X2*v;
    A3(60+v,13)=A3(60,13)-X3*v;
    A4(60+v,13)=A4(60,13)-X4*v;
    A5(60+v,13)=A5(60,13)-X5*v;
end
%% data are reduced into half

B1=zeros(76,13);
B2=zeros(76,13);
B3=zeros(76,13);
B4=zeros(76,13);
B5=zeros(76,13);

for c=1:+2:151
    B1((c+1)/2,:)=A1(c,:);
    B2((c+1)/2,:)=A2(c,:);
    B3((c+1)/2,:)=A3(c,:);
    B4((c+1)/2,:)=A4(c,:);
    B5((c+1)/2,:)=A5(c,:);
end
%% calculate standard deviation

Freq = B1(:,1);
Imp = [B1(:,13),B2(:,13),B3(:,13),B4(:,13),B5(:,13)];
Imp = Imp';
Mean_Imp = mean(Imp);
Std_Imp = std(Imp);
Ste_Imp = Std_Imp/5;

%% Dry Data
A1N = importdata('impedance dry 1.csv');
A2N = importdata('impedance dry 2.csv');
A3N = importdata('impedance dry 3.csv');
A4N = importdata('impedance dry 4.csv');
A5N = importdata('impedance dry 5.csv');

X1N=(A1N(60,13)-A1N(70,13))/9;
X2N=(A2N(60,13)-A2N(70,13))/9;
X3N=(A3N(60,13)-A3N(70,13))/9;
X4N=(A4N(60,13)-A4N(70,13))/9;
X5N=(A5N(60,13)-A5N(70,13))/9;

for s=1:+1:9
    A1N(60+s,13)=A1N(60,13)-X1N*s;
    A2N(60+s,13)=A2N(60,13)-X2N*s;
    A3N(60+s,13)=A3N(60,13)-X3N*s;
    A4N(60+s,13)=A4N(60,13)-X4N*s;
    A5N(60+s,13)=A5N(60,13)-X5N*s;
end

B1N=zeros(76,13);
B2N=zeros(76,13);
B3N=zeros(76,13);
B4N=zeros(76,13);
B5N=zeros(76,13);

for t=1:+2:151
    B1N((t+1)/2,:)=A1N(t,:);
    B2N((t+1)/2,:)=A2N(t,:);
    B3N((t+1)/2,:)=A3N(t,:);
    B4N((t+1)/2,:)=A4N(t,:);
    B5N((t+1)/2,:)=A5N(t,:);
end



ImpK = [B1N(:,13),B2N(:,13),B3N(:,13),B4N(:,13),B5N(:,13)];
ImpK = ImpK';
Mean_ImpK = mean(ImpK);
Std_ImpK = std(ImpK);
Ste_ImpK = Std_ImpK/5;

%% Plot 

figure()
errorbar(Freq,Mean_ImpK,Ste_ImpK,'LineWidth',1.5,'Color','b');
hold on
errorbar(Freq,Mean_Imp,Ste_Imp,'LineWidth',1.5,'Color','r');
set(gca,'Xscale','log');
legend('Dry Electrode','Wet Electrode');
xlabel('Frequency (Hz)');
ylabel('Impedance (k\Omega)');
xticklabels({'1' '10' '100' '1k' '10k'});
yticklabels([0 50 100 150 200 250]);
fontname(gcf,"Arial");


