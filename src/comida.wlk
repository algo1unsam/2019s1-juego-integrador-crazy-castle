import wollok.game.*
import conejo.*
import direccion.*
import niveles.*

class Zanahoria {
	var property position
	method nombre() = "zanahoria"

	method image() = "zanahoria.png"

	method chocaCon(unconejo) {
		unconejo.comer(self)
	}
	method teMueres() {	}

} 

class Caja {

	var property position

	method nombre() = "caja"
	method image() = "caja1.png"

	
	method chocaCon(conejo) {
		if (izquierda==conejo.posicionAnterior()) {
			self.position(self.position().left(1))
		}
		else{
		self.position(self.position().right(1))}
	}

	method teMueres() {	}

	method repeleAlMalo() {
		if (not game.colliders(self).isEmpty()) {
			(game.colliders(self)).forEach{ p => p.retrocede()}
		}
	}

}

