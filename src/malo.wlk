import wollok.game.*
import conejo.*
class  Malo {
	var imagen
	
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
	method choque(persona,pos){
		if(persona==conejo){
			conejo.restaPuntos()
			
		}
	}
	
}
