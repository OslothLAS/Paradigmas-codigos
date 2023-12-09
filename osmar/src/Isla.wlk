import Pajaro.*
import Obstaculos.*

class Isla {
	
	var property pajaros = []
	
	method pajarosFuertes(){
		return pajaros.filter{pajaro => pajaro.esPajaroFuerte()}
	}
	
	method fuerzaDeLaIsla(){
		return self.pajarosFuertes().sum{pajaro => pajaro.fuerza()}
	}
	
	
}

class IslaPajaro inherits Isla{
	
	var property cerditosInvasores = 0
	
	method sesionDeManejoConMatilda(){
		self.pajaros().forEach{pajaro => pajaro.tranquilizarse()}
	}
	
	method invasionDeCerditos(){
		if(cerditosInvasores == 100){
			self.pajaros().forEach{pajaro => pajaro.enojarse()}
	}
	
	}
	
	method fiestaSorpresa(){
		self.pajarosHomenajeados().forEach{pajaro => pajaro.enojarse()}
	}
	
	method pajarosHomenajeados(){
		return self.pajaros().filter{pajaro => pajaro.esHomenajeado()}
	}
	
	method serieDeEventosDesafortunados(){
		self.sesionDeManejoConMatilda()
		self.fiestaSorpresa()
		self.invasionDeCerditos()
	}
	
	method lanzarHabitante(isla){
 		self.pajaros().forEach{pajaro => pajaro.esLanzado(isla)}
 	}
 	

}

class IslaCerdito inherits Isla{
	var property obstaculos = []
	
	method derribarObstaculo(obstaculo){
		self.obstaculos().remove(obstaculo)

	}	
	 method algunObstaculo(){
 		return self.obstaculos().anyOne()
 	}
}
