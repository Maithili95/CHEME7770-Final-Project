%% Rxn 1 - LapD dimerisation

% Putting reactant LapD into crowded solution
rp = 3.59; %nm protein
rc = 2.89; %nm crowder
l = 2 * pi *rp;
c = 10^-3   %LapD conc, M
cl = c*l;
s = pi*rp^2;
phi = 0:0.01:0.7;
R = 8.314; % J/mol
T = 298; % K
K = 76335.87;
K = 1/KD;

%Putting reactant LapD into crowded soln. (one molecule)
a = (l*cl/2/pi + s*c)./(1-phi);
b = s*cl^2/4/pi./(1-phi).^2;
delF_crowd_LapD = R * T *(-log(1 - phi) + phi.*a + phi.*b)./1000 % kJ/mol, from dilute to crowded media

% LapD dimer formed in dilute solution
delF_LapD_dimer = R * T * log(KD) / 1000%kJ/mol delta G naught -- 20
%delF_LapD = -R * T * 0.0763/1000

%Assume LapD dimer formed and putting it into crowded solution

rp = 4.65; %nm protein (calc. for 140 kDa MW)
rc = 2.89; %nm crowder
l = 2 * pi *rp;
c = 10^-3   %LapD conc, M
cl = c*l;
s = pi*rp^2;

a = (l*cl/2/pi + s*c)./(1-phi);
b = s*cl^2/4/pi./(1-phi).^2;
delF_crowd_LapD_dimer = R * T .*(-log(1 - phi) + phi.*a + phi.*b)./1000 % kJ/mol, from dilute to crowded media


delFab = delF_LapD_dimer + delF_crowd_LapD_dimer - 2 .* delF_crowd_LapD

K_crowd = exp(-delFab/R/T)

plot(phi,(K_crowd./K))