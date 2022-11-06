/*
 * Faltó importar los objetos del archivo plantas.* 
 * Falta método para poder agregar parcelas a la colección parcelas. Te dejo un ejemplo
 * de como hacerlo.
 * 
 * El método promedioDePlantas(plantas) no es correcto. Te dejo una posible solución.
 * 
 * El método parcelaMasAutosustentable(plantas) no es correcto. Te dejo una posible solución.
 * 
 */
import plantas.*
import parcelas.*

object inta {
	const parcelas = #{}
	
	method agregarParcela(unaParcela) {parcelas.add(unaParcela)}
	
	method sumaDePlantasPorParcela() = parcelas.sum({p => p.plantas().size()}) 
	method promedioDePlantasPorParela() = self.sumaDePlantasPorParcela() / parcelas.size()
	
	method parcelasConMasDeCuatroPlantas() = parcelas.filter({p => p.plantas().size() > 4})
	method masAutoSustentable() = self.parcelasConMasDeCuatroPlantas().max({p => p.cantidadDePlantasBienAsociadas()})

}