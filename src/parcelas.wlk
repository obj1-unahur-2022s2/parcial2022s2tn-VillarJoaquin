/*
 * método: tieneComplicaciones(): No es correcta la implementación, ya que el recorrido 
 * para determinar si tiene complicaciones es sobre la colección de plantas, y no se debe
 * definir parámetros en el método. Te dejo la corrección.
 * 
 * método: plantarunaPlanta(unaPlanta): la rama del else está de más, porque si se cumple 
 * la condición para arrojar el error, se corta la ejecución del método. 
 * 
 * método superaCapacidad(): El enunciado indica que se supera la capacidad si se intenta 
 * agregar una planta siendo la cantidad actual igual a la máxima capacidad. Te dejo
 * la solución correcta.
 * 
 * método: seAsociaBien(unaPlanta): Debía definirse como abstracto para forzar que solo
 * se instancien plantas de las subclases correspondientes.
 * 
 * Te agrego el método cantidadDePlantasBienAsociadas() que se usará en el objeto inta
 * para resolver el método masAutoSustentable()
 */

import plantas.*

class Parcela {
	var property ancho
	var property largo
	var property horasDeSol
	const property plantas = #{}
	
	method superficie(){
		return ancho * largo
	}
	method cantidadMaxima(){
		if (ancho > largo) 
			return (self.superficie() / 5)
		else
			return (self.superficie() / 3) + largo
	}
	method tieneComplicaciones(){

		return plantas.any({ p => p.horasDeSolTolera() < horasDeSol})
	}
	
	method plantarUnaPlanta(unaPlanta) {
		if (self.superaCapacidad() or self.diferenciaDeSolDe(unaPlanta) > 2)
		 self.error("No se puede plantar mas plantas")	
		plantas.add({unaPlanta})
	}
	method superaCapacidad() {

		return plantas.size() == self.cantidadMaxima() 
	}
	method diferenciaDeSolDe(unaPlanta){
		return self.horasDeSol() - unaPlanta.horasDeSolTolera()
	}
	
	method cantidadDePlantasBienAsociadas() = plantas.count({planta => self.seAsociaBien(planta)})
	
	method seAsociaBien(unaPlanta) 
}	



class ParcelaEco inherits Parcela {
	
	override method seAsociaBien(unaPlanta){
		/* el método tieneComplicaciones no debía pasar como argumento la planta. */
		return (!self.tieneComplicaciones() and unaPlanta.parcelaIdeal(self))		
	}
	
}

class ParcelaIndus inherits Parcela {
	
	override method seAsociaBien(unaPlanta){
		return plantas.size() <= 2 and unaPlanta.esFuerte()
	}
	
}



