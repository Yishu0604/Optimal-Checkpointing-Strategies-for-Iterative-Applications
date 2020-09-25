function [t] = simulation_p_YD(N,i_opt,p,F,W,C,R,D,T)

t = 0; %time 
k = 1; %index of next iteration
m = 1; %index of next falut
t = t+sum(W(1:i_opt))+C(i_opt);
while k <= N 
    if k <= N-p+1 %the final incomplete iteration is more than p
        if  t+p*T+C(i_opt) <= F(m) %success of iteration i
            t = t+p*T+C(i_opt);
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
        if  t  + (N-k)*T + sum(W(i_opt+1:end)) +C(end) <= F(m) %success of iteration i
            t = t  + (N-k)*T + sum(W(i_opt+1:end)) +C(end);
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