Resolver el predicado `sumaPersonajes/3`, que relaciona

* una lista de personajes
* un predicado que relaciona al personaje con un valor numérico
* y la suma de los valores que tienen todos los personajes en base a ese criterio

``` prolog
? sumaPersonajes([jimmie, jules, vincent], cuantosAmigos, Total).
Total = 5.

? sumaPersonajes([marsellus, winston, mia, jimmie, jules, vincent], cantidadEncargos, Total).
Total = 7.

? sumaPersonajes([marsellus, winston, mia, jimmie, jules, vincent], nivelRespeto, Total).
Total = 45.1.

? sumaPersonajes([], nivelRespeto, Total).
Total = 0.
```

Se cuenta con un predicado cuantosAmigos/2, que relaciona un personaje con la 
cantidad de amigos que tiene

:point_up: El predicado debe ser inversible para el tercer argumento

