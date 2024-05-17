#include('Draft_1_2.pl').

% Causal Features

% Domain: 

	% relationship: {husband,  wife, unmarried}
        %f_domain(relationship, wife).
        f_domain(relationship, unmarried).
        f_domain(relationship, husband).


	% sex: {male, female}
        f_domain(sex, male).
        f_domain(sex, female).

	% age: [17,90]
        f_domain(age, X):-  X #>= 17, X #=< 90.



% Properties:
    
    % relationship
           #show lite_relationship/2, not lite_relationship/2.
           #show relationship/2.
        % Produces a binding for every timestamp so we remove the domain of time declaration

        not_lite_relationship(X,Y):- f_domain(relationship,Z) , lite_relationship(X, Z), Z\=Y.
        lite_relationship(X,Y):- not not_lite_relationship(X,Y).
        relationship(X,Y):-f_domain(relationship,Y) ,lite_relationship(X,Y).
        %?- relationship(1,Y).

    % sex
           #show lite_sex/2, not lite_sex/2.
           #show sex/2.
        % Produces a binding for every timestamp so we remove the domain of time declaration

        not_lite_sex(X,Y):- f_domain(sex,Z) , lite_sex(X, Z), Z\=Y.
        lite_sex(X,Y):- not not_lite_sex(X,Y).
        sex(X,Y):-f_domain(sex,Y) ,lite_sex(X,Y).
        %?- sex(1,Y).

    % age
        %   #show lite_age/2, not lite_age/2.
        %   #show age/2.
    
        %#show lite_age/2, not lite_age/2.
        lite_age(X,Y).
        age(X,Y):-f_domain(age,Y), lite_age(X,Y).
        %?- age(1,Y).



