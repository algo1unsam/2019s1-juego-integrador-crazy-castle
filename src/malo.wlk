import wollok.game.*
import conejo.*
import comida.*
import juego.*
import direccion.*

class Malo {

	var imagen
	var property cantidadpasosIzquierda
	var property cantidadpasosDerecha
	var property position
	var property posicionAnterior = null
	var property cantidadDePasos = null
	var property tiempo = 3

	method image() = imagen

	method nombre() = self

	method movimiento() {
		self.movimientoIzquierda()
		self.movimientoDerecha()
		if (cantidadpasosIzquierda == 0 && cantidadpasosDerecha == 0) {
			self.resetpasos( )
		}
	}

	method movimientoIzquierda() {
		if (cantidadpasosIzquierda > 0) {
			izquierda.movimientoIzquierda(self)
			cantidadpasosIzquierda--
		}
	}

	method movimientoDerecha() {
		if (cantidadpasosIzquierda == 0) {
			derecha.movimientoDerecha(self)
			cantidadpasosDerecha--
		}
	}

	method resetpasos() {
		cantidadpasosDerecha = cantidadDePasos
		cantidadpasosIzquierda = cantidadDePasos
	}

	method cantidadPasos() {
		cantidadDePasos = cantidadpasosIzquierda
	}

	method chocaCon(algo) {
		if (algo == conejo) {
			conejo.chocoConMalo(self)
		} else {
			if (posicionAnterior == derecha) {
				self.resetpasos()
			} else {
				cantidadpasosIzquierda = 0
			}
		}
	}

	method teMueres() {
		game.removeVisual(self)
	}

	method retrocede() {
		if (posicionAnterior == derecha) {
			izquierda.movimientoIzquierda(self)
		} else {
			derecha.movimientoDerecha(self)
		}
	}

}

