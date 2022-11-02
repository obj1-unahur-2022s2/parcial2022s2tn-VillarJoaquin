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
	method tieneComplicaciones(unaPlanta){
		return plantas.any({ p => unaPlanta.horasDeSolTolera() < horasDeSol})
	}
	
	method plantarUnaPlanta(unaPlanta) {
		if (self.superaCapacidad() or self.diferenciaDeSolDe(unaPlanta) > 2)
		 self.error("No se puede plantar mas plantas")
		else		
			plantas.add({unaPlanta})
	}
	method superaCapacidad() {
		return plantas.size() > 5 
	}
	method diferenciaDeSolDe(unaPlanta){
		return self.horasDeSol() - unaPlanta.horasDeSolTolera()
	}
	
}	



class ParcelaEco inherits Parcela {
	
	method seAsociaBien(unaPlanta){
		return (!self.tieneComplicaciones(unaPlanta) and unaPlanta.parcelaIdeal(self))		
	}
	
}

class ParcelaIndus inherits Parcela {
	
	method seAsociaBien(unaPlanta){
		return plantas.size() <= 2 and unaPlanta.esFuerte()
	}
	
}



