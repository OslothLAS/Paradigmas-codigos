class Cerdito{
	var property resistencia = 0
	var property  proteccion = []
	
	
	method obtenerResistencia(){
		
	}	
}

class Obrero inherits Cerdito {
	
	override method obtenerResistencia(){
		resistencia = 50
	}	
	
}
class Armado inherits Cerdito {
	
	override method obtenerResistencia(){
		resistencia = 10*self.resistenciaDeEscudos()
	}	
	
	method resistenciaDeEscudos(){
		return proteccion.sum{cascoOEscudo => cascoOEscudo.resistenciaMaxima()}
	}
	
}

class Proteccion {
	var property resistencia = 0
	
	method resistenciaMaxima(){
		return resistencia * 10
	}
}
