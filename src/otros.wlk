import profesionales.*
import solicitantes.*

class Universidad {
	var property provincia = null
	var property honorariosPorHora = null
	var property donaciones = 0
}


class EmpresaServicios {
	const clientes = #{}
	const profesionales = []
	var property honorariosPorHora = null
	
	method contratar(prof){profesionales.add(prof)}
	method cantidadProfesionalesQueEstudiaron(univ) = profesionales.count({prof => prof.universidad() == univ})
	method profesionalesCaros() = profesionales.filter({prof => prof.honorariosPorHora() > self.honorariosPorHora()}).asSet()
	method universidadesFormadoras() = profesionales.map({prof => prof.universidad()}).asSet()
	method profesionalMasBarato() = profesionales.min({prof => prof.honorariosPorHora()})
	method hayProfesionalEnMasDe3Provincias() = profesionales.any({prof => prof.provinciasDondePuedeTrabajar().size() > 3})
	method genteAcotada() = not self.hayProfesionalEnMasDe3Provincias()
	method hayProfesionalesQuePuedenTrabajarEn(prov) = profesionales.any({prof => prof.provinciasDondePuedeTrabajar().contains(prov)})
	method puedeSatisfacerA(soli) = profesionales.any({prof => soli.puedeAtenderloUnProfesional(prof)})		
	method darServicio(soli){ 
		if (not self.puedeSatisfacerA(soli)) 
		self.error("No puede dar el servicio")
		const profQueAtiende = profesionales.filter({prof => soli.puedeAtenderloUnProfesional(prof)}).anyOne()
		profQueAtiende.dineroImportado(profQueAtiende.dineroImportado() + profQueAtiende.honorariosPorHora())
		clientes.add(soli)		
	}
	method cantidadClientes() = clientes.size()
	method tieneComoClienteA(cliente) = clientes.contains(cliente)
	method esPocoAtractivo(prof){}


}


object asociacionProfLitoral{
	var property donaciones = 0
}