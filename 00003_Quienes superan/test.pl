test('Quienes superan de una lista vacía se relaciona con una lista vacía, no importa qué]'):-
  quienesSuperan([], _, _, []).
  
test('Vincent y jules es el único que tiene más de 1 amigo'):-
  quienesSuperan([jimmie, jules, vincent], 1, cuantosAmigos, [vincent, jules]).  
  
test('Winston y Vincent tienen más de 2 encargos'):-  
  quienesSuperan([marsellus, winston, mia, jimmie, jules, vincent], 2, cantidadEncargos, [winston,vincent]).
  
test('Winston y Vincent tienen más de 0 encargos'):-  
  quienesSuperan([marsellus, winston, mia, jimmie, jules, vincent], 0, cantidadEncargos, [winston,vincent]).
  
  