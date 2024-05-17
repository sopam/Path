
#include('Draft_1_3.pl').



%#show lite_direct/2, not lite_direct/2.
alter(0,X,X).
alter(1,X,Y).

serial_alter(mut(Z1,Z2,Z3,Z4,Z5,Z6),A,B,C,D,E,F,A1,B1,C1,D1,E1,F1):- alter(Z1,A,A1), alter(Z2,B,B1), alter(Z3,C,C1), alter(Z4,D,D1), alter(Z5,E,E1), alter(Z6,F,F1).

% Constraint rules identify causal relationships amongst features.
% They restrict the values taken for relationship(Y) and age(Z)
	constraint_ms_reln_age(married_civ_spouse,Y,Z):- Y = husband.
	constraint_ms_reln_age(married_civ_spouse,Y,Z):- Y = wife.
	constraint_ms_reln_age(never_married,Y,Z):- Y \= husband, Y\= wife, Z #=<29.

% Add the rule to catch all other cases
	constraint_ms_reln_age(X,Y,Z):- X\= married_civ_spouse, X\= never_married,
	Y \= husband, Y\= wife.

	

% Constraint rules that restrict age and sex for relationship
	constraint_reln_sex_age(husband,Y,Z):- Y\= female, Z#>27.
% There is no rule for wife, so we put a rule to allow the same
	constraint_reln_sex_age(wife,Y,Z):- Y= female.
% Add the rule to catch all other cases
	constraint_reln_sex_age(X,Y,Z):- X \= husband, X \= wife.

% Combining Causal Order:
    constraint(A,_,_,D,E,F):- constraint_reln_sex_age(D,E,F), constraint_ms_reln_age(A,D,F).

lite_intervene(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B1,C1,D1,E1,F1,Symbol):- 
    lite_causal(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B1,C1,D1,E1,F1,Symbol).
lite_intervene(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B1,C1,D1,E1,F1,Symbol):- 
    lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B1,C1,D1,E1,F1,Symbol).



%#show lite_causal/10.
% Com,bines the changes over the marital status and relationship Status'):- 
%lite_causal(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B,C,D1,E,F,'<-C: Marital Status & Relationship'):- constraint(A1,_,_,D1,E,F).
lite_causal(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B,C,D1,E,F,'<-C:'):- constraint(A1,_,_,D1,E,F).


%#show lite_direct/10.
lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B1,C1,D1,E1,F1,'<-D6'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1), 
    alter(Z6,F,F1), 
    A = A1, 
    B = B1, 
    C = C1,
    D = D1,
    E = E1,
    F \= F1.



lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B1,C1,D1,E1,F1,'<-D5'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1), 
    alter(Z6,F,F1), 
    A = A1, 
    B = B1, 
    C = C1,
    D = D1,
    E \= E1,
    F = F1.

lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B1,C1,D1,E1,F1,'<-D4'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1), 
    alter(Z6,F,F1), 
    A = A1, 
    B = B1, 
    C = C1,
    D \= D1,
    E = E1,
    F = F1.


lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B1,C1,D1,E1,F1,'<-D3'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1), 
    alter(Z6,F,F1), 
    A = A1, 
    B = B1, 
    C \= C1,
    D = D1,
    E = E1,
    F = F1.



lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B1,C1,D1,E1,F1,'<-D2'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1), 
    alter(Z6,F,F1), 
    A = A1, 
    B \= B1, 
    C = C1,
    D = D1,
    E = E1,
    F = F1.

lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B1,C1,D1,E1,F1,'<-D1'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1), 
    alter(Z6,F,F1), 
    A \= A1, 
    B = B1, 
    C = C1,
    D = D1,
    E = E1,
    F = F1.
    




% Show intervene
intervene(Z1,Z2,Z3,Z4,Z5,Z6,P,A,B,C,D,E,F, Q,A1,B1,C1,D1,E1,F1,Symbol):- Q#=P+1,
                                capital_gain(Q,B1), 
                                capital_gain(P,B), 

                                education_num(Q,C1), 
                                education_num(P,C), 
                                
                                marital_status(Q,A1),                            
                                marital_status(P,A),

                                age(Q,F1),
                                age(P,F),
                                
                                sex(Q,E1),
                                sex(P,E),

                                relationship(Q,D1),
                                relationship(P,D),
                                lite_intervene(mut(Z1,Z2,Z3,Z4,Z5,Z6),P,A,B,C,D,E,F, Q,A1,B1,C1,D1,E1,F1,Symbol).

                                
%?-intervene(1,1,1,1,1,1,1,married_civ_spouse,5013,7,wife,female,23, 2,A1,B1,C1,D1,E1,F1,Symbol).

%?-intervene(1,1,1,1,1,1,1,married_civ_spouse,5013,7,husband,male,28, 2,A1,B1,C1,D1,E1,F1,Symbol).

%?-intervene(1,1,1,1,1,1,1,married_civ_spouse,5013,7,wife,female,23, 2,married_civ_spouse,5013,C1,wife,female,23,Symbol).

%?-intervene(1,1,1,1,1,1,1,divorced,5013,7,unmarried,female,23, 2,A1,B1,C1,D1,E1,F1,Symbol).
