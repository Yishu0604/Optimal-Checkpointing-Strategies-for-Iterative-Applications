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
main_random_varyingeta.m do the simulations for the synthetic application (varying eta)
main_gopi_perturb.m do the simulations for the neuroscience application (perturbation)  
main_gopi_scability.m do the simulations for the neuroscience application (scability) 
ratio_bar_plot.m compute data of bar plot
simulation_YD_C_max.m is a simulate function using a strategy like CKPTAVE but takes C_YD as maximal   
simulation_YD_C_mean.m is a simulate function using CKPTAVE strategy    
simulation_YD_C_min.m is a simulate function using a strategy like CKPTAVE but takes C_YD as minimal   
simulation_each_iteration.m is a simulate function using CKPTEACHITER strategy      
simulation_each_segement.m is a simulate function using CKPTEACHTASK strategy     
simulation_optimal_pattern.m is a simulate function using the dynamic programming algorithm  
simulation_p_YD.m is a simulate function using CKPTYDPER strategy   
simulation_each_iteration_perturb.m is a simulate function using CKPTEACHITER strategy (perturbation)    
simulation_each_segement_perturb.m is a simulate function using CKPTEACHTASK strategy (perturbation)    
simulation_optimal_pattern_perturb.m is a simulate function using the dynamic programming algorithm (perturbation)  
simulation_p_YD_perturb.m is a simulate function using CKPTYDPER strategy   
task_bound.m compute the number of tasks of the upper bound and real in use of the optimal pattern
all_figures.R plot figures using ggplot2 in R studio      



