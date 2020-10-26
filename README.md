# Optimal-Checkpointing-Strategies-for-Iterative-Applications
This work provides an optimal checkpointing strategy to protect iterative applications from fail-stop errors.
We consider a very general framework, where the application repeats the same execution pattern by executing consecutive iterations, and where each iteration is composed of several tasks.
These tasks have different execution lengths and different checkpoint costs.  
Both the naive and Young/Daly strategies are suboptimal.
Our main contribution is to show that the optimal checkpoint strategy is globally periodic, and to design a dynamic programming algorithm that computes the optimal checkpointing pattern. This pattern may well checkpoint many different tasks, and this across many different iterations. We show through simulations, both from synthetic and real-life application scenarios, that the optimal strategy significantly outperforms the naive and Young/Daly strategies.

# code
gen_faults.m generate faults which obey the Expentional distribution    
main_GCR.m do the simulations for GCR application  
main_gopi.m do the simulations for the neuroscience application  
main_random.m do the simulations for the synthetic application  
simulation_each_iteration.m is a simulate function using CKPTEACHITER strategy    
simulation_each_segement.m is a simulate function using CKPTEACHTASK strategy   
simulation_optimal_pattern.m is a simulate function using the dynamic programming algorithm  
simulation__p_YD.m is a simulate function using CKPTYD strategy   
plot_three_strategies.R plot figures using ggplot2 in R studio    
