import parcelas.*

class Plantas {
	var property anioDeObtencion 
	var property altura 
	
	method horasDeSolTolera()
	
	method esFuerte() {
		return self.horasDeSolTolera() > 10 
	}
	method daNuevasSemillas() {
		return self.esFuerte() 
	}
	method espacioQueOcupa() 
	
	method parcelaIdeal(unaParcela)	
	
	
}


class Menta inherits Plantas {
	var property valor=0
	
	override method horasDeSolTolera(){
		return 6
	}
	override method daNuevasSemillas() {
	 return super() or altura > 0.4
	}
	override method espacioQueOcupa() {
		return	altura * 3
	}
	override method parcelaIdeal(unaParcela){
		return unaParcela.superficie() > 6 
	}
	
	
		
}

class Soja inherits Plantas {
	
	override method horasDeSolTolera(){
		if (altura < 0.5) {
			return 6
		}
		else if  (altura.between(0.5,1)){
			return 7
		}
		else return 9
	}
	override method daNuevasSemillas() {
	 return super() or anioDeObtencion > 2007 and altura > 1
	}
	override method espacioQueOcupa() {
		return	altura / 2
	}
	override method parcelaIdeal(unaParcela){
		return unaParcela.horasDeSol() == self.horasDeSolTolera()
	}
		
}

class Quinoa inherits Plantas {
	

	
	override method daNuevasSemillas() {
	 return super() or anioDeObtencion < 2005
	}
	
	override method espacioQueOcupa() {
		return	0.5
	}
	override method parcelaIdeal(unaParcela){
		return unaParcela.plantas({p => p.altura() > 1.5})
	}
	
}


class CepaDeQuinoa inherits Quinoa {
	var property cantidadDeHorasSol 
	
	override method horasDeSolTolera(){
		return cantidadDeHorasSol 
	}
}

class SojaTransgenica inherits Soja {
	
	override method daNuevasSemillas() {
		return false
	}
	override method parcelaIdeal(unaParcela){
		return unaParcela.plantas({p => p.size() == 1})
	}
	
}

class Hiberbabuena inherits Menta {
	
	override method espacioQueOcupa() {
		return	super() * 2
	}

}

