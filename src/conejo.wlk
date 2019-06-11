import wollok.game.*
import puertas.*

object conejo {

	var property sigueVivo = true
	var property zanahorias = 8
	var puntos = 10000
	var property position = game.at(12, 1)
	var imagen = "conejo2.png"

	method image() {
		return imagen
	}

	method move(nuevaPosicion) {
		if (self.sigueVivo()) {
			self.position(nuevaPosicion)
		}
	}

	method comer(unazanahoria) {
		if (self.sigueVivo()) {
			puntos += 100
			game.removeVisual(unazanahoria)
		}
	}
    method subeDeNivel(unapuerta){
    	if(self.position()==unapuerta.position())
    	self.move(unapuerta.position())
    }
    
    method bajaDeNivel(unapuerta){
    		if(self.position()==unapuerta.position())
    	self.move(unapuerta.position())
    }
	method chocaCon(alguien) {
		if (self.position() == alguien.position()) 
		 self.teRestoPuntos()
		game.say(self, "¡ouch! ")
	}

	method teRestoPuntos() {
		if (puntos >= 100) {
			puntos -= 100
		} else {
			self.muerto()
		}
	}

	method muerto() {
		game.removeVisual(self)
		self.cambioDeImagen()
		sigueVivo = false
	}

	method cambioDeImagen() {
		imagen = "conejo.png"
		game.addVisual(self)
		game.say(self, " Perdiste ")
	}

	method movimientoDerecha() {
		self.move(self.position().right(1))
	}

	method movimientoIzquierda() {
		self.move(self.position().left(1))
	}

}

