class ProfesionalAsociado {
	var property universidad = null
	
	method provinciasDondePuedeTrabajar() { return #{"entreRios", "corrientes", "santaFe"} }
	
	method honorariosPorHora() { return 3000 }
}


class ProfesionalVinculado {
	var property universidad = null
	
	method provinciasDondePuedeTrabajar() = #{universidad.provincia()}
	method honorariosPorHora() = universidad.honorariosPorHora()
}


class ProfesionalLibre {
	var property universidad = null
	var property provinciasDondePuedeTrabajar = null
	var property honorariosPorHora = null
}


class Universidad {
	var property provincia = null
	var property honorariosPorHora = null
}


class EmpresaServicios {
	const solicitante = []
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
	method agregarSolicitante(soli){solicitante.add(soli)}
	method puedeSatisfacerSolicitante(soli) = 
		if(soli.clase() == "persona"){
			self.hayProfesionalesQuePuedenTrabajarEn(soli.provincia())}
		else if(soli.clase() == "institucion"){
			 soli.universidadesReconocidas().contais(self.universidadesFormadoras()) }
		else 5	
//no se como hacer este	
}


class Persona {
	var property provincia = null
	method clase() = "persona"
}


class Institucion {
	const universidadesReconocidas = []
	
	method reconocerUniversidad(univ){universidadesReconocidas.add(univ)}
	method universidadesReconocidas() = universidadesReconocidas.asSet()
	method clase() = "institucion"
}


class Club {
	const provincias = []
	
	method crearSede(prov){provincias.add(prov)}
	method provincias() = provincias.asSet()
	method clase() = "club"
}


