#include('Draft_1_1.pl').

% Domain: 

	% persons: {2, 4, 5more}
        f_domain(persons, '2').
        f_domain(persons, '4').
        %f_domain(persons, '5more').
        
    % maint: {low, med, high, vhigh}
        f_domain(maint, low).
        f_domain(maint, med).
        %f_domain(maint, high).
        %f_domain(maint, vhigh).
        
	% buying: {low, med, high, vhigh}
        %f_domain(buying, low).
        f_domain(buying, med).
        f_domain(buying, high).
        %f_domain(buying, vhigh).
        

	% safety: {low, med, high, vhigh}
        %f_domain(safety, low).
        f_domain(safety, med).
        f_domain(safety, high).
        %f_domain(safety, vhigh).
        

% Properties:
    
    % persons
        %   #show lite_persons/2, not lite_persons/2.
        %   #show persons/2.
        % Produces a binding for every timestamp so we remove the domain of time declaration

        not_lite_persons(X,Y):- f_domain(persons,Z) , lite_persons(X, Z), Z\=Y.
        lite_persons(X,Y):- not not_lite_persons(X,Y).
        persons(X,Y):-f_domain(persons,Y) ,lite_persons(X,Y).
        %?- persons(1,Y).



    % maint
        %   #show lite_maint/2, not lite_maint/2.
        %   #show maint/2.
        % Produces a binding for every timestamp so we remove the domain of time declaration

        not_lite_maint(X,Y):- f_domain(maint,Z) , lite_maint(X, Z), Z\=Y.
        lite_maint(X,Y):- not not_lite_maint(X,Y).
        maint(X,Y):-f_domain(maint,Y) ,lite_maint(X,Y).
        %?- maint(1,Y).



    % buying
        %   #show lite_buying/2, not lite_buying/2.
        %   #show buying/2.
        % Produces a binding for every timestamp so we remove the domain of time declaration

        not_lite_buying(X,Y):- f_domain(buying,Z) , lite_buying(X, Z), Z\=Y.
        lite_buying(X,Y):- not not_lite_buying(X,Y).
        buying(X,Y):-f_domain(buying,Y) ,lite_buying(X,Y).
        %?- buying(1,Y).



    % safety
        %   #show lite_safety/2, not lite_safety/2.
        %   #show safety/2.
        % Produces a binding for every timestamp so we remove the domain of time declaration

        not_lite_safety(X,Y):- f_domain(safety,Z) , lite_safety(X, Z), Z\=Y.
        lite_safety(X,Y):- not not_lite_safety(X,Y).
        safety(X,Y):-f_domain(safety,Y) ,lite_safety(X,Y).
        %?- safety(1,Y).
