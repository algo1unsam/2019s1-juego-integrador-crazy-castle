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

object gravedad {

	method nombre() = self
	method bajar(personaje) {
		
			personaje.forEach{alguien =>self.comprueboPosicion(alguien)}
			
		}
		
		method comprueboPosicion(algo)
		{
			if( game.getObjectsIn(algo.position().down(1)).isEmpty()){
				self.muevo(algo)
			}
			
		}
		

	method teMueres() {
	}

	method muevo(alguien) {
	  alguien.position(alguien.position().down(1))
		
	}
	
}

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

