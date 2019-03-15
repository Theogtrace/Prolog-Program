%Member
member(X,[X|_]).
member(X,[_|Y]):- member(X,Y).
%Intersection prolog rule 
intersection([],_,[]).
intersection([H|T], B, [H|C]):- member(H,B),!,intersection(T,B,C).
intersection([_|T], B, C):- intersection(T, B, C).
%Union prolog rule
unionof2([],[],[]).
unionof2([], B, B).
unionof2(A,[],A).
unionof2(A, [H2|T2], [H2|C]):- \+(member(H2,A)), unionof2(A, T2, C).
unionof2(A , [H2|T2], C):- member(H2, A), unionof2(A, T2, C).
%Difference prolog rule
dif([],[],[]).
dif([],_,[]).
dif(A,[],A).
dif([H|T],B,[H|C]):- \+(member(H,B)), dif(T, B, C).
dif([H|T],B, C):- member(H, B), dif(T, B, C).
%Subset prolog rule
sub([],[]).
sub([],_).
sub([H1|T1],B):- member(H1,B), sub(T1,B).
%EliminateDuplicates
elemduplicates([],[]).
elemduplicates([H | T], [H|T2]) :- \+(member(H, T)), elemduplicates(T, T2).
elemduplicates([H | T], R) :- member(H, T), elemduplicates(T, R).
