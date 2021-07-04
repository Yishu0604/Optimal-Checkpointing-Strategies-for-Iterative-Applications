function [t] = simulation_p_YD_perturb(n,N,i_opt,p,F,W,C,R,D)

t = 0; %time 
k = 1; %index of next iteration
m = 1; %index of next falut
%t = t+sum(W(1:i_opt))+C(i_opt);
t_pre = sum(W(1:i_opt))+C(i_opt);
while 1 
    if t+t_pre <= F(m) %success of iteration i
        t = t+t_pre;
        break
    else %failure
        if  F(m)+D+R(end) <= F(m+1) %no failure in recovery
            t = F(m)+D+R(end);
            m = m+1;
        else %failure in recovery
            t = F(m+1);
            m = m+2;
            while t+D+R(end) > F(m) %look for first successful recovery
                t = F(m);
                m = m+1;
            end
            t = t+D+R(end);
        end
    end  
end


k_seg=mod(i_opt,n)+1;
%while k <= N 
while k_seg <= N*n
    %if k <= N-p+1 %the final incomplete iteration is more than p
    if k_seg <= (N-p)*n+1 %the final incomplete iteration is more than p
        %if  t+p*T+C(i_opt) <= F(m) %success of iteration i
        if  t+sum(W(k_seg:k_seg+p*n-1))+C(i_opt) <= F(m) %success of iteration i
            %t = t+p*T+C(i_opt);
            t = t+sum(W(k_seg:k_seg+p*n-1))+C(i_opt);
            k_seg=k_seg+p*n;
            k = k+p;  
        else %failure
            if  F(m)+D+R(i_opt) <= F(m+1) %no failure in recovery
                t = F(m)+D+R(i_opt);
                m = m+1;
            else %failure in recovery
                t = F(m+1);
                m = m+2;
                while t+D+R(i_opt) > F(m) %look for first successful recovery
                    t = F(m);
                    m = m+1;
                end
                t = t+D+R(i_opt);
            end
        end     
    else %the final incomplete iteration is less than m
        %if  t  + (N-k)*T + sum(W(i_opt+1:end)) +C(end) <= F(m) %success of iteration i
        if  t + sum(W(k_seg:end)) + C(end) <= F(m) %success of iteration i
            %t = t + (N-k)*T + sum(W(i_opt+1:end)) +C(end);
            t = t + sum(W(k_seg:end)) + C(end);
            k_seg = N*n + 1;
            k = N+1;  
        else %failure
            if  F(m)+D+R(i_opt) <= F(m+1) %no failure in recovery
                t = F(m)+D+R(i_opt);
                m = m+1;
            else %failure in recovery
                t = F(m+1);
                m = m+2;
                while t+D+R(i_opt) > F(m) %look for first successful recovery
                    t = F(m);
                    m = m+1;
                end
                t = t+D+R(i_opt);
            end
        end        
    end
end