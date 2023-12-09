import Isla.*
import Obstaculos.*

class Pajaro{
	var property fuerza = 0
	var property ira = 0
	var property  cantidadDeEnojos = 0
		
	method enojarse(){
		ira = ira*2
	}
	
	method esPajaroFuerte(){return self.fuerza() > 50}

	method tranquilizarse(){
		ira = ira - 5
	}
	
	
	method esHomenajeado(){
 		return true
 	}
 	
 	method esLanzado(isla){
 		if(self.puedeDerribarObstaculo(isla.algunObstaculo())){
 			isla.derribarObstaculo(isla.algunObstaculo())
 		}	
 	}
 	
 	method puedeDerribarObstaculo(obstaculo){
 		return self.fuerza() > obstaculo.resistencia()
 	}
}

class Comun inherits Pajaro{
	
 	method obtenerFuerza(){
 		fuerza = ira*2
 	}
	
}
class Red inherits Pajaro{

	
	 method obtenerFuerza(){
 		fuerza = ira*10*cantidadDeEnojos
 	}
}

class Bomb inherits Pajaro{	
	
	method obtenerFuerza(){
		if(fuerza < 9000){
			fuerza = ira*2
		}
		
	}
	
}

class Chuck inherits Pajaro{	
	var velocidad=0
	
	method obtenerFuerza(){
 		if(velocidad < 80){
 			fuerza = 150
 		}
 		else{
 			fuerza = 150 + (velocidad - 80)*5
 		}
 	}
 	
 	override method enojarse(){
 		velocidad = velocidad*2
 	}
 	
 	override method tranquilizarse(){
 		
 	}
 	


}

class Terence inherits Pajaro{

	var property multiplicador = 0
	
	method obtenerFuerza(){
		fuerza = (cantidadDeEnojos + ira)*multiplicador
		
	}
}

class Matilda inherits Pajaro{
	
	var property huevos = []
	
	method obtenerFuerza(){
		fuerza = ira*2 
	}
	
	method sumatoriaFuerzaHuevos(){
		return self.huevos().sum{huevo => huevo.fuerza()}
	}

}

class Huevos inherits Pajaro{
	
}