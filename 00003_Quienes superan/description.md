Generar un predicado `quienesSuperan/4` que relacione 

* una lista de personajes, 
* un número 
* un criterio que relaciona un personaje y un número
* y la lista de personajes cuyo criterio supera ese número

``` prolog
? quienesSuperan([jimmie, jules, vincent], 1, cuantosAmigos, PersonajesQueCumplen).
PersonajesQueCumplen = [jules, vincent].

? quienesSuperan([marsellus, winston, mia, jimmie, jules, vincent], 2, cantidadEncargos, PersonajesQueCumplen).
PersonajesQueCumplen = [winston,vincent].
```

Se cuenta con un predicado cuantosAmigos/2, que relaciona un personaje con la cantidad de amigos que tiene. Tiene en cuenta que el personaje sea amigo de otro, o que otro sea amigo del personaje (no importa el orden).

:point_up: El predicado debe ser inversible para el cuarto argumento

