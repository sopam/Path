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