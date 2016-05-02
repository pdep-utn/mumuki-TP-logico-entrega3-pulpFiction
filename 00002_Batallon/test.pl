test('Batallón incluye en algún momento a [marsellus, vincent, winston]', nondet):-
  batallon([marsellus, vincent, winston], 5).
  
test('Vincent y Winston forman parte del batallón de 5 encargos', nondet):-
  batallon(Personajes, 5),
  member(winston, Personajes),
  member(vincent, Personajes).
  
test('Vincent solo no forma un batallón porque no llega a 5 encargos'):-
  not(batallon([vincent], 5)).
  
test('Nunca se forma un batallón sin integrantes porque no se llega a 5 encargos'):-
  not(batallon([], 5)).  