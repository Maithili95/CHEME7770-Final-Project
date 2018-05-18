n_water = 8.9*10^(-4);  % visc. of water, Pa.s or Ns/m2
r_lapd = 3.59*10^(-9); % hydrodynamic radius rp = 3.59 nm
kb = 1.38*10^(-23); %m2 kg s-1 K-1 Boltzmann const
T = 298; %K, 25 C
D_water = kb .* T ./(6 * 3.14 * n_water * r_lapd) *10^12 % DC in water in um2/s

%Values from paper
eta = 0.51*10^(-9); % 0.51 nm
%rh = 42*10^(-9); %42 nm
a = 0.53;
rh = 2.58*10^(-9);   %when crowder is 40 kDa on avg

f = ((eta./rh).^2 + (eta./r_lapd).^2).^(-a/2);
f_exp = exp(f);

n_cyto = n_water .* f_exp
D_cyto = D_water ./f_exp   % in um2/s
