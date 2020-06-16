
%------------------------
%Problem 1

endWith([X],X).
endWith(L,X):- append(_,[X],L).


beginWith([X],X).
beginWith([H|_],X):- H=X.

split(L, Z, L1, L2):- append(L1,L2,L), L2=[H|_], H=Z.


/*

?- endWith([a,c,d,t,p,b], b).
true .

?-  X = c, endWith( [c, a,c,d,t,p,b], X).
false.

?- endWith([2,4,3,6,7,8,9],X).
X = 9 .

?- X = b, beginWith([a,c,d,t,p,b], X).
false.

?- beginWith([c, a,c,d,t,p,b], X).
X = c.

?- L = [1,2,3,4,5,4,3,2], split(L,4, L1, L2).
L = [1, 2, 3, 4, 5, 4, 3, 2],
L1 = [1, 2, 3],
L2 = [4, 5, 4, 3, 2] ;
L = [1, 2, 3, 4, 5, 4, 3, 2],
L1 = [1, 2, 3, 4, 5],
L2 = [4, 3, 2] ;
false.

?- split([a], a, L1, L2).
L1 = [],
L2 = [a] ;
false.

?- split([a,b,d,f],c,L1,L2).
false.
*/
%------------------------------


%------------------------------
%Problem 2

maxList([X],X).
maxList([H|T],X):- maxList(T,Y), X is max(Y,H).

/*
?- maxList([3,4,5,2,4,7,8,6], X).
X = 8 .

?- maxList( [12,34,6,3,10,7], 10).
false.

?- maxList([4,4,4,4],Z).
Z = 4 .

*/

%------------------------------

%------------------------------

% Problem 3


all_ab([a]).
all_ab([b]).
all_ab([H|T]):- all_ab(T), (H = a; H=b).

all_a([a]).
all_a([H|T]):- all_a(T), H=a.

all_b([b]).
all_b([H|T]):- all_b(T), H=b.


aplus_bplus([a,b]).
aplus_bplus(L):- append(X,Y,L), all_a(X),all_b(Y).


test_list(L) :- ( all_ab(L), write("ok1  ") ;true, write("not ok1  ") ),                 ( all_a(L), write("ok2  ") ; true, write("not ok2  ") ),                 (   all_b(L), write("ok3  ") ;true, write("not ok3  ") ),                 (   aplus_bplus(L), write("ok4  ") ; true, write("not ok4  ") ), !.

/*
?- L1 = [a,b,a,b,b,a,a,b] , test_list(L1).
ok1  not ok2  not ok3  not ok4
L1 = [a, b, a, b, b, a, a, b].

?- L2 = [a,a,a,b,b,b], test_list(L2).
ok1  not ok2  not ok3  ok4
L2 = [a, a, a, b, b, b].

?- L3 = [b,b,b,b,b], test_list(L3).
ok1  not ok2  ok3  not ok4
L3 = [b, b, b, b, b].

?- L4 = [a,a,a,a,a,a,a], test_list(L4).
ok1  ok2  not ok3  not ok4
L4 = [a, a, a, a, a, a, a].


?- L5 = [b,b,b,b,a], test_list(L5).
ok1  not ok2  not ok3  not ok4
L5 = [b, b, b, b, a].

?- L6 = [a,a,a,a,a,a,a,c,b,b], test_list(L6).
not ok1  not ok2  not ok3  not ok4
L6 = [a, a, a, a, a, a, a, c, b|...].

*/

%------------------------------

%------------------------------

% Problem 4

insertIt(X, [], [X]).
insertIt(X, T, [X|T]).
insertIt(X, [H|T], [H|T2] )  :- insertIt(X,T,T2).


/*
?- insertIt(x, [a,b,c,d,e,f,g], L).
L = [x, a, b, c, d, e, f, g] ;
L = [a, x, b, c, d, e, f, g] ;
L = [a, b, x, c, d, e, f, g] ;
L = [a, b, c, x, d, e, f, g] ;
L = [a, b, c, d, x, e, f, g] ;
L = [a, b, c, d, e, x, f, g] ;
L = [a, b, c, d, e, f, x, g] ;
L = [a, b, c, d, e, f, g, x] ;
L = [a, b, c, d, e, f, g, x] ;
false.

?- insertIt(3, [1,2,3,4],L).
L = [3, 1, 2, 3, 4] ;
L = [1, 3, 2, 3, 4] ;
L = [1, 2, 3, 3, 4] ;
L = [1, 2, 3, 3, 4] ;
L = [1, 2, 3, 4, 3] ;
L = [1, 2, 3, 4, 3] ;
false.

?- insertIt(3, L, [4,7,3,5]).
L = [4, 7, 5] ;
false.

?- insertIt(X, [a,b,c], [a,b,d,c]).
X = d ;
false.

*/

%------------------------------



%------------------------------

% Problem 5
doSub([X,Y], Z):- Z is X - Y.
doSub([X,Y], Z):- Z is Y - X.

doAdd([X,Y], Z):- Z is Y + X.

doDiv([X,Y], Z):- Z is X // Y.
doDiv([X,Y], Z):- Z is Y // X.

doMult([X,Y], Z):- Z is Y*X.


kenken([X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16]):-
   permutation([1,2,3,4],[X1,X2,X3,X4]),
   3 is X3,  doDiv([X1,X2], 2),  permutation([1,2,3,4],[X5,X6,X7,X8]),
   1 is X5, doSub([X4,X8], 3),   permutation([1,2,3,4],[X9,X10,X11,X12]),
   doSub([X6,X10], 2),  doDiv([X7,X11], 2),
   permutation([1,2,3,4],[X13,X14,X15,X16]),  doMult([X9,X13],12),
   doAdd([X12,X16],5),  doDiv([X14,X15], 2),
   is_set([X1,X5,X9,X13]), is_set([X2,X6,X10,X14]),
   is_set([X3,X7,X11,X15]), is_set([X4,X8,X12,X16]).

/*
?- kenken([X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16]).
X1 = X7, X7 = X12, X12 = X14, X14 = 2,
X2 = X8, X8 = X11, X11 = X13, X13 = 4,
X3 = X6, X6 = X9, X9 = X16, X16 = 3,
X4 = X5, X5 = X10, X10 = X15, X15 = 1 .


For a different KENKEN problem, since we have rules for division,
multiplication, addition, and substraction, all we have to do is change
the value desired for each heavy lines set of squares. this makes it
easier to use this very code for another problem.

*/

%------------------------------



%------------------------------

% Problem 6

decr(X,NX):- NX is X-1.
sumList([],0).
sumList([H|T], X):- sumList(T,N), X is H+N.
subsequence([],[]).
subsequence([H|T],[H|T1]):- subsequence(T,T1).
subsequence([_|T],T1):- subsequence(T,T1).
subsetSum(A,B,M):- subsequence(A,B), sumList(B,M).
knapsack([],0,[],0).
knapsack(L,W,Os,S):- subsetSum(L,Os,S), W is S.  %if OptVal = W
knapsack(L,W,Os,S):- subsetSum(L,Os,S), decr(W,S).  %if OptVal = W
/*

?- knapsack([5,4,10,12,3,2],27,OptVal,OptSet).
OptVal = [5, 10, 12],
OptSet = 27 ;
OptVal = [10, 12, 3, 2],
OptSet = 27 ;
OptVal = [5, 4, 12, 3, 2],
OptSet = 26 ;
OptVal = [4, 10, 12],
OptSet = 26 ;
false.


?- knapsack([5,4,10,12,3,2],35,OptVal,OptSet).
OptVal = [5, 4, 10, 12, 3],
OptSet = 34 ;
false.

?- knapsack([3,6,9,12,24,36,30,15], 31,OptVal,Optset).
OptVal = [3, 6, 9, 12],
Optset = 30 ;
OptVal = [3, 12, 15],
Optset = 30 ;
OptVal = [6, 9, 15],
Optset = 30 ;
OptVal = [6, 24],
Optset = 30 ;
OptVal = [30],
Optset = 30 ;
OptVal = [3, 6, 9, 12],
Optset = 30 ;
OptVal = [3, 12, 15],
Optset = 30 ;
OptVal = [6, 9, 15],
Optset = 30 ;
OptVal = [6, 24],
Optset = 30 ;
OptVal = [30],
Optset = 30 ;

?- knapsack([3,6,9,12,24,36,30,15], 41,OptVal,Optset).
false.

?- knapsack([4,6,3,8,12,45,63,50,37,29], 34,OptVal,W).
OptVal = [4, 6, 3, 8, 12],
W = 33 ;
OptVal = [4, 29],
W = 33 ;
false.


?- knapsack([23,67,45,34,89,100,120,25,37,43,167,189,110,7,3,56], 1079,OptVal,Optset).
OptVal = [23, 67, 45, 34, 89, 100, 120, 25, 43|...],
Optset = 1078 ;
OptVal = [23, 67, 45, 89, 100, 120, 25, 37, 43|...],
Optset = 1078 ;
false.


?- knapsack([4,6,3,8,12,45,63,50,37,29], 34,OptVal,Optset).
OptVal = [4, 6, 3, 8, 12],
Optset = 33 ;
OptVal = [4, 29],
Optset = 33 ;
false.



*/

%---------------------------


























