import conejo.*
import wollok.game.*

object derecha {

	method chocaCon(algo) {
	}

	method movimientoDerecha() {
		conejo.direccion(self)
		conejo.move(conejo.position().right(1))
		conejo.count(1)
	}

	method teMueres() {
	}

}

object izquierda {

	method chocaCon(algo) {
	}

	method movimientoIzquierda() {
		conejo.direccion(self)
		conejo.move(conejo.position().left(1))
		conejo.count(1)
	}

	method teMueres() {
	}

}

object tecla {

	var property estaTocada = false

	method chocaCon(algo) {
	}

	method teMueres() {
	}
	method reseteate()
	{
		estaTocada=true
	}

}

