function main_random(n,type)
%n=10;
%type=1;
tic
P_total=[-3 -2 -1 0];
ratio=[];
k_star_total=zeros(1,4);
p_opt_pattern_total=zeros(1,4);

for i_total=1:4
    clearvars -except n P_total i_total p_save ratio k_star_total p_opt_pattern_total type %p_save
    P=P_total(i_total)
    repeat_times=100;
    N=1e+3; % the total number of iterations
    %load Faults_n_7_1e-2 F lambda
    eval(['load Faults_n_' num2str(n) '_1e' num2str(P) ' F lambda'])  
    
    MS_opt_pattern=zeros(1,repeat_times);
    MS_each_segement=zeros(1,repeat_times);
    MS_p_YD=zeros(1,repeat_times);
    MS_each_iteration=zeros(1,repeat_times);
    %p_save=zeros(1,i_total*repeat_times); 
    for i_rep=1:repeat_times 
        aa=100;
        bb=1000;
        rng(i_rep,'twister');
        t=aa+(bb-aa)*rand(1,n);
        T=sum(t);  %mu_D=(a+b)/2; %T=n*mu_D;
        if type==1
            C=0.1*t;  
        elseif type==2
            C=10+(100-10)*rand(1,n);
        else
            disp('Wrong Type!')
            return
        end
        R=C;
        D=5;  
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
        %SD_test = sum(t_pattern)/(p_opt_pattern*T);

        k_seg = w{1}(1)+1;
       
        MS_opt_pattern(i_rep) = simulation_optimal_pattern(N,F(i_rep,:),t,C,W_pattern,C_pattern,R_pattern,D,k_seg,n,w_length,i_w); %Ckpt optiaml
        MS_each_segement(i_rep) = simulation_each_segement(N,F(i_rep,:),t,C,R,D,n); %CkptALL
        [~,i_min_ckpt]=min(C);
        p=max(1,round(sqrt(2*C(i_min_ckpt)./lambda)/T));
        %p_save((i_total-1)*repeat_times+i_rep)=p;
        MS_p_YD(i_rep) = simulation_p_YD(N,i_min_ckpt,p,F(i_rep,:),t,C,R,D,T); %checkpoint after p_YD period
        MS_each_iteration(i_rep) = simulation_each_iteration(N,F(i_rep,:),C,R,D,T); %checkpoint after each iteration
    end

    ratio1 = MS_each_segement./MS_opt_pattern;
    ratio2 = MS_p_YD./MS_opt_pattern;
    ratio3 = MS_each_iteration./MS_opt_pattern;
    ratio = [ratio; ratio1'; ratio2'; ratio3'];
    
    k_star_total(i_total,i_rep)= k_star;
    p_opt_pattern_total(i_total,i_rep)= p_opt_pattern;
end
%csvwrite('data_GCR_n10_CCR2.csv',ratio,1,0)
eval(['csvwrite(''data_random_n' num2str(n) '_type' num2str(type) '.csv'',ratio,1,0)'])
%save data_GCR_n10_CCR2.mat n k_star_total p_opt_pattern_total ratio
eval(['save data_random_n' num2str(n) '_type' num2str(type) '.mat n k_star_total p_opt_pattern_total ratio'])
tt=toc