
#include('Draft_1_2_extra.pl').



% As long as the feature values for marital_status, relationship and gender are in the domain, it is legal
% Verified- Works
%#show legal/7, not legal/7.
% CANNOT USE ANY STRUCTURE AS THEY DO NOT PRODUCE SAME NUIMBER OF NOT SOLUTIONS.

legal(X, A,B,C,D,E,F,G) :-
   checking_account_status(X,A), 
   credit_history(X,B),
   property(X,C),
   duration_months(X,D),
   credit_amount(X,E),
   present_employment_since(X,F),
   job(X,G).

   %?- legal(1,A,B,C,D,E,F,G).
   %?- not legal(1,A,B,C,D,E).