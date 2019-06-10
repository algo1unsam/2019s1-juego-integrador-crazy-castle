import wollok.game.*
object conejo {
	var property estado=true
	var property zanahorias = 8
	var  puntos = 100
	var property position = game.at(12, 1)
	var imagen="conejo2.png"
	var property direccion

	method image()  ="conejo2.png"

	method move(nuevaPosicion) {
	if(self.sigueVivo()){
		self.position(nuevaPosicion)	
	}
	}
 
	method comer(unazanahoria) {
		if(self.sigueVivo()){
		puntos += 100
		game.removeVisual(unazanahoria)
	}
	
	}
	
	method chocaCon(alguien){
		
	}

	
	method restaPuntos(){
		if(puntos>=100){
		puntos -=100
		
		}else{
			self.muerto()
		}
	}
    

	method teclaUP(){
		var elemento=#{}
		elemento.addAll(self.eliminoConejo(game.colliders(self)))
		elemento.choque(self,position)
	}
	method estado() =false
	method muerto() {
		game.removeVisual(self)
		imagen="conejo.png"
		game.addVisual(self)
		estado=true
	}
	method sigueVivo()=estado
	method eliminoConejo(elemento){if(elemento==self){return elemento.remove(self)}else{return elemento}}
	method derecha(){
		self.move(self.position().right(1))
		direccion="der"
	}
	method izquierda(){
		direccion="izq"
		self.move(self.position().left(1))
		
	}
}

