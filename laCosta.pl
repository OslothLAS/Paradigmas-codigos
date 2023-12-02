%Prolog de la Costa
%Punto 1

puestosDeComida(hamburguesas, 2000).
puestosDeComida(panchitosConPapas, 1500).
puestosDeComida(lomitosCompletos, 2500).
puestosDeComida(caramelos, 0).

atraccion(autitosChocadores, tranquila(atp)).
atraccion(casaEmbrujada, tranquila(atp)).
atraccion(laberinto, tranquila(atp)).
atraccion(tobogan, tranquila(chicos)).
atraccion(calesita, tranquila(chicos)).

atraccion(barcoPirata, intensa(14)).
atraccion(tazasChinas, intensa(6)).
atraccion(simulador, intensa(2)).

atraccion(abismoMortal, montaniaRusa(3, 134)).
atraccion(paseoPorElBosque, montaniaRusa(0, 45)).

atraccion(torpedoSalpicon, acuatica()).
atraccion(esperoQueHayasTraidoUnaMudaDeRopa, acuatica()).

visitante(eusebio, 3000, 80, viejitos).
visitante(carmela, 0, 80, viejitos).
visitante(luffy, 4000, 10, nenes).

sentimiento(eusebio, 50, 0).
sentimiento(carmela, 0, 25).
sentimiento(osmar, 0, 0).

%visitante(Visitante, Dinero, Edad, GrupoFamiliar).
%sentimiento(Visitante, Hambre, Aburrimiento).

%estadoDeBienestar(Visitante, Estado)

estadoDeBienestar(Visitante, felicidadPlena):-
    sentimiento(Visitante, 0, 0),
    noVieneSolo(Visitante).

estadoDeBienestar(Visitante, podriaEstarMejor):-
    laSumaEstaEntre(Visitante, 1, 50).

estadoDeBienestar(Visitante, podriaEstarMejor):-
    laSumaEstaEntre(Visitante, 0, 0),
    not(noVieneSolo(Visitante)).

estadoDeBienestar(Visitante, necesitaEntretenerse):-
    laSumaEstaEntre(Visitante, 51, 99).

estadoDeBienestar(Visitante, seQuiereIrACasa):-
    laSumaEstaEntre(Visitante, 100, _).

laSumaEstaEntre(Visitante, MenorValor, MayorValor):-
    sentimiento(Visitante, Hambre, Aburrimiento),
    Suma is Hambre + Aburrimiento,
    between(MenorValor, MayorValor, Suma).

noVieneSolo(Visitante):-
    visitante(Visitante, _,_, GrupoFamiliar),
    visitante(OtroVisitante, _,_, GrupoFamiliar),
    OtroVisitante \= Visitante.

%PUNTO 3

grupoPuedeSatisfacerSuHambre(GrupoFamiliar, Comida):-
    visitante(_,_,_, GrupoFamiliar),
    forall(visitante(Visitante,_,_, GrupoFamiliar),(tieneDineroSuficiente(Visitante, Comida),
    satisface(Visitante, Comida))).

tieneDineroSuficiente(Visitante, Comida):-
    visitante(Visitante,_,_,_), 
    puedePagar(Visitante, Comida).

satisface(Visitante, hamburguesas):-
    sentimiento(Visitante, Hambre,_), 
    Hambre < 50.

satisface(Visitante, panchito):-
    visitante(Visitante,_,_, _), 
    esChico(Visitante).


satisface(Visitante, caramelos):-
    visitante(Visitante,_,_,_),
    not(puedePagar(Visitante, _)).

satisface(_, lomitosCompletos).

puedePagar(Visitante, Comida):-
    visitante(Visitante, Dinero,_, _),
    puestosDeComida(Comida, Precio),
    Precio =< Dinero,
    Dinero \= 0. 

esChico(Visitante):-
    visitante(Visitante,_,Edad, _),
    Edad < 13.
    

%Punto 4

puedeProducirseLluviaDeHamburguesas(Visitante, Atraccion):-
    visitante(Visitante,_,_,_),
    atraccion(Atraccion,_),
    puedePagar(Visitante, hamburguesas),
    atraccionSegun(Atraccion, Visitante).


atraccionSegun(Atraccion,_):-
    atraccion(Atraccion, intensa(Coeficiente)),
    Coeficiente > 10.

atraccionSegun(Atraccion, Visitante):-
    atraccion(Atraccion, montaniaRusa(_,_)),
    esMontaniaPeligrosa(Atraccion, Visitante).

atraccionSegun(tobogan, _).

esMontaniaPeligrosa(Atraccion, Visitante):-
    visitante(Visitante,_,_,_),
    not(esChico(Visitante)),
    esMontaniaConMayorGiro(Atraccion),
    not(estadoDeBienestar(Visitante, necesitaEntretenerse)).

esMontaniaPeligrosa(Atraccion, Visitante):-
    esChico(Visitante),
    atraccion(Atraccion, montaniaRusa(_, Tiempo)),
    Tiempo > 60.

esMontaniaConMayorGiro(Atraccion):-
    atraccion(Atraccion, montaniaRusa(GirosDeMontania, _)),
    forall(atraccion(_, montaniaRusa(Giros, _)), GirosDeMontania >= Giros).

%Punto 5

opcionesDeEntretenimiento(Visitante, Puestos, Atraccion):-
    visitante(Visitante,_,_,_),
    puedePagar(Visitante, Puestos).

opcionesDeEntretenimiento(Visitante, Puestos, Atraccion):-
    visitante(Visitante,_,_,_),
    atraccion(Atraccion, tranquila(atp)).

opcionesDeEntretenimiento(Visitante, Puestos, Atraccion):-
    visitante(Visitante,_,_,_)
    atraccion(Atraccion, intensa(_)).

    atraccion(Atraccion, montaniaRusa()),
    atraccion(Atraccion, acuatica(_)),

    


