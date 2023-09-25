import solicitantes.*
import otros.*

class ProfesionalAsociado {
	var property universidad = null
	var property dineroImportado = 0
	
	method provinciasDondePuedeTrabajar() { return #{"entreRios", "corrientes", "santaFe"} }
	method honorariosPorHora() { return 3000 }
	method donar(){ asociacionProfLitoral.donaciones(self.dineroImportado())
		self.dineroImportado(0)
	}
}


class ProfesionalVinculado {
	var property universidad = null
	var property dineroImportado = 0
	
	method provinciasDondePuedeTrabajar() = #{universidad.provincia()}
	method honorariosPorHora() = universidad.honorariosPorHora()
	method donar(){ self.universidad().donaciones(self.dineroImportado() * 0.5)
		self.dineroImportado(0)
	}
}


class ProfesionalLibre {
	var property universidad = null
	var property provinciasDondePuedeTrabajar = null
	var property honorariosPorHora = null
	var property dineroImportado = 0
	
	method donar(profesional, cantidad){ profesional.dineroImportado(profesional.dineroImportado() + cantidad) 
		dineroImportado -= cantidad
	}
}