n_water = 8.9*10^(-4);  % visc. of water, Pa.s or Ns/m2
r_lapd = 3.59*10^(-9); % hydrodynamic radius rp = 3.59 nm
kb = 1.38*10^(-23); %m2 kg s-1 K-1 Boltzmann const
T = 298; %K, 25 C
D_water = kb .* T ./(6 * 3.14 * n_water * r_lapd) *10^12 % DC in water in um2/s
MW_crowder = [40 70 100 150 200] *1000  % g/mol or Da
beta = -0.75;


%Values from paper
%eta = 0.51*10^(-9); % 0.51 nm
%rh = 42*10^(-9); %42 nm
a = 0.53;
rh = [2.85 3.55 4.08 4.78 5.34]*10^(-9);   %m, when crowder is 40 kDa on avg
rg = [2.21 2.75 3.16 3.7 4.14] *10^(-9);

c = 200 * 1000  %Low c g/m3   ---  200 mg/ml
c_star = MW_crowder./ (4/3 * 3.14 .* rg.^3 *6.023*10^23) % g/m3
%eta = rg .*(c./c_star).^beta
eta = 0.51*10^(-9); % 0.51 nm

f = ((eta./rh).^2 + (eta./r_lapd).^2).^(-a/2);
f_exp = exp(f)

n_cyto = n_water .* f_exp
D_cyto = D_water ./f_exp   % in um2/s

plot(MW_crowder,D_cyto)