
#include('Draft_1_2.pl').



% As long as the feature values for marital_status, relationship and gender are in the domain, it is legal
% Verified- Works
%#show legal/7, not legal/7.
% CANNOT USE ANY STRUCTURE AS THEY DO NOT PRODUCE SAME NUIMBER OF NOT SOLUTIONS.

legal(X, PERSONS, MAINT, BUYING, SAFETY) :-
   persons(X,PERSONS), 
   maint(X,MAINT),
   buying(X,BUYING),
   safety(X,SAFETY).

%?- legal(1,A,B,C,D).
