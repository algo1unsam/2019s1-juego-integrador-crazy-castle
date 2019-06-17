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


	override method chocaCon(alguien) {	alguien.position(alguien.position().right(1))	}

}
class LadrillosnivelSiguientes inherits ParedDeLadrillos {

	override method image() = "ladrillonivel.png"

	override method chocaCon(alguien) {		}

}

class Puerta {

	//var property tecla = false

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
		if (tecla.estaTocada()) {
			conejo.position(puertaSalida.position())
		}
	}

	

}

class PuertaQueHaceBajar inherits Puerta {

	var property puertaEntrada = null
	var property position

	override method image() = "puerta bajada.png"

	override method salida() {
		if (tecla.estaTocada()) {
			conejo.position(puertaEntrada.position())
		
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
	var property position = game.at(22,13)
	var niveles=2
	override method image() = "puerta_fin.png"
	override method salida(){
		if(niveles==0){
		game.stop()
		
		}else{
			game.clear()
			juego.nivel2()
			niveles--
		}
	}
	method crearPuerta() {
		juego.dibujar(self)
	}
}
class PisoEnMovimiento inherits ParedDeLadrillos{
	var property movimiento=6
	var property movimientoizq=null
	var property movimientoder=null
	method reseteoMovimiento(){
		movimientoizq=movimiento
		movimientoder=movimiento
	}
	method movimiento(){
		self.seMueveAlaIzquierda()
		if (movimientoizq == 0) {
			self.seMueveAlaDerecha()
			}
		 if (movimientoizq == 0 && movimientoder == 0) {
			self.reseteoMovimiento( )
		}
		
	}
	method seMueveAlaDerecha() {
		var elemento=[]
		elemento.addAll(game.getObjectsIn(position.up(1)))
		if (movimientoder > 0) {
			movimientoder -= 1
			self.position(self.position().right(1))
			if(not elemento.isEmpty()){
				elemento.forEach{p=>p.move(p.position().right(1))}
			}
		}
	}
	method seMueveAlaIzquierda() {
		var elemento=[]
		elemento.addAll(game.getObjectsIn(position.up(1)))
		if (movimientoizq > 0) {
			movimientoizq -= 1
			self.position(self.position().left(1))
			if(not elemento.isEmpty()){
				elemento.forEach{p=>p.move(p.position().left(1))}
			}
		}
	}
	
	
}
