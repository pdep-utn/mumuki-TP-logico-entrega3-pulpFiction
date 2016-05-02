test('Escuadron incluye en algún momento a [marsellus, vincent, winston]', nondet):-
  escuadron([marsellus, vincent, winston]).
  
test('Vincent solo no forma un escuadron porque no llega a 15'):-
  not(escuadron([vincent])).
  
test('Nunca se forma un escuadrón sin integrantes porque se llega a 15'):-
  not(escuadron([])).  