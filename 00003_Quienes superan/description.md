> Generar un predicado quienesSuperan/4 que relaciona 
>
> * una lista de personajes, 
> * un número 
> * y un criterio
> * con la lista de personajes cuyo criterio supera ese número

``` prolog
? personajes(Personajes), quienesSuperan(Personajes, 2, cuantosAmigos, Quienes)
```

Se cuenta con un predicado cuantosAmigos/2, que relaciona un personaje con la 
cantidad de amigos que tiene

:point_up: El predicado debe ser inversible para el primer o cuarto argumento

