clear
n=7;
P_total=[-4 -3 -2 -1 0];
t=[255 871 588 459 3050 804 1130]; % application data
T=sum(t);
C=[22.22 61.11 33.33 50 283.33 16.67 61.11];  
R=[8.89 24.44 13.33 20 113.33 6.67 24.44];
D=5;
ratio=zeros(5*100*6,1);
k_star_total=zeros(1,5);
p_opt_pattern_total=zeros(1,5);
time=zeros(1,5);

for i_total=1:5
    clearvars -except n P_total i_total t T C R D ratio k_star_total p_opt_pattern_total time %p_save
    P = P_total(i_total)
    
    repeat_times=100;
    N=1e+3; % the total number of iterations
    %load Faults_n_7_1e-3 F lambda
    eval(['load Faults_n_' num2str(n) '_1e' num2str(P) ' F lambda'])  
    MTBF=1/lambda
end

