import wollok.game.*
import conejo.*

class Malo {

	var imagen
	var aux
	var property cantidadpasos=null
	var property cantidadpasosDerecha=null
	var property position = game.at(6, 13)
	var property ultimoMovimiento=null
	method image() = imagen
method nombre()=self
	method movimiento() {
		self.seMueveAlaIzquierda()
		if (cantidadpasos == 0) {
			self.seMueveAlaDerecha()
		}
		if (cantidadpasos == 0 && cantidadpasosDerecha == 0) {
			self.resetpasos()
		}
	}

	method seMueveAlaDerecha() {
		if (cantidadpasosDerecha > 0) {
			cantidadpasosDerecha -= 1
			self.position(self.position().right(1))
			ultimoMovimiento="derecha"
		}
	}

	method seMueveAlaIzquierda() {
		if (cantidadpasos > 0) {
			cantidadpasos -= 1
			self.position(self.position().left(1))
			ultimoMovimiento="izquierda"
		}
	}

	method resetpasos() {
		cantidadpasos = aux
		cantidadpasosDerecha = aux
	}

	method chocaCon(algo) {
		if (algo == conejo and conejo.count() == 1) {
			conejo.restaPuntos()
			conejo.count(0)
			game.say(conejo, "Te Quedan:"+conejo.puntos()+"de vida")
		}
	}

	method teMueres() {
		game.removeVisual(self)
	}
	method retrocede(){
		if(ultimoMovimiento=="derecha"){
			self.seMueveAlaIzquierda()
		}else{
			self.seMueveAlaDerecha()
		}
	}
}

