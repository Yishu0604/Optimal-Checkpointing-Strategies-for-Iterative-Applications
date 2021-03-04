function [t] = simulation_each_iteration_perturb(n,N,F,C,R,D,W)

t = 0; %time 
k = 1; %index of next iteration
m = 1; %index of next falut
k_seg=1;
%while k <= N 
while k_seg <= n*(N-1)+1 
    %if  t+T+C(end) <= F(m) %success of iteration i
    if  t+sum(W(k_seg:k_seg+n-1))+C(end) <= F(m) %success of iteration i
        %t = t+T+C(end);
        t = t+sum(W(k_seg:k_seg+n-1))+C(end);
        k_seg=k_seg+n;
        k = k+1;  
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