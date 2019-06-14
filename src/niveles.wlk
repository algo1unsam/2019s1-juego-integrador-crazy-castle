import wollok.game.*
import conejo.*
import direccion.*

//https://www.youtube.com/watch?v=AowvrEbIiKI  sound del juego
//game.sound()permite poner musica al juego
class Ladrillo {

	var property position = game.at(0, 0)

	method image() = "ladrillonivel.png"

	method chocaCon(alguien) {
	}

	method teMueres() {
	}

}

class LadrillosnivelSiguientes inherits Ladrillo {

	override method image() = "ladrillonivel.png"

	override method chocaCon(alguien) {

		if (self.position().left(1) > conejo.position()) {
			conejo.position(conejo.position().left(1))
		} 
		else
		   conejo.position(conejo.position().right(1))

		}

}

class LadrillosParedIzquierda inherits Ladrillo {

	override method image() = "ladrillonivel.png"


	override method chocaCon(alguien) {
		alguien.position(alguien.position().right(1))

	}

}

class Puerta {

	var property tecla = false

	method image()

	method salida()

	method chocaCon(conejo) {
		keyboard.up().onPressDo({ self.salida()})
	}

}

class PuertaQueHaceSubir inherits Puerta {

	var puertaSalida = null
	var property position

	override method image() = "puerta subida.png"

	method creoPuertaEn(posicion) {
		puertaSalida = new PuertaQueHaceBajar(position = posicion, puertaEntrada = self)
		game.addVisual(puertaSalida)
	}

	override method salida() {
		if (conejo.position() == self.position()) {
			
			conejo.position(puertaSalida.position())
			self.seteoTecla()
		}
	}

	method seteoTecla() {
		tecla = false
	}

}

class PuertaQueHaceBajar inherits Puerta {

	var property puertaEntrada = null
	var property position

	override method image() = "puerta bajada.png"

	override method salida() {
		if (tecla) {
			conejo.position(puertaEntrada.position())
			tecla = false
		}
	}

}

class Piso {

	var property position

	method imagen() = "ladrillos.png"

	method choque(alguien) {
	}

}

class LadrillosParedDerecha inherits Ladrillo {

	override method image() = "ladrillonivel.png"

	override method chocaCon(alguien) {
		alguien.position(alguien.position().left(1))
	}

}


object gravedad{
	method nombre()=self
	method terrestre(personajes){
		personajes.forEach{algo=>if(self.comprueboPosicion(algo).isEmpty()){algo.position(algo.position().down(1))}
			
		}
	}
	method teMueres() {}
	method comprueboPosicion(algo)=game.getObjectsIn(algo.position().down(1))
	
}

object puertaMagica inherits PuertaQueHaceSubir{
	var zanahoriasFaltantes
	var cantidad=0
	method zanahoriasFaltantes(param){
		zanahoriasFaltantes.addAll(param)
		cantidad=zanahoriasFaltantes.size()
	}
	method restarZanahoria(zanahoria){
		cantidad--
		zanahoriasFaltantes.remove(zanahoria)
	}
}
