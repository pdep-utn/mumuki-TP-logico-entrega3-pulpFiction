% no funciona bien
%test('Escuadron incluye en algún momento a [marsellus, vincent, winston]', nondet):-
%  escuadron([marsellus, vincent, winston]).

test('Escuadron incluye a  [marsellus, vincent, winston]'):-
  escuadron(Escuadron),
  member( winston,Escuadron),
  member( vincent,Escuadron),
  member( marsellus,Escuadron).

test('Escuadron con solo winston'):-
  escuadron([winston]).
  
test('Escuadron con solo marsellus'):-
  escuadron([marcellus]).
  
  
test('Vincent solo no forma un escuadron porque no llega a 15'):-
  not(escuadron([vincent])).
  
test('Nunca se forma un escuadrón sin integrantes porque no se llega a 15'):-
  not(escuadron([])).  