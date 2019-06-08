import wollok.game.*
import conejo.*

class Malo {

	var imagen
	

	var property position = game.at(6, 13)

	method image() = imagen

method move(){
	self.position(self.position().right(1))
	self.position(self.position().left(1))
}    
	method chocaCon(conejo) {
		if (self.position() == conejo.position()) {
			self.position().rigt(1)
			conejo.restaPuntos()
		}
	}

/*method move(pos,personaje){
		var num
		num=1.random(10)
		if(num>=5){
			personaje.move(personaje.position().left(1))
		}else{
			personaje.move(personaje.position().right(1))
		}
	}
=======
	method image()=imagen
	method chocaCon(alguien){
		var elementos=#{}
		elementos= game.colliders(self)
		elementos.remove(self)
		alguien.restaPuntos()
		
	}	
//	method move(pos,personaje){
	//	var num
	//	num=1.random(10)
	//	if(num>=5){
	//		personaje.move(personaje.position().left(1))
	//	}else{
	//		personaje.move(personaje.position().right(1))
	//	}
	//}
>>>>>>> branch 'master' of https://github.com/algo1unsam/2019s1-juego-integrador-crazy-castle.git
	method choque(persona,pos){
		if(persona==conejo){
			conejo.restaPuntos()
			
		}
<<<<<<< HEAD
	}*/
	

}

