
% Resolver el predicado cuantosAmigos/2, que relaciona un personaje con la 
% cantidad de amigos que tiene
cuantosAmigos(Personaje, CantidadAmigos):-
   findall(Amigo, amigos(Personaje, Amigo), Amigos), length(Amigos, CantidadAmigos).
   
amigos(Persona1, Persona2) :- amigo(Persona1, Persona2).
amigos(Persona1, Persona2) :- amigo(Persona2, Persona1).