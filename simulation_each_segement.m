function [t] = simulation_each_segement(N,F,W,C,R,D,n)

t = 0; %time 
k = 1; %index of next iteration
m = 1; %index of next falut
t = t+W(1)+C(1);
i=2; %index of next divided segment
while k <= N  
    if  t+W(i)+C(i) <= F(m) %success of iteration i
        t = t+W(i)+C(i);
        i=i+1;
        if i > n
            k=k+1;
            i=1;
        end
    else %failure
        if  F(m)+D+R(i) <= F(m+1) %no failure in recovery
            t = F(m)+D+R(i);
            m = m+1;
        else %failure in recovery
            t = F(m+1);
            m = m+2;
            while t+D+R(i) > F(m) %look for first successful recovery
                t = F(m);
                m = m+1;
            end
            t = t+D+R(i);
        end
    end 
end