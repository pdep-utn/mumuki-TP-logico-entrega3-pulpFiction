> escuadron/1: armar un escuadrón con 1 ó más personajes respetables que sumen entre todos más de 
>15 puntos de nivel de respeto. Generar un predicado que permita obtener la combinación posible. 

Recordemos que los niveles de respeto son 10 para winston, 15 para vincent y 20 para marsellus, vemos la combinación de posibilidades que suman más de 15 puntos:

``` prolog
?- escuadron(Personajes).
Personajes = [marsellus, vincent, winston] ;    % 45
Personajes = [marsellus, vincent] ;             % 35
Personajes = [marsellus, winston] ;             % 30
Personajes = [marsellus] ;                      % 20
Personajes = [vincent, winston] ;               % 25
false.                                          % Otras combinaciones no suman 15
``` 

Asumir que el predicado `nivelRespeto/2` ya existe.
