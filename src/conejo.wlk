import wollok.game.*
import comida.*
import malo.*
import niveles.*
import direccion.*
import juego.*

object conejo {

	var property sigueVivo = true
	var property puntos = 3
	var property position = game.at(22, 1)
	var property positionOriginal=null
	var property imagen = "conejo2.png"
	var property posicionAnterior = null
	var property colision = true
	var tiempo=5
	method nombre() = "conejo"

	method chocaCon(algo) {
	}

	method image() {
		return imagen
	}

	method comer(unazanahoria) {
		if (self.sigueVivo()) {
			
			juego.borrar(unazanahoria)
			puertaMagica.restarZanahoria()
		}
	}

	method entraPor(unapuerta) {
		if (self.position() == unapuerta.position()) self.position(unapuerta.position())
	}

	method restaPuntos() {
		if (puntos >= 1) {
			puntos -= 1			
		} else {
			self.teMueres()
		}
	}

	method teMueres() {
		if (puntos == 0) {
			position=positionOriginal
			game.clear()
			juego.cargar()
			puntos=3
		} else {
			self.restaPuntos()
		}
	}
	method entrarPorPuerta() {
		game.colliders(self).forEach{ puerta => self.buscoPuerta(puerta)}
	}

	method buscoPuerta(puerta) {
		if (puerta.nombre() == "puerta") {
			puerta.salida()
		} else {
			game.say(self, "no veo ninguna puerta")
		}
	}

	method chocoConMalo(param1) {
		
		if (colision) {
			
			colision = false
			self.restaPuntos()
			game.say(self, "Te Quedan:" + puntos + "de vida")
		}
	}

	method resetcolision() {
		colision = true
	}
	method contador() {
		if(tiempo==0){
		self.resetcolision()
		tiempo=5
		}else{
			tiempo--
		}
	}

}
