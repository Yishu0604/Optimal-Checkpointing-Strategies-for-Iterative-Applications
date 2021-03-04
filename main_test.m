
clear
n=7;
P_total=[-4 -3 -2 -1 0];
%t=[255 871 588 459 3050 804 1130]; % application data
N=1e+3; % the total number of iterations

rng(1,'twister');
t=zeros(1,n*N);
t(1:7) = [255 871 588 459 3050 804 1130];

T=sum(t(1:7));

mu1=255;
sigma1=96.7;
t((1:999)*n+1) = max(0, normrnd(mu1,sigma1,[1 N-1])); 

t((1:999)*n+2) = 3.4 * t([1:999]*n+1);

mu3=588;
sigma3=76.8;
t((1:999)*n+3) = max(0, normrnd(mu3,sigma3,[1 N-1]));

mu4=459;
sigma4=48.1;
t((1:999)*n+4) = max(0, normrnd(mu4,sigma4,[1 N-1]));

mu5=3050;
sigma5=263;
t((1:999)*n+5) = max(0, normrnd(mu5,sigma5,[1 N-1]));

mu6=804;
sigma6=393;
t((1:999)*n+6) = max(0, normrnd(mu6,sigma6,[1 N-1]));

mu7=1130;
sigma7=568;
t((1:999)*n+7) = max(0, normrnd(mu7,sigma7,[1 N-1]));

C=[22.22 61.11 33.33 50 283.33 16.67 61.11];  
R=[8.89 24.44 13.33 20 113.33 6.67 24.44];
D=5;
ratio=zeros(5*100*6,1);
k_star_total=zeros(1,5);
p_opt_pattern_total=zeros(1,5);
time=zeros(1,5);

for i_total=1:5

    clearvars -except n P_total i_total t T C R D ratio k_star_total p_opt_pattern_total time N %p_save
    P = P_total(i_total)
    
    repeat_times=100;
    
    %load Faults_n_7_1e-3 F lambda
    eval(['load Faults_n_' num2str(n) '_1e' num2str(P) ' F lambda'])  
    
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
                    [temp3,temp4]=min([temp1,temp2]);
                    COST(i0+1,l+1,k+1,b+1)=temp3;
                    S(i0+1,l+1,k+1,b+1)=temp4;
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
        %W_pattern(i)=sum(t(w_index+1));
        r_index = w_index(1);
        r_index(r_index==0)=n;
        R_pattern(i)=R(r_index);
        c_index=w_index(end)+1;
        C_pattern(i)=C(c_index);
        %t_pattern(i)=exp(lambda*R_pattern(i))*(exp(lambda*(W_pattern(i)+C_pattern(i)))-1);
    end

    
    
    
    time(1,i_total)=toc;
    % SD_test = sum(t_pattern)/(p_opt_pattern*T);
    
    % patterns for three new YD huristics
    
    T_YD_C_max=sqrt(2*max(C)/lambda);
    sum_T_YD_C_max=0;
    ii=1;
    for i=1:n*N
        sum_T_YD_C_max=sum_T_YD_C_max+t(i);
        if sum_T_YD_C_max > T_YD_C_max
            W_pattern_YD_C_max(ii)=sum_T_YD_C_max;
            C_pattern_YD_C_max(ii)=C(mod(i-1,n)+1);
            R_pattern_YD_C_max(ii)=R(mod(i-1,n)+1);
            if ii==1
                w_length_pattern_YD_C_max(ii)=i;
            else
                w_length_pattern_YD_C_max(ii)=i-sum(w_length_pattern_YD_C_max(1:ii-1));
            end
            ii=ii+1;
            sum_T_YD_C_max=0;
        end
    end
    W_pattern_YD_C_max_last=N*T-sum(W_pattern_YD_C_max);
    W_pattern_YD_C_max(ii)=W_pattern_YD_C_max_last;
    C_pattern_YD_C_max(ii)=C(end);
    R_pattern_YD_C_max = [0, R_pattern_YD_C_max];
    w_length_pattern_YD_C_max(ii)= n*N-sum(w_length_pattern_YD_C_max);
    
    
    
    T_YD_C_mean=sqrt(2*mean(C)/lambda);
    sum_T_YD_C_mean=0;
    ii=1;
    for i=1:n*N
        sum_T_YD_C_mean=sum_T_YD_C_mean+t(i);
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
    R_pattern_YD_C_mean = [0, R_pattern_YD_C_mean];
    w_length_pattern_YD_C_mean(ii)= n*N-sum(w_length_pattern_YD_C_mean);
    
    
    
    T_YD_C_min=sqrt(2*min(C)/lambda);
    sum_T_YD_C_min=0;
    ii=1;
    for i=1:n*N
        sum_T_YD_C_min=sum_T_YD_C_min+t(i);
        if sum_T_YD_C_min>T_YD_C_min
            W_pattern_YD_C_min(ii)=sum_T_YD_C_min;
            C_pattern_YD_C_min(ii)=C(mod(i-1,n)+1);
            R_pattern_YD_C_min(ii)=R(mod(i-1,n)+1);
            if ii==1
                w_length_pattern_YD_C_min(ii)=i;
            else
                w_length_pattern_YD_C_min(ii)=i-sum(w_length_pattern_YD_C_min(1:ii-1));
            end
            ii=ii+1;
            sum_T_YD_C_min=0;
        end
    end
    W_pattern_YD_C_min_last=N*T-sum(W_pattern_YD_C_min);
    W_pattern_YD_C_min(ii)=W_pattern_YD_C_min_last;
    C_pattern_YD_C_min(ii)=C(end);
    R_pattern_YD_C_min = [0, R_pattern_YD_C_min];
    w_length_pattern_YD_C_min(ii)= n*N-sum(w_length_pattern_YD_C_min);
    

    k_seg = w{1}(1)+1;
    MS_opt_pattern=zeros(1,repeat_times);
    MS_each_segement=zeros(1,repeat_times);
    MS_p_YD=zeros(1,repeat_times);
    MS_each_iteration=zeros(1,repeat_times);
    MS_YD_C_max=zeros(1,repeat_times);
    MS_YD_C_mean=zeros(1,repeat_times);
    MS_YD_C_min=zeros(1,repeat_times);
    %p_save=zeros(1,i_total*repeat_times);
    for i_rep=1:repeat_times  
        
        [~,i_min_ckpt]=min(C);
        p=max(1,round(sqrt(2*C(i_min_ckpt)./lambda)/T));
        %p_save((i_total-1)*repeat_times+i_rep)=p;
        %MS_p_YD(i_rep) = simulation_p_YD_perturb(n,N,i_min_ckpt,p,F(i_rep,:),t,C,R,D); %checkpoint after p_YD period
        
        i_opt=i_min_ckpt;
        FFF=F(i_rep,:);
        WWW=t;
        
        t = 0; %time 
k = 1; %index of next iteration
m = 1; %index of next falut
t = t+sum(WWW(1:i_opt))+C(i_opt);
k_seg=mod(i_opt,n)+1;
%while k <= N 
while k_seg <= N*n
    %if k <= N-p+1 %the final incomplete iteration is more than p
    if k_seg <= (N-p)*n+1 %the final incomplete iteration is more than p
        %if  t+p*T+C(i_opt) <= F(m) %success of iteration i
        if  t+sum(WWW(k_seg:k_seg+p*n-1))+C(i_opt) <= FFF(m) %success of iteration i
            %t = t+p*T+C(i_opt);
            t = t+sum(WWW(k_seg:k_seg+p*n-1))+C(i_opt);
            k_seg=k_seg+p*n;
            k = k+p;  
        else %failure
            if  FFF(m)+D+R(i_opt) <= FFF(m+1) %no failure in recovery
                t = FFF(m)+D+R(i_opt);
                m = m+1;
            else %failure in recovery
                t = FFF(m+1);
                m = m+2;
                while t+D+R(i_opt) > FFF(m) %look for first successful recovery
                    t = FFF(m);
                    m = m+1;
                end
                t = t+D+R(i_opt);
            end
        end     
    else %the final incomplete iteration is less than m
        %if  t  + (N-k)*T + sum(W(i_opt+1:end)) +C(end) <= F(m) %success of iteration i
        if  t + sum(WWW(k_seg:end)) + C(end) <= FFF(m) %success of iteration i
            %t = t + (N-k)*T + sum(W(i_opt+1:end)) +C(end);
            t = t + sum(WWW(k_seg:end)) + C(end);
            k_seg = N*n+1;
            k = N+1;  
        else %failure
            if  FFF(m)+D+R(i_opt) <= FFF(m+1) %no failure in recovery
                t = FFF(m)+D+R(i_opt);
                m = m+1;
            else %failure in recovery
                t = FFF(m+1);
                m = m+2;
                while t+D+R(i_opt) > FFF(m) %look for first successful recovery
                    t = FFF(m);
                    m = m+1;
                end
                t = t+D+R(i_opt);
            end
        end        
    end
end

    end


end
