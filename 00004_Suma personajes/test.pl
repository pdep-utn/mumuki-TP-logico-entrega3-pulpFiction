test('sumar los valores de una lista vacía no importa el criterio, siempre se relaciona con 0'):-
  sumaPersonajes([], _, 0).
  
test('el total de amigos de jimmie, jules y vincent es 3'):-
  sumaPersonajes([jimmie, jules, vincent], cuantosAmigos, 3).

test('marsellus, winston, mia, jimmie, jules y vincent tienen en total 7 encargos'):-
  sumaPersonajes([marsellus, winston, mia, jimmie, jules, vincent], cantidadEncargos, 7).

test('marsellus, winston, mia, jimmie, jules y vincent tienen en total 45.1 niveles de respeto'):-
  sumaPersonajes([marsellus, winston, mia, jimmie, jules, vincent], nivelRespeto, 45.1).
