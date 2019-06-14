import wollok.game.*
import conejo.*
import direccion.*
import juego.*
class Puerta {

	method image()

	method salida()
	
method teMueres() {}

	method chocaCon(alguien) {
		self.salida()
	}

}

class PuertaQueHaceSubir inherits Puerta {
var property position
	var puertaSalida = null
	

	 override method image() = "puerta subida.png"

	method creoPuertaEn(posicion) {
		puertaSalida = new PuertaQueHaceBajar(position = posicion, puertaEntrada = self)
		game.addVisual(puertaSalida)
	}

	override method salida() {
		if(tecla.estaTocada()){
		conejo.position(puertaSalida.position())
		tecla.reseteate()
		}
	}

}

class PuertaQueHaceBajar inherits Puerta {
var property position
	var property puertaEntrada = null
	override method image() = "puerta bajada.png"

	override method salida() {
		if(tecla.estaTocada()){
		conejo.position(puertaEntrada.position())
		tecla.estaTocada(false)
	}
	
	}

}
object puertaMagica inherits PuertaQueHaceSubir {
	
	var property zanahoriasFaltantes=[]
	var cantidad=0
	method pongoPuerta(){
	position=game.at(23,1)
	}
	method zanahoriasFaltantes(param){
		zanahoriasFaltantes.addAll(param)
		cantidad=zanahoriasFaltantes.size()
	}
	method removerZanahorias(param) {
		zanahoriasFaltantes.remove(param) 
		cantidad--
		if(cantidad==0){
			self.apareceLaPuerta()
		}
	}
	
	method apareceLaPuerta() {
		position=game.at(23,1)
		juego.juego2()
		juego.dibujar(self)
	
	}

}