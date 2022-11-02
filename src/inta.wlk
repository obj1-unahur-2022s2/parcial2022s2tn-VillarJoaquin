import parcelas.*

object inta {
	const parcelas = #{}
	
	method promedioDePlantas(plantas){
		return plantas.size() / parcelas.size() 
	}
	
	method parcelaMasAutosustentable(plantas){
		return parcelas.size({ p => p > 4}) and  		
			   parcelas.plantas({p => plantas.seAsociaBien(p)})
		
	}
}