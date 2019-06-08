import wollok.game.*
import conejo.*

class Malo {

	var imagen
	var cantidadpasos 
	var cantidadpasosDerecha 
	var property position = game.at(6, 13)

	method image() = imagen

	
		method movimiento(){
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
		} 
	}

	method seMueveAlaIzquierda() {
		if (cantidadpasos > 0) {
			cantidadpasos -= 1
			self.position(self.position().left(1))
		} 
	}

	method resetpasos() {
		cantidadpasos =5
		cantidadpasosDerecha =5 
	}

	method chocaCon(conejo) {
		if (self.position() == conejo.position()) {
			self.position().right(1)
			conejo.restaPuntos()
		}
	}

}

