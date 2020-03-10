# advanced_optimisation
Project of group 3 for the 40.032 Advanced Optimisation course

# Group Members
Adarsh Kamdar
Lam Ying Sheng, Josh (me)
Voon Soo Jun
Ye Peng

# Problem Description
To get a better context, read the description under T3 Task Description. 

“Hipsters are a subculture of men and women typically in their 20s and 30s that value independent thinking, counter-culture, progressive politics, an appreciation of art and indie-rock, creativity, intelligence, and witty banter.” They often also love travelling and sharing about their new experiences. You can hear about “that amazing coffee” or “the mind-blowing organic Nasi Lemak with a twist” on their Insta account. We will have fun this term solving one of their pressing problems, how to visit a city and make the most of it. 


A friend whom you met during the overseas exchange program plans to visit Singapore during the spring break. In addition to sightseeing, he/she wants to taste the local food. Your friend asks you for suggestions on lodging, places of interests, and restaurants (or hawker centers).

Task 1:

Every project group has to suggest two hotels, name 20 attractions and five dining places in Singapore for your friend. For each suggestion, your friend wants to know its region (central (C), north (N), north-east (O), east (E), west (W), or unknown (U) ). For an attraction, your friend also wants to know the expected cost and if the activity is mostly indoor or outdoor. In addition, you can associate each suggestion with up to five key words.

Put your suggestion in a csv file. You can find the template on eDimension. Submit your csv file to me via email before 11:59 pm on Monday, Feb 7, 2020. Your file name and the email title are ATO_Group_X_T1, where X is the group number. The number of regions your suggestions span is a consideration in grading.


Based on your suggestions and his/her own research, your friend wants to stay at Hotel H1. Your friend also shortlists 24 attractions, and ten dining places in Singapore (refer to the appendix section on the last pages). Assume that your friend leaves the hotel at 9 am after breakfast and returns to the hotel before 9 pm. He/she spends one hour on meals. Lunch can take place between 12 noon and 2 pm and dinner between 6 and 8 pm. Your friend decides to spend exactly half an hour at each attraction visited (which is unrealistic, but for the purpose of the project only).

Knowing that you are taking a scheduling course, your friend asks you to schedule his/her one-day visit in Singapore from 9 am to 9 pm.

Task 2:

Construct a schedule that minimizes the total cost of transportation and attraction that satisfies the following:

•	Your friend leaves Hotel 1 no earlier than 9 am and returns no later than 9 pm
•	Your friend cannot have meals at the same place. The meal duration is one hour and must fall in the respective interval (between 12 noon and 2 pm for lunch and between 6 and 8 pm for dinner)
•	Your friend spends exactly half an hour at every attraction visited
•	There is no visit to an outdoor attraction between 11 am and 4 pm
•	Your friend visits at least eight attractions of which at least three of them are outdoor 
•	You friend must visit at least two regions in addition to the region where the hotel belongs

Formulate the problem as a mathematical program by defining
•	the decision variables,
•	the objective function,
•	the constraints, and
•	the parameters.

Solve your program using AMPL. If the solver was not able to find an optimal solution in 30 minutes, report the best objective function value and the best found. If the solver does not find a feasible solution in 30 minutes, relax some of the constraints so that you can get a feasible solution in 30 minutes.

Task 3:

Assume instead that your friend stays for two days for this task. You can also choose the hotel(s) for him/her among the five hotels in the appendix. On the first day, it is possible to move to a second hotel, but your friend has to make a dedicated trip from the first hotel to the second because he/she does not want to carry all the luggage to visit the attractions. 

Suggest a schedule that maximizes the diversity of activities (up to your definition) during the two-day stay. You have to model a budget constraint in some way, so that you can present to your friend three schedules with low, medium, and high costs. You can take some or all of the relevant constraints in Task 2. You can come up with your own constraints that you think are important. Depending on the complexity of the problem you defined, you may choose either an exact solution method or a heuristic approach. 
