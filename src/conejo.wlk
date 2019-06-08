import wollok.game.*
object conejo {
	var property estado=true
	var property zanahorias = 8
	var  puntos = 100
	var property position = game.at(12, 1)
	var imagen="conejo2.png"

	method image()  ="conejo2.png"

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
		
	}
 
	method comer(unazanahoria) {
		puntos += 100
		game.removeVisual(unazanahoria)
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
    

	method puerta(){
		var element=#{}
		var puerta
		element=position.allElements()	
		if(not element.isEmpty()){
		puerta=element.anyOne()
		puerta.entraPorPuerta()
		
		}else{
			game.say(self,"no veo ninguna puerta")
		}
	}
	method estado() =false
	method muerto() {
		imagen="conejo2.png"
		estado=true
	}

}

