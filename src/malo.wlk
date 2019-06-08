import wollok.game.*
class  Malo {
	
	
	method image()="malo1.png"
	method chocaCon(alguien){
		var elementos=#{}
		elementos= game.colliders(self)
		elementos.remove(self)
		alguien.restaPuntos()
		
	}	

}
