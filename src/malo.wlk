import wollok.game.*
import conejo.*

class Malo {

	var imagen
    
	var property cantidadpasosIzquierda
	var property cantidadpasosDerecha
	var property position = game.at(6, 13)
	var property movimientoDerecha=true
	var property cantidadDePasos=null
	method image() = imagen
	
method nombre()=self

	method movimiento() {
		self.seMueveAlaIzquierda()
		if (cantidadpasosIzquierda == 0) {
			self.seMueveAlaDerecha()	}
		if (cantidadpasosIzquierda == 0 && cantidadpasosDerecha == 0) {
			self.resetpasos( )
		}
	}

	method seMueveAlaDerecha() {
		if (cantidadpasosDerecha > 0) {
			cantidadpasosDerecha -= 1
			self.position(self.position().right(1))
		}
	}
	
	

	method seMueveAlaIzquierda() {
		if (cantidadpasosIzquierda > 0) {
			cantidadpasosIzquierda -= 1
			self.position(self.position().left(1))
			movimientoDerecha=false
		}
	}

	method resetpasos() {
		cantidadpasosDerecha=cantidadDePasos
		cantidadpasosIzquierda=cantidadDePasos
	
	}
	method cantidadPasos(){
				cantidadDePasos=cantidadpasosIzquierda
	}
	method chocaCon(algo) {
		if (algo == conejo) {
			conejo.restaPuntos()
			game.say(conejo, "Te Quedan:"+conejo.puntos()+"de vida")
			
		}
	}

	method teMueres() {
		game.removeVisual(self)
	}
	method retrocede(){
		if(movimientoDerecha){
			self.seMueveAlaIzquierda()
		}else{
			self.seMueveAlaDerecha()
		}
	}
}

