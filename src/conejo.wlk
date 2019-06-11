import wollok.game.*
import comida.*
import malo.*
import niveles.*
import puertas.*
import piso.*
import colision.*

object conejo {

	var property sigueVivo = true
	var property zanahorias = 8
	var puntos = 10000
	var property position = game.at(12, 1)
	var imagen = "conejo2.png"

	var property elemento = #{}
	

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

   
    method entraPor(unapuerta){
    		if(self.position()==unapuerta.position())
    	self.move(unapuerta.position())
    }
	method chocaCon(alguien) {
		if (self.position() == alguien.position()) 
		 self.restaPuntos()
		game.say(self, "¡ouch! ")

}
	method restaPuntos() {

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

	method conquienChoco(direccion) {
		
		elemento.addAll(game.colliders(self))
	
		elemento.forEach({elem=>elem.chocarCon(self,direccion)})
	}
	
		method seMueveA(puerta) {
			self.position(puerta.position())
}
}

