function [t] = simulation_YD_C_max(N,F,W_pattern_YD_C_max,C_pattern_YD_C_max,R_pattern_YD_C_max,D,n,w_length_pattern_YD_C_max)
t = 0; %time 
m = 1; %index of next falut
i=1; %index of next combined segment
k_seg=1;
while k_seg <= N*n  
    if  t+W_pattern_YD_C_max(i)+C_pattern_YD_C_max(i) <= F(m) %success of iteration i
        k_seg = k_seg+w_length_pattern_YD_C_max(i);
        t = t+W_pattern_YD_C_max(i)+C_pattern_YD_C_max(i);
        i=i+1;
    else %failure
        if  F(m)+D+R_pattern_YD_C_max(i) <= F(m+1) %no failure in recovery
            t = F(m)+D+R_pattern_YD_C_max(i);
            m = m+1;
        else %failure in recovery
            t = F(m+1);
            m = m+2;
            while t+D+R_pattern_YD_C_max(i) > F(m) %look for first successful recovery
                t = F(m);
                m = m+1;
            end
            t = t+D+R_pattern_YD_C_max(i);
        end
    end 
end