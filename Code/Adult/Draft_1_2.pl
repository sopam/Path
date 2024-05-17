#include('Draft_1_1.pl').

% Domain: 

	% marital_status: {married_civ_spouse, never_married, divorced}
        f_domain(marital_status, never_married).
        f_domain(marital_status, married_civ_spouse).
        
		

	% capital_gain: [0,99999]
		f_domain(capital_gain, X):-  X #>= 0, X #=< 99999.

	% education_num: [1,16]
		f_domain(education_num, X):- X #>= 1, X #=< 16.



% Properties:
    
    % marital_status
        %   #show lite_marital_status/2, not lite_marital_status/2.
        %   #show marital_status/2.
        % Produces a binding for every timestamp so we remove the domain of time declaration

        not_lite_marital_status(X,Y):- f_domain(marital_status,Z) , lite_marital_status(X, Z), Z\=Y.
        lite_marital_status(X,Y):- not not_lite_marital_status(X,Y).
        marital_status(X,Y):-f_domain(marital_status,Y) ,lite_marital_status(X,Y).
        %?- marital_status(1,Y).

    % capital_gain
        %   #show lite_capital_gain/2, not lite_capital_gain/2.
        %   #show capital_gain/2.
    
        %#show lite_capital_gain/2, not lite_capital_gain/2.
        lite_capital_gain(X,Y).
        capital_gain(X,Y):-f_domain(capital_gain,Y), lite_capital_gain(X,Y).
        %?- capital_gain(1,Y).

    % education_num
        %   #show lite_education_num/2, not lite_education_num/2.
        %   #show education_num/2.
    
        %#show lite_education_num/2, not lite_education_num/2.
        lite_education_num(X,Y).
        education_num(X,Y):-f_domain(education_num,Y), lite_education_num(X,Y).
        %?- education_num(1,Y).



