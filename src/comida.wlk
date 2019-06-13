import wollok.game.*
import conejo.*
import direccion.*
import niveles.*
class Zanahoria {
	method nombre()="zanahoria"
	method image() = "zanahoria.png"

	method chocaCon(unconejo) {
		unconejo.comer(self)
	}
method teMueres() {}
}

class Caja {
	var property position
	method nombre()="caja"
	method image() = "caja1.png"
	method chocaCon(alguien) {
		if (conejo.direccion() == izquierda) {
			position = position.left(1)
		} else {
			position = position.right(1)
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

