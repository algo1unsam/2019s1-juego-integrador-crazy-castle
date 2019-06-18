import wollok.game.*
import conejo.*
import direccion.*
import niveles.*
import juego.*
class Zanahoria {
	var property position
	method nombre() = "zanahoria"

	method image() = "zanahoria.png"

	method chocaCon(unconejo) {
		unconejo.comer(self)
	}
	method teMueres() {	}

} 

class Caja {

	var property position

	method nombre() = "caja"
	method image() = "caja1.png"

	
	method chocaCon(conejo) {
		if (izquierda==conejo.posicionAnterior()) {
			self.position(self.position().left(1))
		}
		else{
		self.position(self.position().right(1))}
	}
	method repeleAlMalo() {
		if (not game.colliders(self).isEmpty()) {
			(game.colliders(self)).forEach{ p => p.retrocede()}
		}
	}


	method teArrastra() {
		if (self.position() == conejo.position()) {
		self.position().up(1)
		
		}
	}
	method aplasta(){
		var elementos=#{}
		elementos.addAll(game.getObjectsIn(position))
		if(not elementos.isEmpty()){
			elementos.forEach{persona=>persona.teMueres()}
		}
	}
	method posicionAnterior(){}
	method comer(param){}

	method teMueres() {}
}
/* 
object superTonico{//este objeto le da super fuerza para poder matar 1 malo
	var property tiempo=0
	method image()="superTonico.png"
	method chocaCon(conejo) {//cambio la foto del conejo, al agarrar el objeto
		juego.borrar(conejo)
		conejo.imagen("conejo_musculos.png")
		juego.dibujar(conejo)
		tiempo=100  //tiempo que durara el efecto
		juego.borrar(self)
		game.onTick(300,"superconejo",{self.tiempo()})//contara el tiempo
	}
	method tiempoTranscurrido(){// cuenta el tiempo q transcurre. y elimina los efectos al terminar
		if(tiempo>0){
			tiempo-=1
		}else{
			juego.borrar(conejo)
			conejo.imagen("conejo2.png")
			juego.dibujar(conejo)
		}
	}
	method terminaElEfecto(){// fin de los efectos del tonico
		tiempo=0
	}
	method teMueres() {	}
}
*/