function [t] = simulation_YD_C_mean(N,F,W_pattern_YD_C_mean,C_pattern_YD_C_mean,R_pattern_YD_C_mean,D,n,w_length_pattern_YD_C_mean)
t = 0; %time 
m = 1; %index of next falut
i=1; %index of next combined segment
k_seg=1;
while k_seg <= N*n  
    if  t+W_pattern_YD_C_mean(i)+C_pattern_YD_C_mean(i) <= F(m) %success of iteration i
        k_seg = k_seg+w_length_pattern_YD_C_mean(i);
        t = t+W_pattern_YD_C_mean(i)+C_pattern_YD_C_mean(i);
        i=i+1;
    else %failure
        if  F(m)+D+R_pattern_YD_C_mean(i) <= F(m+1) %no failure in recovery
            t = F(m)+D+R_pattern_YD_C_mean(i);
            m = m+1;
        else %failure in recovery
            t = F(m+1);
            m = m+2;
            while t+D+R_pattern_YD_C_mean(i) > F(m) %look for first successful recovery
                t = F(m);
                m = m+1;
            end
            t = t+D+R_pattern_YD_C_mean(i);
        end
    end 
end