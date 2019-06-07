import wollok.game.*

class Ladrillo{
	
	var property position = game.at(0,0)
	method image()="ladrillos.png"
	method choque(alguien){
		
	}
}

class LadrillosnivelSiguientes inherits Ladrillo{
   
	override method image()="ladrillonivel.png"
	override method choque(alguien){
		
	}
}

