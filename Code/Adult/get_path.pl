#include('Draft_1_4.pl').

%final_state(T1,A,B,C):- capital_gain(T1,B),         education_num(T1,C),                                      marital_status(T1,A),       % New addition        not lite_le_50K(A,B,C).

% Decision rule to classify if a person makes ’<=50K/yr’
% not lite_le_50K^constraint is the imeplemantation equivalent to us_counterfactual()
	#show lite_le_50K/3, not lite_le_50K/3.
    %lite_le_50K(X,Y,Z) :- X = married_civ_spouse, Y #=< 5013.0, Z #=< 12.0.
    lite_le_50K(X,Y,_) :- X \= married_civ_spouse, Y #=< 6849.0.
	
    

% get_path function. Returns the path to the counterfactual
    

    get_path(_,_,_,_,_,_,T1,A,B,C,D,E,F,T1,A,B,C,D,E,F,Opt,Opt):-legal(T1,A,B,C,D,E,F), not lite_le_50K(A,B,C) , constraint(A,_,_,D,E,F).%constraint_reln_sex_age(D,E,F), constraint_ms_reln_age(A,D,F).
    
    get_path(Z1,Z2,Z3,Z4,Z5,Z6,T1,A,B,C,D,E,F,TN,A1,B1,C1,D1,E1,F1,Acc,Opt):- 
        geq(C,C2),geq(F,F2)
        ,intervene(Z1,Z2,Z3,Z4,Z5,Z6,T1,A,B,C,D,E,F,T2,A2,B2,C2,D2,E2,F2,Symbol)
        , anti_member([A2,B2,C2,D2,E2,F2],Acc) 
        , legal(T1,A,B,C,D,E,F)
        , lite_le_50K(A,B,C)
        , get_path(Z1,Z2,Z3,Z4,Z5,Z6,T2,A2,B2,C2,D2,E2,F2,TN,A1,B1,C1,D1,E1,F1,[state(time(T2),[A2,B2,C2,D2,E2,F2]),Symbol|Acc], Opt).




% Added Constraints: Education num cannot decrease
geq(X,Y):- Y#>=X. 


% Checks if given the mutability constraints, there exists a cf
% Object mut() if 1, the feature can be directly altered through an action. If 0, it CAN ONLY be altered through causal actions.
% To run it we first check if there does exist a counterfactual given a factual input and the mutability constraints. If not, there is no point
% trying to find a path since none exist.

no_possible_cf(mut(Z1,Z2,Z3,Z4,Z5,Z6),T1,A,B,C,D,E,F,A1,B1,C1,D1,E1,F1):-legal(T1,A,B,C,D,E,F),
    legal(_,A1,B1,C1,D1,E1,F1),
    serial_alter(mut(Z1,Z2,Z3,Z4,Z5,Z6),A,B,C,D,E,F,A1,B1,C1,D1,E1,F1),
    not lite_le_50K(A1,B1,C1,D1,E1,F1).

%?-  T1 #= 1, -A = never_married, B = 1000, C = 7, D = husband, E = male, F = 28, no_possible_cf(mut(1,1,1,1,1),T1, A,B,C,D,E,A1,B1,C1,D1,E1).


% Get paths
?-  T1 #= 1, A = never_married,B #= 1000,
    C #= 7, D = husband, E = male, F #= 28, no_possible_cf(mut(1,1,1,1,1,1),T1, A,B,C,D,E,F,_,_,_,_,_,_),
    get_path(Z1,Z2,Z3,Z4,Z5,Z6,T1,A,B,C,D,E,F,TN,A1,B1,C1,D1,E1,F1,[state(time(T1),[A,B,C,D,E,F])],Opt).

%?-A = never_married, B = 1000, C = 7, D = husband, E = male, F = 28, intervention(1,1,1,1,1,1,1,A,B,C,D,E,F,TN,A1,B1,C1,D1,male,28,[state(time(1),[A,B,C,D,E,F])],X).
