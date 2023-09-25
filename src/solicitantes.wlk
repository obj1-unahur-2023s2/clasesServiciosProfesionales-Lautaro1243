import profesionales.*
import otros.*

class Persona {
	var property provincia = null
	method puedeAtenderloUnProfesional(prof) = prof.provinciasDondePuedeTrabajar().contains(provincia)
}


class Institucion {
	const universidadesReconocidas = #{}
	
	method reconocerUniversidad(univ){universidadesReconocidas.add(univ)}
	method universidadesReconocidas() = universidadesReconocidas.asSet()
	method puedeAtenderloUnProfesional(prof) = universidadesReconocidas.contains(prof.universidad())
}


class Club {
	const provincias = #{}
	
	method crearSede(prov){provincias.add(prov)}
	method provincia() = provincias.asSet()
	method puedeAtenderloUnProfesional(prof) = not provincias.intersection(prof.provinciasDondePuedeTrabajar()).isEmpty()
}