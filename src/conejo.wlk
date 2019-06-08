import wollok.game.*

object conejo {

	var property zanahorias = 8
	var puntos = 0
	var property position = game.at(12, 1)

	method image() ="conejo2.png"

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
 
	method comer(unazanahoria) {
		puntos += 100
		game.removeVisual(unazanahoria)
	}
	
	method chocaCon(alguien){
		
	}
	method puerta(){
		var element=#{}
		var puerta
		element=position.allElements()
		element.remove(self)
		puerta=element.anyOne()
		puerta.entraPorPuerta()
	}

}

