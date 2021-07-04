%function main_random(n,type)
clear
n=10;
type=2;
P=1; %P=10^(-0.5)
P_total=[-3 -2 -1 0 1];
ratio=zeros(5*100*4,1);
k_star_total=zeros(1,5);
p_opt_pattern_total=zeros(1,5);
time=zeros(1,5);
%eta=0.1;
eta_total=[0.01 0.05 0.10 0.15 0.20];
barplot_data_total = [];

for i_total=1:5
    clearvars -except n P i_total p_save ratio k_star_total p_opt_pattern_total type time P_total eta eta_total barplot_data_total%p_save
    eta=eta_total(i_total);
    %P = P_total(i_total)
    
    repeat_times=100;
    N=1e+3; % the total number of iterations
    %load Faults_n_7_1e-2 F lambda
    eval(['load Faults_n_' num2str(n) '_1e' num2str(P) ' F lambda'])  

    aa=100;
    bb=1000;
    rng(1,'twister');
    t=aa+(bb-aa)*rand(1,n);
    T=sum(t);  %mu_D=(a+b)/2; %T=n*mu_D;
    if type==1
        C=eta*t;  
    elseif type==2
        C=eta*100+eta*900*rand(1,n);
    else
        disp('Wrong Type!')
        return
    end
    R=C;
    D=5;  
    
    tic
    M_star = sqrt(2*max(C)/lambda)+T;
    k_star = floor(M_star/T);
    W_total=zeros(n,2*(k_star+1)*n^2); 
    for i0=0:n-1
        W_total(i0+1,1)=t(mod(i0+1,n)+1);
        for k=2:2*(k_star+1)*n^2  
            W_total(i0+1,k)=W_total(i0+1,k-1)+t(mod(i0+k,n)+1);
        end
    end
    maxK=2*n*(k_star+1);
    COST=zeros(n,2*n^2*(k_star+1)+1,maxK+1,n+1);
    S=COST;
    %COST((0:n-1)+1,0+1,1+1,(1:n)+1)=0;
    for l=1:2*(k_star+1)*n^2 
        COST((0:n-1)+1,l+1,min(maxK,l+1)+1,(1:n)+1)=Inf;
        COST((0:n-1)+1,l+1,(1:min(maxK,l+1))+1,0+1)=Inf;
    end

    for l=1:2*(k_star+1)*n^2        
        for i0=0:n-1
            for k=min(maxK-1,l):-1:1
                for b=1:n
                    W=W_total(i0+1,k); 
                    temp1= COST(i0+1,l+1,k+1+1,b+1);
                    temp2 = exp(lambda*R(i0+1))*(exp(lambda*(W+C(mod(i0+k,n)+1)))-1) + COST(mod(i0+k,n)+1,l-k+1,1+1,b-1+1);             
                    [COST(i0+1,l+1,k+1,b+1),S(i0+1,l+1,k+1,b+1)]=min([temp1,temp2]);
                 end
             end
         end
    end
    COST_SD=COST(:,:,1+1,n+1);
    [SD,p_opt_pattern]=min(min(COST_SD(:,(1:2*n*(k_star+1))*n+1)./((1:2*n*(k_star+1))*T)));
    i0_opt_find=find(COST_SD(:,p_opt_pattern*n+1)/(p_opt_pattern*T)==SD,1);
    i0_opt = i0_opt_find-1;

    i_w=1;
    i0=i0_opt;
    k=1;
    l=p_opt_pattern*n;
    b=n;
    w_index=mod(i0+k,n);
    for i=1:p_opt_pattern*n
        if  S(i0+1,l+1,k+1,b+1) == 1 
            k=k+1;
            w_index=[w_index mod(i0+k,n)];
        else
            w{i_w}=w_index;
            i_w=i_w+1;
            i0=mod(i0+k,n);
            l=l-k;
            k=1;
            b=b-1;
            w_index=mod(i0+k,n);
        end
    end
    i_w=i_w-1;

    w_length=zeros(1,i_w);
    W_pattern=zeros(1,i_w);
    R_pattern=zeros(1,i_w);
    C_pattern=zeros(1,i_w);
    t_pattern=zeros(1,i_w);
    for i=1:i_w
        w_index=w{i};
        w_length(i)=length(w_index);
        W_pattern(i)=sum(t(w_index+1));
        r_index = w_index(1);
        r_index(r_index==0)=n;
        R_pattern(i)=R(r_index);
        c_index=w_index(end)+1;
        C_pattern(i)=C(c_index);
        t_pattern(i)=exp(lambda*R_pattern(i))*(exp(lambda*(W_pattern(i)+C_pattern(i)))-1);
    end
    time(1,i_total)=toc;
    SD_test = sum(t_pattern)/(p_opt_pattern*T);
    
%     T_YD_C_max=sqrt(2*max(C)/lambda);
%     sum_T_YD_C_max=0;
%     ii=1;
%     for i=1:n*N
%         sum_T_YD_C_max=sum_T_YD_C_max+t(mod(i-1,n)+1);
%         if sum_T_YD_C_max>T_YD_C_max
%             W_pattern_YD_C_max(ii)=sum_T_YD_C_max;
%             C_pattern_YD_C_max(ii)=C(mod(i-1,n)+1);
%             R_pattern_YD_C_max(ii)=R(mod(i-1,n)+1);
%             if ii==1
%                 w_length_pattern_YD_C_max(ii)=i;
%             else
%                 w_length_pattern_YD_C_max(ii)=i-sum(w_length_pattern_YD_C_max(1:ii-1));
%             end
%             ii=ii+1;
%             sum_T_YD_C_max=0;
%         end
%     end
%     W_pattern_YD_C_max_last=N*T-sum(W_pattern_YD_C_max);
%     W_pattern_YD_C_max(ii)=W_pattern_YD_C_max_last;
%     C_pattern_YD_C_max(ii)=C(end);
%     R_pattern_YD_C_max = [R(end), R_pattern_YD_C_max];
%     w_length_pattern_YD_C_max(ii)= n*N-sum(w_length_pattern_YD_C_max);
    
    
    
    T_YD_C_mean=sqrt(2*mean(C)/lambda);
    sum_T_YD_C_mean=0;
    ii=1;
    for i=1:n*N
        sum_T_YD_C_mean=sum_T_YD_C_mean+t(mod(i-1,n)+1);
        if sum_T_YD_C_mean>T_YD_C_mean
            W_pattern_YD_C_mean(ii)=sum_T_YD_C_mean;
            C_pattern_YD_C_mean(ii)=C(mod(i-1,n)+1);
            R_pattern_YD_C_mean(ii)=R(mod(i-1,n)+1);
            if ii==1
                w_length_pattern_YD_C_mean(ii)=i;
            else
                w_length_pattern_YD_C_mean(ii)=i-sum(w_length_pattern_YD_C_mean(1:ii-1));
            end
            ii=ii+1;
            sum_T_YD_C_mean=0;
        end
    end
    W_pattern_YD_C_mean_last=N*T-sum(W_pattern_YD_C_mean);
    W_pattern_YD_C_mean(ii)=W_pattern_YD_C_mean_last;
    C_pattern_YD_C_mean(ii)=C(end);
    R_pattern_YD_C_mean = [R(end), R_pattern_YD_C_mean];
    w_length_pattern_YD_C_mean(ii)= n*N-sum(w_length_pattern_YD_C_mean);
    
    
    
%     T_YD_C_min=sqrt(2*min(C)/lambda);
%     sum_T_YD_C_min=0;
%     ii=1;
%     for i=1:n*N
%         sum_T_YD_C_min=sum_T_YD_C_min+t(mod(i-1,n)+1);
%         if sum_T_YD_C_min>T_YD_C_min
%             W_pattern_YD_C_min(ii)=sum_T_YD_C_min;
%             C_pattern_YD_C_min(ii)=C(mod(i-1,n)+1);
%             R_pattern_YD_C_min(ii)=R(mod(i-1,n)+1);
%             if ii==1
%                 w_length_pattern_YD_C_min(ii)=i;
%             else
%                 w_length_pattern_YD_C_min(ii)=i-sum(w_length_pattern_YD_C_min(1:ii-1));
%             end
%             ii=ii+1;
%             sum_T_YD_C_min=0;
%         end
%     end
%     W_pattern_YD_C_min_last=N*T-sum(W_pattern_YD_C_min);
%     W_pattern_YD_C_min(ii)=W_pattern_YD_C_min_last;
%     C_pattern_YD_C_min(ii)=C(end);
%     R_pattern_YD_C_min = [R(end), R_pattern_YD_C_min];
%     w_length_pattern_YD_C_min(ii)= n*N-sum(w_length_pattern_YD_C_min);

    k_seg = w{1}(1)+1;
    MS_opt_pattern=zeros(1,repeat_times);
    MS_each_segement=zeros(1,repeat_times);
    MS_p_YD=zeros(1,repeat_times);
    MS_each_iteration=zeros(1,repeat_times);
%     MS_YD_C_max=zeros(1,repeat_times);
    MS_YD_C_mean=zeros(1,repeat_times);
%     MS_YD_C_min=zeros(1,repeat_times);
    %p_save=zeros(1,i_total*repeat_times); 
    for i_rep=1:repeat_times 
        
        MS_opt_pattern(i_rep) = simulation_optimal_pattern(N,F(i_rep,:),t,C,W_pattern,C_pattern,R_pattern,D,k_seg,n,w_length,i_w,R); %Ckpt optiaml
        MS_each_segement(i_rep) = simulation_each_segement(N,F(i_rep,:),t,C,R,D,n); %CkptALL
        [~,i_min_ckpt]=min(C);
        p=max(1,round(sqrt(2*C(i_min_ckpt)./lambda)/T));
        %p_save((i_total-1)*repeat_times+i_rep)=p;
        MS_p_YD(i_rep) = simulation_p_YD(N,i_min_ckpt,p,F(i_rep,:),t,C,R,D,T); %checkpoint after p_YD period
        MS_each_iteration(i_rep) = simulation_each_iteration(N,F(i_rep,:),C,R,D,T); %checkpoint after each iteration
        
%         MS_YD_C_max(i_rep) = simulation_YD_C_max(N,F(i_rep,:),W_pattern_YD_C_max,C_pattern_YD_C_max,R_pattern_YD_C_max,D,n,w_length_pattern_YD_C_max); %Ckpt_T_YD_C_max
        
        MS_YD_C_mean(i_rep) = simulation_YD_C_mean(N,F(i_rep,:),W_pattern_YD_C_mean,C_pattern_YD_C_mean,R_pattern_YD_C_mean,D,n,w_length_pattern_YD_C_mean); %Ckpt_T_YD_C_mean
        
%         MS_YD_C_min(i_rep) = simulation_YD_C_min(N,F(i_rep,:),W_pattern_YD_C_min,C_pattern_YD_C_min,R_pattern_YD_C_min,D,n,w_length_pattern_YD_C_min); %Ckpt_T_YD_C_mean
    end

    ratio1 = MS_each_segement./MS_opt_pattern;
    ratio2 = MS_p_YD./MS_opt_pattern;
    ratio3 = MS_each_iteration./MS_opt_pattern;
    
%     ratio4 = MS_YD_C_max./ MS_opt_pattern;
    ratio5 = MS_YD_C_mean./ MS_opt_pattern;
%     ratio6 = MS_YD_C_min./ MS_opt_pattern;
    
%     ratio(1+(i_total-1)*repeat_times*6:i_total*repeat_times*6,1) = [ratio1'; ratio2'; ratio3'; ratio4'; ratio5'; ratio6'];
ratio(1+(i_total-1)*repeat_times*4:i_total*repeat_times*4,1) = [ratio1'; ratio2'; ratio3'; ratio5'];
    
    k_star_total(i_total)= k_star;
    p_opt_pattern_total(i_total)= p_opt_pattern;
    
        %bar plot data
    %CKPTEACHITER
    reg_ckpt1 = N*C(end);
    MS_ave1 = mean(MS_each_iteration);
    
    %CKPTEACHTASK
    reg_ckpt2 = N*sum(C);
    MS_ave2 = mean(MS_each_segement);

    %CKPTYDCMEAN
    reg_ckpt3 = sum(C_pattern_YD_C_mean);
    MS_ave3 = mean(MS_YD_C_mean);

    %CKPTYD
    [C_min_ckpt,i_min_ckpt]=min(C);
    p=max(1,round(sqrt(2*C(i_min_ckpt)./lambda)/T));
    reg_ckpt4 = floor(N/p)*C_min_ckpt + C(end);
    MS_ave4 = mean(MS_p_YD);

    % CKPTOPT 
    task_number_before_first_ckpt = k_seg - 1;
    period =  floor((N*n-task_number_before_first_ckpt)/(p_opt_pattern*n));
    reg_ckpt5 = period*sum(C_pattern);
    task_number_after_last_period_ckpt = N*n-task_number_before_first_ckpt-period*sum(w_length);
    i_re = 1;
    task_nb_remaining = w_length(1);
    while task_nb_remaining < task_number_after_last_period_ckpt
        reg_ckpt5 = reg_ckpt5 + C_pattern(i_re);
        i_re = i_re + 1;
        task_nb_remaining = task_nb_remaining + w_length(i_re);
    end
    reg_ckpt5 = reg_ckpt5+C(end);
    MS_ave5 = mean(MS_opt_pattern);

    reg_ckpt = [reg_ckpt1 reg_ckpt2 reg_ckpt3 reg_ckpt4 reg_ckpt5];

    Basetime=1000*T;

    Waste1 = MS_ave1 - Basetime -  reg_ckpt1;
    Waste2 = MS_ave2 - Basetime -  reg_ckpt2;
    Waste3 = MS_ave3 - Basetime -  reg_ckpt3;
    Waste4 = MS_ave4 - Basetime -  reg_ckpt4;
    Waste5 = MS_ave5 - Basetime -  reg_ckpt5;
    Waste = [Waste1 Waste2 Waste3 Waste4 Waste5];

    barplot_data = [Waste reg_ckpt Basetime*ones(1,5)];
    barplot_data_total = [barplot_data_total barplot_data];
end
%csvwrite('data_random_n10_type1_temp.csv',ratio,1,0)
%eval(['csvwrite(''data_random_n' num2str(n) '_type' num2str(type) '_temp.csv'',ratio,1,0)'])
%save data_GCR_n10_CCR2.mat n k_star_total p_opt_pattern_total ratio

tt=toc


for i=1:5
    ratio_median_CKPTEACHTASK(i)=median(ratio((i-1)*400+1:(i-1)*400+100));
end

for i=1:5
    ratio_median_CKPTYDPER(i)=median(ratio((i-1)*400+101:(i-1)*400+200));
end

for i=1:5
    ratio_median_CKPTEACHITER(i)=median(ratio((i-1)*400+201:(i-1)*400+300));
end

for i=1:5
    ratio_median_CKPTYDAVE(i)=median(ratio((i-1)*400+301:(i-1)*400+400));
end

ratio_median=[ratio_median_CKPTEACHTASK ratio_median_CKPTYDPER ratio_median_CKPTEACHITER ratio_median_CKPTYDAVE]

eval(['save data_random_varyingeta_n' num2str(n) '_type' num2str(type) '_P' num2str(P) '.mat n k_star_total p_opt_pattern_total ratio time ratio_median barplot_data_total'])

for i_print = 1:20
     fprintf('%f',ratio_median(i_print))
     fprintf(',')
end
fprintf('\n')