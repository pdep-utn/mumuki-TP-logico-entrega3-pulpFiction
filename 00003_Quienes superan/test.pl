test('Batallón incluye en algún momento a [marsellus, vincent, winston]'):-
  quienesSuperan([], cuantosAmigos, _, []).
  
test('Batallón incluye en algún momento a [marsellus, vincent, winston]', nondet):-
  quienesSuperan([], cuantosAmigos, _, []).  