import wollok.game.*
object conejo {
	var property zanahorias=8
	var property position = game.at(2,2)
	method image()="conejo.png"
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
		}
}

