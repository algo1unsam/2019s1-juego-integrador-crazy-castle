import wollok.game.*
import conejo.*
import direccion.*
import niveles.*
import juego.*

class Zanahoria {

	var property position

	method nombre() = "zanahoria"

	method image() = "zanahoria.png"

	method chocaCon(unconejo) {
		unconejo.comer(self)
	}

	method teMueres() {
	}

}

class Caja {

	var property position
	var property posicionAnterior = null

	method nombre() = "caja"

	method image() = "caja1.png"

	method chocaCon(alguien) {
		if (izquierda == alguien.posicionAnterior()) {
			izquierda.movimientoIzquierda(self)
		} else {
			derecha.movimientoDerecha(self)
		}
	}

	method repeleAlMalo() {
		if (not game.colliders(self).isEmpty()) {
			(game.colliders(self)).forEach{ p => p.retrocede()}
		}
	}

	method teArrastra() {
		if (self.position() == conejo.position()) {
			self.position().up(1)
		}
	}

	method aplasta() {
		var elementos = #{}
		elementos.addAll(game.getObjectsIn(position.down(1)))
		if (not elementos.isEmpty()) {
			elementos.forEach{ persona =>
				if (persona.nombre() == "zanahoria" or persona.nombre() == "puerta") {
					position.down(1)
				} else {
					persona.teMueres()
				}
			}
		}
	}

	method posicionAnterior() {
		return posicionAnterior
	}

	method comer(param) {
	}

	method teMueres() {
	}

}
