import wollok.game.*
import comida.*
import malo.*
import niveles.*
import puertas.*
import piso.*

import direccion.*

object conejo {

	var property sigueVivo = true
	var property zanahorias = 10
	var property puntos = 10000
	var property position = game.at(12, 1)
	var imagen = "conejo2.png"
	var property direccion=null	
	var property count=1
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
			puertaMagica.removerZanahorias(unazanahoria)
		}
	}

   
    method entraPor(unapuerta){
    		if(self.position()==unapuerta.position())
    	self.move(unapuerta.position())
    }
	
	method restaPuntos() {

		if (puntos >= 100) {
			puntos -= 100
			
		} else {
			self.teMueres()
		
		
		}
		
	}
	method teMueres() {

		game.removeVisual(self)
		self.cambioDeImagen()
		sigueVivo = false
	}

	method cambioDeImagen() {
		imagen = "conejo.png"
		game.addVisual(self)
		game.say(self, " Perdiste ")

	}
	
	
}

