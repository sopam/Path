
#include('Draft_1_3.pl').



%#show lite_direct/2, not lite_direct/2.
alter(0,X,X).
alter(1,X,Y).

serial_alter(mut(Z1,Z2,Z3,Z4),A,B,C,D,A1,B1,C1,D1):- alter(Z1,A,A1), alter(Z2,B,B1), alter(Z3,C,C1), alter(Z4,D,D1).

%#show lite_direct/10.

lite_direct(mut(Z1,Z2,Z3,Z4),P,A,B,C,D, Q,A1,B1,C1,D1,'<-D4'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1), 

    A = A1, 
    B = B1, 
    C = C1,
    D \= D1.


lite_direct(mut(Z1,Z2,Z3,Z4),P,A,B,C,D, Q,A1,B1,C1,D1,'<-D3'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1),
    A = A1, 
    B = B1, 
    C \= C1,
    D = D1.



lite_direct(mut(Z1,Z2,Z3,Z4),P,A,B,C,D, Q,A1,B1,C1,D1,'<-D2'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1),
    A = A1, 
    B \= B1, 
    C = C1,
    D = D1.

lite_direct(mut(Z1,Z2,Z3,Z4),P,A,B,C,D, Q,A1,B1,C1,D1,'<-D1'):- 
    alter(Z1,A,A1), 
    alter(Z2,B,B1), 
    alter(Z3,C,C1), 
    alter(Z4,D,D1),
    A \= A1, 
    B = B1, 
    C = C1,
    D = D1.
    

lite_intervene(mut(Z1,Z2,Z3,Z4),P,A,B,C,D, Q,A1,B1,C1,D1,Symbol):- 
    lite_direct(mut(Z1,Z2,Z3,Z4),P,A,B,C,D, Q,A1,B1,C1,D1,Symbol).


% Show intervene
intervene(Z1,Z2,Z3,Z4,P,A,B,C,D, Q,A1,B1,C1,D1,Symbol):- Q#=P+1,
                                persons(Q,A1),                            
                                persons(P,A),
                                maint(Q,B1), 
                                maint(P,B), 

                                buying(Q,C1), 
                                buying(P,C), 
                                


                                safety(Q,D1),
                                safety(P,D),
                                lite_intervene(mut(Z1,Z2,Z3,Z4),P,A,B,C,D, Q,A1,B1,C1,D1,Symbol).

                                
%?-intervene(1,1,1,1,1,1,1,married_civ_spouse,5013,7,wife,female,23, 2,A1,B1,C1,D1,E1,F1,Symbol).

%?-intervene(1,1,1,1,1,1,1,married_civ_spouse,5013,7,husband,male,28, 2,A1,B1,C1,D1,E1,F1,Symbol).

%?-intervene(1,1,1,1,1,1,1,married_civ_spouse,5013,7,wife,female,23, 2,married_civ_spouse,5013,C1,wife,female,23,Symbol).

%?-intervene(1,1,1,1,1,A,B,C,D, 2,A1,B1,C1,D1,Symbol).
