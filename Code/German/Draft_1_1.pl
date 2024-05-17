


   is_member(H,[state(_,H)|T]).

   is_member(H,[_|T]):- is_member(H,T).

   %?- is_member(1,[1,2,3]).

   %?- is_member(a,[state(1,a),state(2,b),state(3,c)]).

   %?- is_member([d,e,f1],[state(1,[a,b,c]),state(2,[d,e,f]),state(3,[g,h,i])]).

   message(X):- X = '<-D1'.
   message(X):- X = '<-D2'.
   message(X):- X = '<-D3'.
   message(X):- X = '<-D4'.
   message(X):- X = '<-D5'.
   message(X):- X = '<-D6'.
   message(X):- X = '<-D7'.
   message(X):- X = '<-C'.



   anti_member(_,[]).
   %anti_member(X,['<-D'|T]):- anti_member(X,T). % To hgandle the direct intervention case
   %anti_member(X,['<-C'|T]):- anti_member(X,T). % To hgandle the causal intervention case
   
   anti_member(X,[M|T]):- message(M), anti_member(X,T). %To pass messages
  
   anti_member(X,[state(_,H)|T]):- X \= H, anti_member(X,T).



   %?-anti_member(1,[2,3,4]).

   %?- anti_member(c,[state(1,a),state(2,b),state(3,c)]).

   %?- anti_member([d,e,f],[state(1,[a,b,c]),state(2,[d,e,f]),state(3,[g,h,i])]).
   %?- anti_member([d,e,f1],[state(1,[a,b,c]),state(2,[d,e,f]),state(3,[g,h,i])]).
   
   %?- anti_member([d,e,f1],[state(1,[a,b,c]),'<-C',state(2,[d,e,f]),state(3,[g,h,i])]).