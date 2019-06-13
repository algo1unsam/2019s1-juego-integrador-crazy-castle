import wollok.game.*
import conejo.*
import direccion.*

class Puerta {

	method image()

	method salida()
	
method teMueres() {}

	method chocaCon(alguien) {
		self.salida()
	}

}

class PuertaQueHaceSubir inherits Puerta {

	var puertaSalida = null
	var property position

	override method image() = "puerta subida.png"

	method creoPuertaEn(posicion) {
		puertaSalida = new PuertaQueHaceBajar(position = posicion, puertaEntrada = self)
		game.addVisual(puertaSalida)
	}

	override method salida() {
		if(tecla.estaTocada()){
		conejo.position(puertaSalida.position())
		tecla.reseteate()
		}
	}

}

class PuertaQueHaceBajar inherits Puerta {

	var property puertaEntrada = null
	var property position

	override method image() = "puerta bajada.png"

	override method salida() {
		if(tecla.estaTocada()){
		conejo.position(puertaEntrada.position())
		tecla.estaTocada(false)
	}
	
	}

}

