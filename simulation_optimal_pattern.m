function [t] = simulation_optimal_pattern(N,F,W,C,W_pattern,C_pattern,R_pattern,D,k_seg,n,w_length,i_w,R)
t = 0; %time 
%k_seg = w{1}(1)+1; %index of next segment
m = 1; %index of next falut
i=1; %index of next combined segment

if k_seg==1
    t_pre = 0;
else
    t_pre = sum(W(1:k_seg-1)) + C(k_seg-1);
end
% t = t+t_pre;

while 1
    if  t+t_pre <= F(m) %success of iteration i
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

while k_seg <= N*n  
    if  k_seg <= N*n-w_length(i)+1
        if  t+W_pattern(i)+C_pattern(i) <= F(m) %success of iteration i
            k_seg=k_seg+w_length(i);
            t = t+W_pattern(i)+C_pattern(i);
            i=i+1;
            if i > i_w
                i=1;
            end
        else %failure
            if  F(m)+D+R_pattern(i) <= F(m+1) %no failure in recovery
                t = F(m)+D+R_pattern(i);
                m = m+1;
            else %failure in recovery
                t = F(m+1);
                m = m+2;
                while t+D+R_pattern(i) > F(m) %look for first successful recovery
                    t = F(m);
                    m = m+1;
                end
                t = t+D+R_pattern(i);
            end
        end 
    else
       index_residue=mod(k_seg:N*n,n);
       index_residue(index_residue==0)=n;
       t_residue=sum(W(index_residue));
       if  t+t_residue+C(end)<= F(m) %success of iteration i
            t = t+t_residue+C(end);
            k_seg = N*n +1;
        else %failure
            if  F(m)+D+R_pattern(i) <= F(m+1) %no failure in recovery
                t = F(m)+D+R_pattern(i);
                m = m+1;
            else %failure in recovery
                t = F(m+1);
                m = m+2;
                while t+D+R_pattern(i) > F(m) %look for first successful recovery
                    t = F(m);
                    m = m+1;
                end
                t = t+D+R_pattern(i);
            end
        end  
    end
end
