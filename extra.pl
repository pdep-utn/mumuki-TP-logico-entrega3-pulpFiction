pareja(marsellus, mia).
pareja(pumkin,    honeyBunny).

% ACLARACION: Todos los puntos deben ser completamente inversibles

% ***************************************************************************
% Entrega 1: Relaciones entre individuos. Recursividad. Negación. 
% ***************************************************************************

% Punto 2
% Necesitamos agregar la siguiente Información
% Bernardo es pareja de Bianca y de Charo
pareja(bernardo,    bianca).
pareja(bernardo,    charo).

% Punto 1
% saleCon/2: determina si alguien está saliendo con otra persona, porque son pareja
% ej. saleCon(mia, Quien) Quien = marsellus
% La cláusula ¿es recursiva? En caso afirmativo separe caso base y caso recursivo.
saleCon(Uno, Otro):-pareja(Uno, Otro).
saleCon(Otro, Uno):-pareja(Uno, Otro).

% No se sabe si Bianca es pareja de Demóstenes
% No hacemos nada por principio de universo cerrado

% trabajaPara(Empleador, Empleado)
trabajaPara(marsellus, vincent).
trabajaPara(marsellus, jules).
trabajaPara(marsellus, winston).

% Bernardo trabaja para cualquiera que trabaja para marsellus (salvo para jules)
trabajaPara(Empleador, bernardo):-trabajaPara(marsellus, Empleador), Empleador \= jules.

% George trabaja para todos los que salen con Bernardo
trabajaPara(Empleador, george):-saleCon(Empleador, bernardo).

% Punto 3
% esFiel/1: una persona es fiel si no tiene más de una pareja
% Alguien que no tiene pareja no puede ser fiel.
% Resolverlo utilizando negación
esFiel(Personaje):-saleCon(Personaje, Pareja), 
    not((saleCon(Personaje, OtraPareja), Pareja \= OtraPareja)).

% Punto 4
% acataOrden/2
% Alguien acata la orden de otra persona si esa persona trabaja para la otra 
% directa o indirectamente (porque trabaja para otra persona que acata las
% órdenes del segundo personaje)
% ej.
% La cláusula ¿es recursiva? En caso afirmativo separe caso base y caso recursivo.
acataOrden(Empleado, Jefe):-trabajaPara(Empleado, Jefe).
acataOrden(Empleado, Jefe):-trabajaPara(Empleado, OtroJefe),
    acataOrden(OtroJefe, Jefe).

% ***************************************************************************
% Entrega 2: Polimorfismo. Functores. Aritmética. Predicados de orden superior.
% ***************************************************************************
% Agregamos la siguiente información de base
% Información base
personaje(pumkin,     ladron([licorerias, estacionesDeServicio])).
personaje(honeyBunny, ladron([licorerias, estacionesDeServicio])).
personaje(vincent,    mafioso(maton)).
personaje(jules,      mafioso(maton)).
personaje(marsellus,  mafioso(capo)).
personaje(winston,    mafioso(resuelveProblemas)).
personaje(mia,        actriz([foxForceFive])).
personaje(butch,      boxeador).
personaje(bernardo,   mafioso(cerebro)).
personaje(bianca,     actriz([elPadrino1])).

% También tenemos información de los encargos que le hacen los jefes a sus 
% empleados, codificada en la base de la siguiente forma: 
% encargo(Solicitante, Encargado, Tarea). 
% las tareas pueden ser cuidar(Protegido), ayudar(Ayudado), buscar(Buscado, Lugar)
encargo(marsellus, vincent,   cuidar(mia)).
encargo(vincent,   elVendedor, cuidar(mia)).
encargo(marsellus, winston, ayudar(jules)).
encargo(marsellus, winston, ayudar(vincent)).
encargo(marsellus, vincent, buscar(butch, losAngeles)).
encargo(bernardo,  vincent, buscar(jules, fuerteApache)).
encargo(bernardo,  winston, buscar(jules, sanMartin)).
encargo(bernardo,  winston, buscar(jules, lugano)).

% Punto 1
% esPeligroso/1. Nos dice si un personaje es peligroso. Eso ocurre cuando:
% realiza alguna actividad peligrosa: ser matón, o robar licorerías. 
% o bien porque tiene empleados peligrosos
esPeligroso(Personaje):-personaje(Personaje, mafioso(maton)).
esPeligroso(Personaje):-personaje(Personaje, ladron(Cosas)), member(licorerias, Cosas).
esPeligroso(Personaje):-trabajaPara(Empleado, Personaje), esPeligroso(Empleado).

% Base de amigos
amigo(vincent, jules).
amigo(jules, jimmie).
amigo(vincent, elVendedor).

% Punto 2
% sanCayetano/1: es quien a todos los que tiene cerca les da trabajo (algún encargo). 
% Alguien tiene cerca a otro personaje si es su amigo o empleado. 
tieneCerca(Personaje, Otro):-amigo(Personaje, Otro).
tieneCerca(Personaje, Otro):-trabajaPara(Otro, Personaje).

sanCayetano(Personaje):-tieneCerca(Personaje, _), 
    forall(tieneCerca(Personaje, Alguien), encargo(Personaje, Alguien, _)).

% Punto 3 
%Realizar el predicado nivelRespeto/2 que relaciona a un personaje con su nivel de respeto.
%El nivel de respeto se calcula como:
%Para las actrices, la décima parte de su cantidad de peliculas.
%Para los mafiosos que resuelven problemas es 10, mientras que para los capos asciende a 20.
%Para Vincent es exactamente 15.
%Para el resto no se cuenta con un nivel de respeto.

nivelRespeto(Personaje,Nivel):-
    personaje(Personaje,Ocupacion),
    respeto(Ocupacion, Nivel).

nivelRespeto(vincent,15).

respeto(mafioso(resuelveProblemas),10).
respeto(mafioso(capo),20).
respeto(actriz(Peliculas),Nivel):-length(Peliculas,Cant), Nivel is Cant/10.


% Punto 4
% Asumiendo que ya se sabe calcular el nivel de respeto de cualquier personaje, se quiere analizar la composición de personajes respetables de la película. Un personaje es respetable si su nivel de respeto es mayor a 9.
% Se quiere averiguar la cantidad de personajes respetables y no respetables.

%? respetabilidad(Respetables,NoRespetables).
%Respetables = 3
%NoRespetables = 7

respetabilidad(Resp,NoResp):- cantidadRespetables(Resp),
    cantidadNoRespetables(NoResp).
    
cantidadRespetables(Resp):-
    findall(_,respetable(_),L),
    length(L,Resp).
cantidadNoRespetables(NoResp):-
    findall(_,(personaje(P,_),not(respetable(P))),L),
    length(L,NoResp).

respetable(P):- nivelRespeto(P,N),N>9.

% Punto 5
% Se quiere averiguar cual es el personaje mas atareado, que es quien más encargos tenga.
% Para ello es necesario definir tambien un predicado cantidadEncargos/2 que relaciona un personaje con la cantidad de encargos que le hicieron.
% Como requisito, se debe utilizar forall/1 en la resolución.

% ? masAtareado(Quien).
% Quien = winston
% Porque tiene 4 encargos, mientras que vincent tiene 2 y el vendedor sólo 1.

masAtareado(Personaje):-
    cantidadEncargos(Personaje, Maximo),
    forall(cantidadEncargos(_, Cant), Maximo>=Cant).

cantidadEncargos(Personaje, CantidadEncargos):-
    personaje(Personaje, _),
    findall(Encargo, encargo(_, Personaje, Encargo), Encargos), 
    length(Encargos, CantidadEncargos).

% SOLUCION AL PUNTO 3 ANTERIOR
%nivelRespeto(Personaje, 20):-personaje(Personaje, mafioso(capo)).
%nivelRespeto(Personaje, NivelRespeto):-personaje(Personaje, mafioso(maton)),
%    cantidadEncargos(Personaje, CantidadEncargos), NivelRespeto is CantidadEncargos * 5.
    % otra opción es reemplazar la línea de arriba por ...
    % findall(5, encargo(_, Personaje, _), Encargos), sumlist(Encargos, NivelRespeto).
    % fin
%nivelRespeto(Personaje, 10):-personaje(Personaje, mafioso(resuelveProblemas)).
%nivelRespeto(Personaje, Respeto):-personaje(Personaje, actriz(Peliculas)), 
%	length(Peliculas, Long),
%	Respeto is Long * 0.1.

%personajesRespetables(Personajes):-
%    findall(Personaje, (nivelRespeto(Personaje, NivelRespeto), NivelRespeto > 9), Personajes). 
    
    
    
    
    
