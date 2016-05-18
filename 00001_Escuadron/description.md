Un escuadrón es un conjunto de personajes respetables que sumen entre todos un nivel de respeto mayor a 15. 
Definir el predicado `escuadron/1` que permita obtener todos los posibles escuadrones que se pueden armar. 

Recordemos que los niveles de respeto son 10 para winston, 15 para vincent y 20 para marsellus. Las combinaciones de posibilidades que suman un nivel de respeto mayor a 15 son:

``` prolog
?- escuadron(Personajes).
Personajes = [marsellus, vincent, winston] ;    % 45
Personajes = [marsellus, vincent] ;             % 35
Personajes = [marsellus, winston] ;             % 30
Personajes = [marsellus] ;                      % 20
Personajes = [vincent, winston] ;               % 25
false.                                          
% Otras combinaciones no suman 15
``` 

Asumir que el predicado `nivelRespeto/2` ya existe, lo mismo que `respetable/1`.
