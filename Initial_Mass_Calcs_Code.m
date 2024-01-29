clear;
clc;
% This Code was written by Carlos Cielo in order to solve for HW4 in AE495

%%Problem 1:
% calculate the pack level weight fraction 
E = 3600*3; % endurance time (s)
v_true = 250*1.688; % true air speed (fps)
p_e = 0.8; % prop efficiency
LD = 20; % L/D ratio
sig_pac = 0.25*550*3600; % pack level specific energy (ftlb/s)

w_pac = ((v_true*E)/(p_e*sig_pac))*(1/LD); % weight fraction calculation

fprintf('Problem 1 battery pack level weight fraction: %.3f\n', w_pac);

%% Problem 2
% calculate the remaining weight fractions

%For eviation Alice
wo = 13970; % max takeoff weight (lb)
wpay = 2200; % payload weight (lb)
peep = 200; % weight of single crew member (lb)
wbatt = 8800; % battery weight (lb)         
we = wo-wpay-wbatt; % empty weight(lb)

v_alice = 260*1.688; % cruise speed estimate for alice (s)
E_alice = 3.25*3600; % endurance estimate for alice (s)
sig_pac_alice = 0.25550*3600; % pack level specific energy for alice(hphr/lb)


w_pac_alice = 100*((v_alice*E_alice)/(p_e*sig_pac))*(1/LD); % Alice weight fraction calculation, L/D is not changing

w_epmt = we/wo;% Empty Weight Percent
w_epmt_perc = w_epmt*100;

w_pay = wpay/wo; % Payload - crew Weight Percent
w_pay_perc = w_pay*100;

w_crew = (peep*2)/wo; % Crew Weight Percent
w_crew_perc = w_crew*100;

w_batt = wbatt/wo; % Battery Weight Percent
w_batt_perc = w_batt*100;

x = [w_epmt_perc w_pay_perc w_crew_perc w_batt_perc];% Alice weight fraction graph
label = {'Empty','Payload','Crew','Battery'};
pie(x,label)
title('Alice Weight Fraction')

fprintf('Alice calculated battery pack weight percent: %.1f%%\n',w_pac_alice);
fprintf('Alice empty weight percent: %.1f%%\n',w_epmt_perc);
fprintf('Alice payload weight percent: %.1f%%\n',w_pay_perc);
fprintf('Alice crew weight percent: %.1f%%\n',w_crew_perc);
fprintf('Alice battery weight percent: %.1f%%\n',w_batt_perc);

fprintf('\n These numbers are very difficult to achieve, in particular having the aircraft weight be 21.3%% \n of the total weight is very difficult and almost inatainable. In addition, \n The calculated battery pack percentage narrowly exceeds the one from \n the schematics indicating that the range may shorter than advertised \n\n')% Conclusion
%% Extra Credit
% calculate the pack level specific energy using the advertised battery
% weight

wbatt_alice = 8800; %battery weight (lb)

sig_pac_alice = ((v_alice*E_alice)/(p_e))*(1/LD)*(wo/wbatt_alice)*(1/(550*3600)); % Alice pack level specific energy (hphr/lb), L/D is not changing

fprintf('Alice pack level specific energy : %.4f hphr/lb \n ',sig_pac_alice);









