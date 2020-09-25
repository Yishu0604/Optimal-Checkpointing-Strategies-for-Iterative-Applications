% random example 
clear
n=30;
a=100;
b=1000;
mu_D=(a+b)/2;
T=n*mu_D; %each iteration contains n segments
D=5;

P_temp=-4;
P = 10^(P_temp); %probability of error occurring in each iteration
lambda = -log(1-P)/T;
F = []; %generate faluts
for i=1:100
    ii = 1;
    F(i,1) = max(exprnd(1/lambda),D);
    while F(i,ii) < 10^(9)
        ii = ii+1;
        F(i,ii) = F(i,ii-1)+max(exprnd(1/lambda),D);
    end
end
%save Faults_P_10_1e-3
eval(['save Faults_n_' num2str(n) '_1e' num2str(P_temp) '.mat'])



% %GCR(k) example
% clear
% m=100000;
% n=10;
% for i=1:n
%     nonzero_A=27*m;
%     t(i) = (6*m-1)*(i-1)+19*m-4+2*nonzero_A;
% end
% D=5; 
% T=sum(t);
% P_temp=-0.1;
% P = 10^(P_temp); %probability of error occurring in each iteration
% lambda = -log(1-P)/T;
% F = []; %generate faluts
% for i=1:100
%     ii = 1;
%     F(i,1) = max(exprnd(1/lambda),D);
%     while F(i,ii) < 10^(12)
%         ii = ii+1;
%         F(i,ii) = F(i,ii-1)+max(exprnd(1/lambda),D);
%     end
% end
% % save Faults_P_10_1e-3
% eval(['save Faults_GCR_n_' num2str(n) '_1e' num2str(P_temp) '.mat'])



% %gopi example
% n=7;
% t=[255 871 588 459 3050 804 1130]; % application time
% T=sum(t);
% C=[22.22 61.11 33.33 50 283.33 16.67 61.11]; % 
% R=[8.89 24.44 13.33 20 113.33 6.67 24.44];
% D=5;
% 
% P_temp=-0.1;
% P = 10^(P_temp); %probability of error occurring in each iteration
% lambda = -log(1-P)/T;
% F = []; %generate faluts
% for i=1:100
%     ii = 1;
%     F(i,1) = max(exprnd(1/lambda),D);
%     while F(i,ii) < 10^(9)
%         ii = ii+1;
%         F(i,ii) = F(i,ii-1)+max(exprnd(1/lambda),D);
%     end
% end
% save Faults_P_10_1e-3
% eval(['save Faults_n_' num2str(n) '_1e' num2str(P_temp) '.mat'])