% Putting reactant LapG into crowded solution 

rp = 2.1107; %nm protein
rc = 1;
%rc = 2.37; %nm crowder
r = rp/rc;
phi = 0:0.01:0.6;
R = 8.314; % J/mol
T = 298; % K
%K = 76335.87;
KD = 1*10^-3;
K = 1/KD;%weak binding to LapD

a1 = r.^3 + 3*r.^2;
a2 = 1.5 * (2 * r.^3 + 3 * r.^2);
a3 = 3 * r.^3;
q = phi./(1 - phi);
FA_crowd = R * T *(-log(1 - phi) + a1.*q + a2.*q.^2 + a3.*q.^3)/1000; % kJ/mol, from dilute to crowded media

% LapG-LapD dimer formed in dilute solution
FAB_naught = R*T*log(KD); %kJ/mol
%delF_LapD = -R * T * 0.0763/1000

%Putting LapD dimer from dilute to crowded media 
rp = 3.7164; %nm protein
rc = 1;
%rc = 2.37; %nm crowder
r = rp/rc;
%phi = 0;
R = 8.314; % J/mol
T = 298; % K
%K = 76335.87;
KD = 1*10^-3; %weak binding to LapD

a1 = r.^3 + 3*r.^2;
a2 = 1.5 * (2 * r.^3 + 3 * r.^2);
a3 = 3 * r.^3;
q = phi./(1 - phi);
FB_crowd = R * T *(-log(1 - phi) + a1.*q + a2.*q.^2 + a3.*q.^3)/1000; % kJ/mol, from dilute to crowded media

%Assume LapG-LapD complex formed and putting it into crowded solution

rp = 3.971; %nm protein
rc = 1; %nm crowder
r = rp/rc;
%phi = 0.3;
R = 8.314; % J/mol
T = 298; % K

a1 = r.^3 + 3*r.^2;
a2 = 1.5 * (2 * r.^3 + 3 * r.^2);
a3 = 3 * r.^3;
q = phi./(1 - phi);
FAB_crowd = R * T *(-log(1 - phi) + a1.*q + a2.*q.^2 + a3.*q.^3)/1000; % kJ/mol

Fab = FAB_naught + FAB_crowd - FA_crowd - FB_crowd

K_crowd = exp(-Fab/R/T)
x = K_crowd./K

plot(phi,(K_crowd./K));  
title('Effect of Crowding on LapG-LapD binding - r_c = 2.5 nm')
xlabel('Phi')
ylabel('K crowding / K')
%ylim([1 1.5]);
hold on

%%{
% Putting reactant LapG into crowded solution 

rp = 2.1107; %nm protein
rc = 1;
%rc = 2.37; %nm crowder
r = rp/rc;
phi = 0:0.01:0.6
R = 8.314; % J/mol
T = 298; % K
%K = 76335.87;
KD = 1*10^-3;
K = 1/KD;%weak binding to LapD

a1 = r.^3 + 3*r.^2;
a2 = 1.5 * (2 * r.^3 + 3 * r.^2);
a3 = 3 * r.^3;
q = phi./(1 - phi);
FA_crowd = R * T *(-log(1 - phi) + a1.*q + a2.*q.^2 + a3.*q.^3)/1000; % kJ/mol, from dilute to crowded media

% LapG-LapD dimer formed in dilute solution
FAB_naught = R*T*log(KD) %kJ/mol
%delF_LapD = -R * T * 0.0763/1000

%Putting LapD dimer from dilute to crowded media 
rp = 3.7164; %nm protein
rc = 1;
%rc = 2.37; %nm crowder
r = rp/rc;
%phi = 0;
R = 8.314; % J/mol
T = 298; % K
%K = 76335.87;
KD = 1*10^-3; %weak binding to LapD

a1 = r.^3 + 3*r.^2;
a2 = 1.5 * (2 * r.^3 + 3 * r.^2);
a3 = 3 * r.^3;
q = phi./(1 - phi);
FB_crowd = R * T *(-log(1 - phi) + a1.*q + a2.*q.^2 + a3.*q.^3)/1000; % kJ/mol, from dilute to crowded media

%Assume LapG-LapD complex formed and putting it into crowded solution

rp = 3.971; %nm protein
rc = 1; %nm crowder
r = rp/rc;
%phi = 0.3;
R = 8.314; % J/mol
T = 298; % K

a1 = r.^3 + 3*r.^2;
a2 = 1.5 * (2 * r.^3 + 3 * r.^2);
a3 = 3 * r.^3;
q = phi./(1 - phi);
FAB_crowd = R * T *(-log(1 - phi) + a1.*q + a2.*q.^2 + a3.*q.^3)/1000; % kJ/mol

Fab = FAB_naught + FAB_crowd - FA_crowd - FB_crowd

K_crowd = exp(-Fab/R/T)
x = K_crowd./K

%plot(phi,(K_crowd./K));  
title('Effect of Crowding on LapG-LapD binding')
xlabel('Phi')
ylabel('K crowding / K')
legend('r_c = 2.5','r_c = 5')
%ylim([1 2]);

%%}