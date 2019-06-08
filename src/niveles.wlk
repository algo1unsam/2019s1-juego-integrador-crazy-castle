import wollok.game.*

class Ladrillo{
	
	var property position = game.at(0,0)
	method image()="ladrillos.png"
	method chocaCon(alguien){
		
	}
	method choque(persona,pos){}
}
//deveriamos separar el piso de las paredes
class LadrillosnivelSiguientes inherits Ladrillo{
   
	override method image()="ladrillonivel.png"
	override method chocaCon(alguien){
		alguien.position(alguien.position().up(1))
		
	}

}

