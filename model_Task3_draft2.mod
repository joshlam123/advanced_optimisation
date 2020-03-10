set J; #jobs 1 - 38
param maxT;
param bigM;
param budget;
set T := 0..maxT by 10; #time intervals

param attractionCost{J}; #attraction cost Aj
param transportTime{J,J}; #time from j to k Tjk
param activityTime{J}; #processing time of activity j Pj
param distanceCost{J,J}; # transportation cost Mjk

set hotels := {1, 35, 36, 37, 38};
set nothotels := {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34};

set type_food := {12, 16}; 
set type_artmuseum := {13, 14, 23}; 
set type_flowers := {15, 22}; 
set type_play := {17, 21, 24, 26}; 
set type_park := {31, 32, 34}; 
set type_wildlife := {18, 27, 28, 33}; 
set type_island := {25, 29, 30}; 
set type_sciencemuseum := {19, 20}; 

var x{J,J,T} binary; #if reach job k from j at time t

minimize wewantdiversity: 
	(sum{j in type_food, k in J, t in T} x[j,k,t])^2 + (sum{j in type_artmuseum, k in J, t in T} x[j,k,t])^2 + 
	(sum{j in type_flowers, k in J, t in T} x[j,k,t])^2 + (sum{j in type_play, k in J, t in T} x[j,k,t])^2
	+ (sum{j in type_park, k in J, t in T} x[j,k,t])^2 + (sum{j in type_wildlife, k in J, t in T} x[j,k,t])^2
	+ (sum{j in type_island, k in J, t in T} x[j,k,t])^2 + (sum{j in type_sciencemuseum, k in J, t in T} x[j,k,t])^2;
	
subject to after_D1_9am {j in J}: sum{k in J, t in T} x[j,k,t]*(t - transportTime[j,k]) >= 0;
subject to before_D2_9pm {k in J}: sum{j in J, t in T} x[j,k,t]*t <= maxT;

subject to startathotel_D1 : sum{j in hotels, k in J, t in 0..300 by 10} x[j,k,t] = 1;
subject to endathotel_D1 : sum{j in J, k in hotels, t in 660..720 by 10} x[j,k,t] = 1; #reach hotel between 8pm to 9pm

subject to changehotel_D1 : sum{j in hotels, k in hotels, t in 660..720 by 10} x[j,k,t] <= 1; #can change hotel at most once on D1
subject to cannotchangehotel_D1 : sum{j in hotels, k in hotels, t in 0..650 by 10} x[j,k,t] = 0; #cannot change hotel on D1
subject to cannotchangehotel_D2 : sum{j in hotels, k in hotels, t in 730..maxT by 10} x[j,k,t] = 0; #cannot change hotel on D2

subject to startathotel_D2 : sum{j in hotels, k in J, t in 730..1020 by 10} x[j,k,t] = 1;
subject to endathotel_D2 : sum{j in J, k in hotels, t in 1320..1440 by 10} x[j,k,t] = 1;

subject to lunchtime_D1 : sum{j in J, k in 2..11, t in 180..240 by 10} x[j,k,t] = 1;
subject to dinnertime_D1 : sum{j in J, k in 2..11, t in 540..600 by 10} x[j,k,t] = 1;

subject to lunchtime_D2 : sum{j in J, k in 2..11, t in 900..960 by 10} x[j,k,t] = 1;
subject to dinnertime_D2 : sum{j in J, k in 2..11, t in 1260..1320 by 10} x[j,k,t] = 1;

subject to visitonceonly {k in nothotels}: sum{j in J, t in T} x[j,k,t] <= 1;
subject to leaveonceonly {j in nothotels}: sum{k in J, t in T} x[j,k,t] <= 1;
subject to norepeat {j in nothotels}: sum{t in T} x[j,j,t] = 0;
subject to oneinoneout {j in nothotels}: sum{i in J, t in T} x[i,j,t] = sum{k in J, t in T} x[j,k,t];

subject to oneactivityatatime {t in T}: sum{j in J, k in J, s in T: s >= max(0, t + 10 - activityTime[j]) && s <= t} x[j,k,s] <= 1;

subject to completebeforestart {j in 2..34}: sum{k in J, t in T} x[j,k,t]*(t - transportTime[j,k])>= sum{i in J, t in T} x[i,j,t]*(t + activityTime[j]);

subject to eightactivities_D1 : sum{j in J, k in 12..34, t in 0..720 by 10} x[j,k,t] >= 8;
subject to eightactivities_D2 : sum{j in J, k in 12..34, t in 730..1440 by 10} x[j,k,t] >= 8;

subject to budgetconstraint : sum{j in J, k in J, t in T} x[j,k,t] * (distanceCost[j,k] + attractionCost[j]) <= budget;

