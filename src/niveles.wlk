import wollok.game.*
import conejo.*
import puertas.*
import direccion.*
//https://www.youtube.com/watch?v=AowvrEbIiKI  sound del juego
//game.sound()permite poner musica al juego
class Ladrillo {

	var property position = game.at(0, 0)

	method image() = "ladrillonivel.png"

	method chocaCon(alguien) {
	}
}

class LadrillosnivelSiguientes inherits Ladrillo {

	override method image() = "ladrillonivel.png"

	override method chocaCon(alguien) {
		alguien.position(alguien.position().up(1))
	}

}

class LadrillosParedIzquierda inherits Ladrillo {

	override method image() = "ladrillonivel.png"

	override method chocaCon(alguien) {
		alguien.position(alguien.position().right(1))

	}
}

class LadrillosParedDerecha inherits Ladrillo {

	override method image() = "ladrillonivel.png"

	override method chocaCon(alguien) {
		alguien.position(alguien.position().left(1))

}}
object gravedad{
	
	method terrestre(param){
		
		if(game.getObjectsIn(param.position().down(1)).isEmpty()){
			param.position(param.position().down(1))
}
	}

}


