Definir el predicado `batallon/2` que relaciona una serie de personajes respetables y una cantidad, de manera que la suma de todos los encargos de esos personajes respetables supera dicha cantidad.

Sabiendo que a Marsellus no le hicieron encargos, a Vincent le hicieron 4 encargos y a Winston 3, las posibilidades son:

``` prolog
?- batallon(Personajes, 5).
Personajes = [marsellus,vincent,winston] ; 
    % 0 + 4 + 3 = 7 encargos en total
Personajes = [vincent, winston].           
    % 4 + 3 = 7 encargos en total
``` 

* Vincent solo no supera los 5 encargos, ni Winston solo.
* Marsellus al no tener encargos no ayuda a Vincent ni a Winston para sumar una solución más

Asumir que ya existen los predicados `cantidadEncargos/2` y `respetable/1`