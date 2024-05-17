#include('Draft_1_4.pl').

	
#show rule_1/1, rule_2/1, rule_3/2, rule_4/2, rule_5/2.
rule_1(A):- A = '2'.
rule_2(B):- B = low.
rule_3(C,D):- C = vhigh, D = vhigh.
rule_4(C,D):- C \= low, C \= med, D = vhigh.
rule_5(C,D):- C = vhigh, D = high.

% Decision rule to classify if a is a car is rejected from consideration

    #show lite_reject/4, not lite_reject/4.
	lite_reject(A,_,_,_):- rule_1(A).
	lite_reject(_,B,_,_):- rule_2(B).
	lite_reject(_,_,C,D):- rule_3(C,D).
	lite_reject(_,_,C,D):- rule_4(C,D).
	lite_reject(_,_,C,D):- rule_5(C,D).

  
% get_paths
    get_path(_,_,_,_,T1,A,B,C,D,T1,A,B,C,D,Opt,Opt):-legal(T1,A,B,C,D), not lite_reject(A,B,C,D).
    
    get_path(Z1,Z2,Z3,Z4,T1,A,B,C,D,TN,A1,B1,C1,D1,Acc,Opt):- intervene(Z1,Z2,Z3,Z4,T1,A,B,C,D,T2,A2,B2,C2,D2,Symbol)
        , anti_member([A2,B2,C2,D2],Acc) 
        , legal(T1,A,B,C,D)
        , lite_reject(A,B,C,D)
        , get_path(Z1,Z2,Z3,Z4,T2,A2,B2,C2,D2,TN,A1,B1,C1,D1,[state(time(T2),[A2,B2,C2,D2]),Symbol|Acc], Opt).




% Obtain instances of the original decision
?-legal(1,A,B,C,D), lite_reject(A,B,C,D).


% Obtain instances of the counterfactual decision
?-legal(2,A1,B1,C1,D1), not lite_reject(A1,B1,C1,D1).

% Get path to the counterfactual
?- A = '2', B = med, C = med, D = med, get_path(1,1,1,1,1,A,B,C,D,TN,A1,B1,C1,D1,[state(time(1),[A,B,C,D])],X).


