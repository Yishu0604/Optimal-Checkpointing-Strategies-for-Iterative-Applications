clear
tic
n=10;
CCR=2;
P_total=[-3 -2 -1 0 1];
ratio=[];
for i_total=1:5
    clearvars -except kk CCR P_total i_total p_save n ratio
    P=P_total(i_total)
    repeat_times=100;
    N=1e+3; % the total number of iterations
    %load Faults_10_1e-2 F lambda
    eval(['load Faults_GCR_n_' num2str(n) '_1e' num2str(P) ' F lambda']) 
    m=100000; 
    for i=1:n
        nonzero_A=27*m;
        t(i) = (6*n-1)*(i-1)+19*m-4+2*nonzero_A;
        if i<n
            C_memory(i)=(2*i+4)*m;
        else
            C_memory(i)=4*m;
        end
    end
    C=CCR*C_memory;
    R=C;
    D=5; 
    T=sum(t);

    M_star = sqrt(2*max(C)/lambda)+T;
    k_star = floor(M_star/T);
    W_total=zeros(n,2*k_star*n^2); %W_total=zeros(n,k_star*n);
    for i0=0:n-1
        W_total(i0+1,1)=t(mod(i0+1,n)+1);
        for k=2:2*k_star*n^2   %for k=2:k_star*n
            W_total(i0+1,k)=W_total(i0+1,k-1)+t(mod(i0+k,n)+1);
        end
    end
    S=[];
    COST=[];
    for i0=0:n-1
        for b=1:n
            COST(i0+1,1+1,0+1,b+1)=0;
        end
        for l=1:2*k_star*n^2       %for l=1:k_star*n
            for k=l:-1:1
                COST(i0+1,k+1,l+1,0+1)=Inf;
            end 
            for b=1:n
                COST(i0+1,l+1+1,l+1,b+1)=Inf;
            end
        end
    end
    for l=0:2*k_star*n^2        %for l=0:k_star*n
        for i0=0:n-1
            for k=l:-1:1
                for b=1:n
                    W=W_total(i0+1,k); %W = sum(t(mod(i0+[1:k],n)+1)); 
                    if  COST(i0+1,k+1+1,l+1,b+1) < exp(lambda*R(i0+1))*(exp(lambda*(W+C(mod(i0+k,n)+1)))-1) + COST(mod(i0+k,n)+1,1+1,l-k+1,b-1+1)
                        COST(i0+1,k+1,l+1,b+1) = COST(i0+1,k+1+1,l+1,b+1);
                        S(i0+1,k+1,l+1,b+1) = 0;
                    else
                        COST(i0+1,k+1,l+1,b+1) = exp(lambda*R(i0+1))*(exp(lambda*(W+C(mod(i0+k,n)+1)))-1) + COST(mod(i0+k,n)+1,1+1,l-k+1,b-1+1);
                        S(i0+1,k+1,l+1,b+1) = mod(i0+k,n)+1;
                    end
                end
            end
        end
    end

    SD = Inf;
    for i0 = 0:n-1
        for m = 1:k_star
            SD_temp = COST(i0+1,1+1,m*n+1,n+1)/(m*T);
            if SD_temp < SD
                SD = SD_temp;
            end
        end
    end

    for i=1:k_star
        i0_opt_find = find((abs(COST(:,1+1,i*n+1,n+1)-i*T*SD)/(i*T*SD))<1e-6);
        if any(i0_opt_find)==1
            p_opt_pattern = i;
            i0_opt = mod(min(mod(i0_opt_find,n))-1,n);         
            break
        end
    end


    i_w=1;
    i0=i0_opt;
    k=1;
    l=p_opt_pattern*n;
    b=n;
    w_index=[mod(i0+k,n)];
    for i=1:p_opt_pattern*n
        if  S(i0+1,k+1,l+1,b+1) == 0
            k=k+1;
            w_index=[w_index mod(i0+k,n)];
        else
            w{i_w}=w_index;
            i_w=i_w+1;
            i0=mod(i0+k,n);
            l=l-k;
            k=1;
            b=b-1;
            w_index=[mod(i0+k,n)];
        end
    end
    i_w=i_w-1;

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
        SD_test = sum(t_pattern)/(p_opt_pattern*T);

    for i_rep=1:repeat_times  
        MS_opt_pattern(i_rep) = simulation_optimal_pattern(N,F(i_rep,:),t,C,W_pattern,C_pattern,R_pattern,D,w,n,w_length,i_w); %Ckpt optiaml

        MS_each_segement(i_rep) = simulation_each_segement(N,F(i_rep,:),t,C,R,D,n); %CkptALL

        [~,i_min_ckpt]=min(C);
        p=max(1,round(sqrt(2*C(i_min_ckpt)./lambda)/T));
        p_save((i_total-1)*repeat_times+i_rep)=p;
        MS_p_YD(i_rep) = simulation_p_YD(N,i_min_ckpt,p,F(i_rep,:),t,C,R,D,T); %checkpoint after p_YD period

        MS_each_iteration(i_rep) = simulation_each_iteration(N,F(i_rep,:),C,R,D,T); %checkpoint after each iteration
    end

    ratio1 = MS_each_segement./MS_opt_pattern;
    ratio2 = MS_p_YD./MS_opt_pattern;
    ratio3 = MS_each_iteration./MS_opt_pattern;
    ratio = [ratio; ratio1'; ratio2'; ratio3'];
end
csvwrite('data1.csv',ratio,1,0)
tt=toc