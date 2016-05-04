
% Resolver el predicado cuantosAmigos/2, que relaciona un personaje con la 
% cantidad de amigos que tiene
cuantosAmigos(Personaje, CantidadAmigos):-personaje(Personaje, _),
   findall(Amigo, amigo(Personaje, Amigo), Amigos), length(Amigos, CantidadAmigos).