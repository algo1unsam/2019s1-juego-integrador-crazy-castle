import wollok.game.*
import conejo.*
import direccion.*
import juego.*
import comida.*
//https://www.youtube.com/watch?v=AowvrEbIiKI  sound del juego
//game.sound()permite poner musica al juego
class ParedDeLadrillos {

	var property position = game.at(0, 0)

	method image() = "ladrillonivel.png"

	method chocaCon(alguien) {}

	method teMueres() {	}

}
class LadrillosParedDerecha inherits ParedDeLadrillos {

	override method image() = "ladrillonivel.png"

	override method chocaCon(alguien) {
		alguien.position(alguien.position().left(1))
	}

}

class LadrillosParedIzquierda inherits ParedDeLadrillos {

	override method image() = "ladrillonivel.png"


	override method chocaCon(alguien) {		alguien.position(alguien.position().right(1))	}

}
class LadrillosnivelSiguientes inherits ParedDeLadrillos {

	override method image() = "ladrillonivel.png"

	override method chocaCon(alguien) {		}

}

class Puerta {

	var property tecla = false

	method image()

	method salida()

	method chocaCon(conejo) {
		keyboard.up().onPressDo({ self.salida()})
	}

}

class PuertaQueHaceSubir inherits Puerta {

	var puertaSalida = null
	var property position

	override method image() = "puerta subida.png"

	method creoPuertaEn(posicion) {
		puertaSalida = new PuertaQueHaceBajar(position = posicion, puertaEntrada = self)
		juego.dibujar(puertaSalida)
	}

	override method salida() {
		if (conejo.position() == self.position()) {
			
			conejo.position(puertaSalida.position())
			self.seteoTecla()
		}
	}

	method seteoTecla() {
		tecla = false
	}

}

class PuertaQueHaceBajar inherits Puerta {

	var property puertaEntrada = null
	var property position

	override method image() = "puerta bajada.png"

	override method salida() {
		if (tecla) {
			conejo.position(puertaEntrada.position())
			tecla = false
		}
	}

}

class Piso {

	var property position

	method imagen() = "ladrillos.png"

	method choque(alguien) {
	}

}



object puertaMagica inherits PuertaQueHaceSubir{
	
	var cantidad=null
	method zanahoriasFaltantes(param){
		self.position(game.at(19,1))
		cantidad=param

	}

	method restarZanahoria(){
		cantidad-=1
		if(cantidad==0){
			juego.dibujar(self)
			self.creoPuertaEn(game.at(19,13))
			gameOver.crearPuerta()
		}
	}
	method crearZanahorias(pos) {
		var posicion=[]
		posicion.addAll(pos)
		self.zanahoriasFaltantes(pos.size())
		posicion.forEach{p=>juego.dibujar(new Zanahoria(position=p))}
	}
}

object gameOver inherits Puerta{
	var property position = game.at(23,13)

	override method image() = "puerta subida.png"
	override method salida(){
		game.stop()
	}
	method crearPuerta() {
		juego.dibujar(self)
	}
}

