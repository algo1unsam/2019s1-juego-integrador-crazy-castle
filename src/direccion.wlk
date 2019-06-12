import conejo.*
import wollok.game.*
object derecha {
	method chocaCon(algo) {}
	method movimientoDerecha() {
		conejo.move(conejo.position().right(1))
		conejo.chocaCon(conejo, conejo.position())
	}

}

object izquierda {
	method chocaCon(algo) {}
	method movimientoIzquierda() {
		conejo.move(conejo.position().left(1))
			conejo.chocaCon(conejo, conejo.position())
	}

}

object tecla{
var property estaTocada=true
	method chocaCon(algo) {}	
	
}
