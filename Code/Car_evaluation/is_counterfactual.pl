#include('Draft_1_3.pl').
#include('Q.pl').



is_counterfactual(A1,B1,C1,D1):-legal(2,A1,B1,C1,D1), not lite_reject(A1,B1,C1,D1).
?-is_counterfactual(A1,B1,C1,D1).