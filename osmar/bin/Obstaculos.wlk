import Isla.*

class Obstaculo{
	var property resistencia = 0
	var property anchoDePared = 0
	
}

class ParedDeVidrio inherits Obstaculo{
	method obtenerResistencia(){
		resistencia  = 10*anchoDePared
	}
}

class ParedDeMadera inherits Obstaculo{
	method obtenerResistencia(){
		resistencia  = 25*anchoDePared
	}
}

class ParedDePiedra inherits Obstaculo{
	method obtenerResistencia(){
		resistencia  = 50*anchoDePared
	}
}

