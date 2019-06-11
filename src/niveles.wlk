import wollok.game.*
import conejo.*
//https://www.youtube.com/watch?v=AowvrEbIiKI  sound del juego
//game.sound()permite poner musica al juego
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

object gravedad{
	method terrestre(){
		var position=conejo.position().down(1)
		if(position.allElements()==null){
			conejo.position().down(1)
		}
	}
}