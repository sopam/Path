% Causal Rules: Causal rule showing the effect of Feature 'Job' on the Feature values of 'Present Employment Since'

constraint(X,Y):- X = '<1_year', Y \= 'unemployed/unskilled-non-resident'.
constraint(X,Y):- X = '1=<_and_<4_years', Y \= 'unemployed/unskilled-non-resident'.
constraint(X,Y):- X = '4=<_and_<7_years', Y \= 'unemployed/unskilled-non-resident'.
constraint(X,Y):- X = '>=7_years', Y \= 'unemployed/unskilled-non-resident'.

constraint(X,Y):- X = 'unemployed', Y  = 'unemployed/unskilled-non-resident'.
