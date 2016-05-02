cantidadEncargos(Personaje, CantidadEncargos):-personaje(Personaje, _),
    findall(Encargo, encargo(_, Personaje, Encargo), Encargos), 
    length(Encargos, CantidadEncargos).

nivelRespeto(Personaje, 20):-personaje(Personaje, mafioso(capo)).
nivelRespeto(Personaje, NivelRespeto):-personaje(Personaje, mafioso(maton)),
    cantidadEncargos(Personaje, CantidadEncargos), NivelRespeto is CantidadEncargos * 5.
    % otra opción es reemplazar la línea de arriba por ...
    % findall(5, encargo(_, Personaje, _), Encargos), sumlist(Encargos, NivelRespeto).
    % fin
nivelRespeto(Personaje, 10):-personaje(Personaje, mafioso(resuelveProblemas)).
nivelRespeto(Personaje, Respeto):-personaje(Personaje, actriz(Peliculas)), 
	length(Peliculas, Long),
	Respeto is Long * 0.1.

personajesRespetables(Personajes):-
    findall(Personaje, (nivelRespeto(Personaje, NivelRespeto), NivelRespeto > 9), Personajes). 