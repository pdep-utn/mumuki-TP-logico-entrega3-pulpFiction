> Generar un predicado quienesSuperan/4 que relaciona 
>
> * una lista de personajes, 
> * un número 
> * y un criterio
> * con la lista de personajes cuyo criterio supera ese número

``` prolog
? quienesSuperan([jimmie, jules, vincent], 1, cuantosAmigos, PersonajesQueCumplen).
PersonajesQueCumplen = [vincent].

? quienesSuperan([marsellus, winston, mia, jimmie, jules, vincent], 2, cantidadEncargos, PersonajesQueCumplen).
PersonajesQueCumplen = [winston,vincent].
```

Se cuenta con un predicado cuantosAmigos/2, que relaciona un personaje con la 
cantidad de amigos que tiene

:point_up: El predicado debe ser inversible para el cuarto argumento

