import wollok.game.*
import conejo.*

class Puerta {

	var property tecla = false

	method image()

	method salida()

	method chocaCon(alguien) {
		keyboard.up().onPressDo({ self.salida()})
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
		conejo.position(puertaSalida.position())
	}

}

class PuertaQueHaceBajar inherits Puerta {

	var property puertaEntrada = null
	var property position

	override method image() = "puerta bajada.png"

	override method salida() {
		conejo.position(puertaEntrada.position())
	}

}

