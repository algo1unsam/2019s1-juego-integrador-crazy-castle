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
	method aplasta(){
		var elementos=#{}
		elementos.addAll(game.getObjectsIn(self.position().down(1)))
		if(not elementos.isEmpty()){
			elementos.forEach{persona=>persona.muerto()}
		}
	}

}

