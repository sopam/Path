
   
 % IMPORTANT
% The queries for f(domain(X,Y) dont seem to run if we have specifified 2 or more objects (in terms of the properties). Dunno Why

 #include('Draft_1_1.pl').


% Domain: 

    % checking_account_status: {'no_checking_account', -'no_checking_account'}
        f_domain(checking_account_status, 'no_checking_account').
        f_domain(checking_account_status, '>=200').
        %f_domain(checking_account_status, '<0').
        %f_domain(checking_account_status, '>=0_and_<200').


    % credit_history: {'all_dues_atbank_cleared', -'all_dues_atbank_cleared'}
        f_domain(credit_history, 'no credits taken/ all credits paid back duly').
        f_domain(credit_history, 'all credits at this bank paid back duly').
        %f_domain(credit_history, 'existing credits paid back duly till now').
        %f_domain(credit_history, 'delay in paying off in the past').
        %f_domain(credit_history, 'critical account/  other credits existing (not at this bank)').
        
    % property: {'car or other', -'car or other'}
        f_domain(property, 'car or other').
        f_domain(property, 'real estate').
        %f_domain(property, 'building society savings agreement/ life insurance').
        %f_domain(property, 'no property').

    % duration_months: [4,72]
        f_domain(duration_months, X):- X #>= 4, X #=< 72.

    % credit_amount: [250,18424]
        f_domain(credit_amount, X):-  X #>= 250, X #=< 18424.






% Properties:
    
    % checking_account_status
           %#show lite_checking_account_status/2, not lite_checking_account_status/2.
        %   #show checking_account_status/2.
        % Produces a binding for every timestamp so we remove the domain of time declaration

        not_lite_checking_account_status(X,Y):- f_domain(checking_account_status,Z) , lite_checking_account_status(X, Z), Z\=Y.
        lite_checking_account_status(X,Y):- not not_lite_checking_account_status(X,Y).
        checking_account_status(X,Y):-f_domain(checking_account_status,Y) ,lite_checking_account_status(X,Y).
        %?- checking_account_status(1,Y).
        %?- f_domain(X,Y).


    % credit_history
           %#show lite_credit_history/2, not lite_credit_history/2.
        %   #show credit_history/2.
        % Produces a binding for every timestamp so we remove the domain of time declaration

        not_lite_credit_history(X,Y):- f_domain(credit_history,Z) , lite_credit_history(X, Z), Z\=Y.
        lite_credit_history(X,Y):- not not_lite_credit_history(X,Y).
        credit_history(X,Y):-f_domain(credit_history,Y) ,lite_credit_history(X,Y).
        %?- credit_history(1,Y).


    % property
           %#show lite_property/2, not lite_property/2.
        %   #show property/2.
        % Produces a binding for every timestamp so we remove the domain of time declaration

        not_lite_property(X,Y):- f_domain(property,Z) , lite_property(X, Z), Z\=Y.
        lite_property(X,Y):- not not_lite_property(X,Y).
        property(X,Y):-f_domain(property,Y) ,lite_property(X,Y).
        %?- property(1,Y).



    % duration_months
           %#show lite_duration_months/2, not lite_duration_months/2.
        %   #show duration_months/2.
    
        %#show lite_duration_months/2, not lite_duration_months/2.
        lite_duration_months(X,Y).
        duration_months(X,Y):-f_domain(duration_months,Y), lite_duration_months(X,Y).
        %?- duration_months(1,Y).
        

    % credit_amount
           %#show lite_credit_amount/2, not lite_credit_amount/2.
        %   #show credit_amount/2.
    
        %#show lite_credit_amount/2, not lite_credit_amount/2.
        lite_credit_amount(X,Y).
        credit_amount(X,Y):-f_domain(credit_amount,Y), lite_credit_amount(X,Y).
        %?- credit_amount(1,Y).



