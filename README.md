# Optimal-Checkpointing-Strategies-for-Iterative-Applications
This work provides an optimal checkpointing strategy to protect iterative applications from fail-stop errors.
We consider a very general framework, where the application repeats the same execution pattern by executing consecutive iterations, and where each iteration is composed of several tasks.
These tasks have different execution lengths and different checkpoint costs.  
Both the naive and Young/Daly strategies are suboptimal.
Our main contribution is to show that the optimal checkpoint strategy is globally periodic, and to design a dynamic programming algorithm that computes the optimal checkpointing pattern. This pattern may well checkpoint many different tasks, and this across many different iterations. We show through simulations, both from synthetic and real-life application scenarios, that the optimal strategy significantly outperforms the naive and Young/Daly strategies.

# code
gen_faults.m generate faults which obey the Expentional distribution  
simulation_static.m is a simulate function using static strategy  
simulation_dynamic.m is a simulate function using dynamic strategy  
test_Uniform.m do the simulations for iterations who obey Uniform distribution  
test_gamma.m do the simulations for iterations who obey Gamma distribution  
test_Nniform.m do the simulations for iterations who obey Normal distribution  
save_data.m and save_data_new.m save data as csv format  
R_final_plot.R plot figures using ggplot2 in R studio  
