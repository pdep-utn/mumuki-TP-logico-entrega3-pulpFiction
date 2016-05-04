
cuantosAmigos(Personaje, CantidadAmigos):-personaje(Personaje, _),
   findall(Amigo, amigo(Personaje, Amigo), Amigos), length(Amigos, CantidadAmigos).
