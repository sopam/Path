
#include('Draft_1_3.pl').
#include('C.pl').



%#show lite_direct/2, not lite_direct/2.
alter(0,X,X).
alter(1,X,Y).

serial_alter(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),A,B,C,D,E,F,G,A1,B1,C1,D1,E1,F1,G1):- alter(Z1,A,A1), alter(Z2,B,B1), alter(Z3,C,C1), alter(Z4,D,D1), alter(Z5,E,E1), alter(Z6,F,F1), alter(Z7,G,G1).


lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,'<-D1'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1),
    alter(Z6,F,F1),
    alter(Z7,G,G1),
    A \= A1, 
    B = B1, 
    C = C1,
    D = D1,
    E = E1,
    F = F1,
    G = G1.

lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,'<-D2'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1),
    alter(Z6,F,F1),
    alter(Z7,G,G1),
    A = A1, 
    B \= B1, 
    C = C1,
    D = D1,
    E = E1,
    F = F1,
    G = G1.

lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,'<-D3'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1),
    alter(Z6,F,F1),
    alter(Z7,G,G1),
    A = A1, 
    B = B1, 
    C \= C1,
    D = D1,
    E = E1,
    F = F1,
    G = G1.

lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,'<-D4'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1),
    alter(Z6,F,F1),
    alter(Z7,G,G1),
    A = A1, 
    B = B1, 
    C = C1,
    D \= D1,
    E = E1,
    F = F1,
    G = G1.


lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,'<-D5'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1),
    alter(Z6,F,F1),
    alter(Z7,G,G1),
    A = A1, 
    B = B1, 
    C = C1,
    D = D1,
    E \= E1,
    F = F1,
    G = G1.

lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,'<-D6'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1),
    alter(Z6,F,F1),
    alter(Z7,G,G1),
    A = A1, 
    B = B1, 
    C = C1,
    D = D1,
    E = E1,
    F \= F1,
    G = G1.


lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,'<-D7'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 
    alter(Z5,E,E1),
    alter(Z6,F,F1),
    alter(Z7,G,G1),
    A = A1, 
    B = B1, 
    C = C1,
    D = D1,
    E = E1,
    F = F1,
    G \= G1.


lite_causal(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A,B,C,D,E,F1,G,'<-C:'):- constraint(F1,G).






lite_intervene(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,Symbol):- 
   lite_direct(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,Symbol).

lite_intervene(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,Symbol):- 
    lite_causal(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,Symbol).








% Show intervene
intervene(Z1,Z2,Z3,Z4,Z5,Z6,Z7,P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,Symbol):- Q#=P+1,                                
                                checking_account_status(P,A), 
                                checking_account_status(Q,A1), 

                                credit_history(P,B),
                                credit_history(Q,B1),

                                property(P,C),
                                property(Q,C1),

                                duration_months(P,D),
                                duration_months(Q,D1),

                                credit_amount(P,E),
                                credit_amount(Q,E1),

                                present_employment_since(P,F),
                                present_employment_since(Q,F1),

                                job(P,G),
                                job(Q,G1),

                                lite_intervene(mut(Z1,Z2,Z3,Z4,Z5,Z6,Z7),P,A,B,C,D,E,F,G, Q,A1,B1,C1,D1,E1,F1,G1,Symbol).



%?-intervene(1,1,1,1,1,1,1,1,'no_checking_account','all credits at this bank paid back duly','car or other',7,300, 'unemployed','unemployed/unskilled-non-resident',2,A1,B1,C1,D1,E1,F1,G1,Symbol).

%?-intervene(1,1,1,1,1,1,1,1,'no_checking_account','all credits at this bank paid back duly','car or other',7,300, 'unemployed','unemployed/unskilled-non-resident',2,A1,B1,C1,D1,E1,F1,G1,'<-C:').

%?-intervene(1,1,1,1,1,1,1,1,'no_checking_account','all credits at this bank paid back duly','car or other',7,300, 'unemployed','unskilled-resident',2,A1,B1,C1,D1,E1,F1,G1,'<-C:').
