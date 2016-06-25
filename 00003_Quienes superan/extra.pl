
cuantosAmigos(Personaje, CantidadAmigos):-personaje(Personaje, _),
   findall(Amigo, amigos(Personaje, Amigo), Amigos), length(Amigos, CantidadAmigos).

amigos(Persona1, Persona2) :- amigo(Persona1, Persona2).
amigos(Persona1, Persona2) :- amigo(Persona2, Persona1).