import conejo.*
import wollok.game.*
object derecha {

	method movimientoDerecha() {
		conejo.move(conejo.position().right(1))
		conejo.chocaCon(conejo.position())
	}

}

object izquierda {

	method movimientoIzquierda() {
		conejo.move(conejo.position().left(1))
			conejo.chocaCon(conejo.position())
	}

}


