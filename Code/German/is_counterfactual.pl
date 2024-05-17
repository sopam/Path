#include('Draft_1_3.pl').
#include('Q.pl').
#include('C.pl').




is_counterfactual(A1,B1,C1,D1,E1,F1,G1):-legal(2,A1,B1,C1,D1,E1,F1,G1), constraint(F1,G1), not lite_good_credit(A1,B1,C1,D1,E1).
?-is_counterfactual(A1,B1,C1,D1,E1,F1,G1).


