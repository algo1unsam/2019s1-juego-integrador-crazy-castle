import wollok.game.*
import conejo.*
class Puerta{
	
	var property position
	method image()
	method salida()
	method chocaCon(alguien){
		
	}
	
}
class PuertaQueHaceSubir inherits Puerta{
	var puertaSalida=null
	override method position() = game.at(12,1)
	override method image()="puerta subida.png"
	method creoPuertaEn(posicion)
		{
			var 
	puertaSalida= new PuertaQueHaceBajar
		           (position=cordenada,puertaEntrada=self) 
		game.addVisual(self)
	}
	override method salida(){
		conejo.position(self.position())
	}
	

}
class PuertaQueHaceBajar inherits Puerta{
	var property puertaEntrada=null
	override method image()="puerta bajada.png"
	override method salida(){
		conejo.position(self.position())
	}
	
}
/*

class PuertaSalida{
	var property position 
	
	method chocaCon(algo){
	
	}
	
	method cambioPosicionAPuertaDeSalida(){
		if(conejo.position()== self.position()){
			conejo.move(self.position())
		}
		
	}
	
}

class PuertaEntrada
  {
	var property position 
	
	method chocaCon(algo){
		
	}
	
	method cambioPosicionAPuertaDeSalida(){
		if(conejo.position()== self.position()){
			conejo.move(self.position())
		}
		}
		}
	
*/