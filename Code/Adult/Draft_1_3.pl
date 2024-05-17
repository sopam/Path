
#include('Draft_1_2_extra.pl').



% As long as the feature values for marital_status, relationship and gender are in the domain, it is legal
% Verified- Works
%#show legal/7, not legal/7.
% CANNOT USE ANY STRUCTURE AS THEY DO NOT PRODUCE SAME NUIMBER OF NOT SOLUTIONS.

legal(X, MARITAL_STATUS, CAPITAL_GAIN, EDUCATION_NUM, RELATIONSHIP, SEX, AGE) :-
   marital_status(X,MARITAL_STATUS), 
   capital_gain(X,CAPITAL_GAIN),
   education_num(X,EDUCATION_NUM),
   relationship(X,RELATIONSHIP),
   sex(X,SEX),
   age(X,AGE).

   %?- legal(1,A,B,C,D,E,F).
   %?- not legal(1,A,B,C,D,E,F).
%?- relationship(X,Y).