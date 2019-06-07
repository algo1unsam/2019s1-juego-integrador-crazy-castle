import wollok.game.*

object conejo {

	var property zanahorias = 8
	var puntos = 0
	var property position = game.at(2, 2)

	method image() = "conejo grande.png"

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method comer(unazanahoria) {
		puntos += 100
		game.removeVisual(unazanahoria)
	}

}

