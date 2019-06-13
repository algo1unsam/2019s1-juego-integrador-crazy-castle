import wollok.game.*
import conejo.*
import direccion.*
class Zanahoria {

	method image() = "zanahoria.png"

	method chocaCon(unconejo) {
		unconejo.comer(self)
	}

}

class Caja {
	var property position
	method image() = "caja1.png"
	method chocaCon(alguien) {
		if (conejo.direccion() == izquierda) {
			position = position.left(1)
		} else {
			position = position.right(1)
		}
	}

	method teArrastra() {
		if (self.position() == conejo.position()) self.position().up(1)
	}

}

