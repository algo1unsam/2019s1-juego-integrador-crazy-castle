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
	method aplasta(){
		var elementos=#{}
		elementos.addAll(gravedad.comprueboPosicion(self))
		if(not elementos.isEmpty()){
			elementos.forEach{persona=>persona.muerto()}
		}
	}

	method teMueres() {}
		}
	}

}

