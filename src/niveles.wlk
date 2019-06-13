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
	method choque(persona,pos){}
	method muerto() {}

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
	method nombre()=self
	method terrestre(param){
		
		if(self.comprueboPosicion(param).isEmpty()){
			param.position(param.position().down(1))
}
	}
	method muerto() {}
	method comprueboPosicion(param)=game.getObjectsIn(param.position().down(1))
	
}


