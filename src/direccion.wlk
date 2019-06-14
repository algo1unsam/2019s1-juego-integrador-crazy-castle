import conejo.*
import wollok.game.*

object derecha {

	method chocaCon(algo) {
	}

	method movimientoDerecha() {
		conejo.move(conejo.position().right(1))
	}

	method teMueres() {
	}

}

object izquierda {

	method chocaCon(algo) {
	}

	method movimientoIzquierda() {
		conejo.move(conejo.position().left(1))
	}

	method teMueres() {
	}

}
/* 
object gravedad {

	method nombre() = self


	
	
	method bajar(personaje) {
		if(game.getObjectsIn(personaje.position().down(1)).isEmpty()){
		
			personaje.position(personaje.position().down(1))
		}
		
	}
 
	method teMueres() {
	}

	method muevo(cosas) {
		if (cosas.position().down(1).isEmpty()) {
			cosas.position().down(1)
		}
	}
	
}
*/
object tecla {

	var property estaTocada = false

	method chocaCon(algo) {
	}

	method teMueres() {
	}

	method reseteate() {
		estaTocada = true
	}

}

