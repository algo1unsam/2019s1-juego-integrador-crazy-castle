import conejo.*
import wollok.game.*

object derecha {

	method chocaCon(algo) {
	}
	method movimientoDerecha(alguien) {
		alguien.position(alguien.position().right(1))
		alguien.posicionAnterior(self)
	}
	method teMueres() {
	}
}

object izquierda {

	method chocaCon(algo) {
	}

	method movimientoIzquierda(alguien) {
	alguien.position(alguien.position().left(1))
	alguien.posicionAnterior(self)
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


