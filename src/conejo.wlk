import wollok.game.*
import comida.*
import malo.*
import niveles.*
import direccion.*
import juego.*

object conejo {

	var property sigueVivo = true
	var property puntos = 10000
	var property position = game.at(22, 1)
	var property imagen = "conejo2.png"
	var property posicionAnterior = null

	method nombre() = "conejo"

	method chocaCon(algo) {
	}

	method image() {
		return imagen
	}

	method comer(unazanahoria) {
		if (self.sigueVivo()) {
			puntos += 100
			juego.borrar(unazanahoria)
			puertaMagica.restarZanahoria()
		}
	}

	method entraPor(unapuerta) {
		if (self.position() == unapuerta.position()) self.position(unapuerta.position())
	}

	method restaPuntos() {
		if (puntos >= 100) {
			puntos -= 100
		} else {
			self.teMueres()
		}
	}

	method teMueres() {
		juego.borrar(self)
		self.cambioDeImagen()
		sigueVivo = false
		game.stop()
	}

	method cambioDeImagen() {
		imagen = "conejoPierde.png"
		juego.dibujar(self)
		game.say(self, " Perdiste ")
	}

	method entrarPorPuerta() {
		
		game.colliders(self).forEach{ puerta =>self.buscoPuerta(puerta)}
	}

	method buscoPuerta(puerta) {
		if (puerta.nombre() == "puerta") {
			puerta.salida()
		} else {
			game.say(self,"no veo ninguna puerta")
		}
	}

}

