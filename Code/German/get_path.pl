#include('Draft_1_4.pl').

% Decision rule to classify if a person makes has a good credit risk
% lite_good_credit checks if the given input is a counterfactual when applied in conjunction with constraint(F,G)
% lite_good_credit^constraint is the implementation equivalent to is_counterfactual i.e. Algorithm 2.

    lite_good_credit(A,_,_,_,_):- A = 'no_checking_account'.
    lite_good_credit(A,B,C,D,E):- A \= 'no_checking_account', B \= 'all credits at this bank paid back duly', 
                                    D #=<21,E #> 428,not ab1(C,E).
    ab1(C,E):- C = 'car or other', E #=<1345. 




% Good credit instances
    good_credit(T1, A,B,C,D,E):-legal(T1,A,B,C,D,E), lite_good_credit(A,B,C,D,E).
    is_counterfactual(T1, A,B,C,D,E):-legal(T1,A,B,C,D,E), not lite_good_credit(A,B,C,D,E).
    

% Intervention
    
#show intervention/3.
    get_path(_,_,_,_,_,_,_,T1,A,B,C,D,E,F,G,T1,A,B,C,D,E,F,G,Opt,Opt):-legal(T1,A,B,C,D,E,F,G), constraint(F,G), not lite_good_credit(A,B,C,D,E).
    
    get_path(Z1,Z2,Z3,Z4,Z5,Z6,Z7,T1,A,B,C,D,E,F,G,TN,A1,B1,C1,D1,E1,F1,G1,Acc,Opt):- 
        %geq(C,C2),geq(F,F2)
        intervene(Z1,Z2,Z3,Z4,Z5,Z6,Z7,T1,A,B,C,D,E,F,G,T2,A2,B2,C2,D2,E2,F2,G2,Symbol)
        , anti_member([A2,B2,C2,D2,E2,F2,G2],Acc) 
        , legal(T1,A,B,C,D,E,F,G)
        , lite_good_credit(A,B,C,D,E)
        , get_path(Z1,Z2,Z3,Z4,Z5,Z6,Z7,T2,A2,B2,C2,D2,E2,F2,G2,TN,A1,B1,C1,D1,E1,F1,G1,[state(time(T2),[A2,B2,C2,D2,E2,F2,G2]),Symbol|Acc], Opt).




% Uncommenting this query will give you the path to the counterfactual state for the original input given by (A,...,G)
% T1 is the timestep of the original input. TN is the timestep of the counterfactual output given by (A1,...,G1)
?-  T1 #= 1, A = 'no_checking_account',B = 'all credits at this bank paid back duly',
    C = 'car or other', D = 7, E = 300, F =  'unemployed', G = 'unskilled-resident',
    get_path(1,1,1,1,1,1,1,T1,A,B,C,D,E,F,G,TN,A1,B1,C1,D1,E1,F1,G1,[state(time(T1),[A,B,C,D,E,F,G])],Opt).