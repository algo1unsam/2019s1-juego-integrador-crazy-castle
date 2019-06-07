import wollok.game.*
import conejo.*
class Puerta{
	
	var property position
	method image()
	method choque(alguien){
		
	}
}
class Sube inherits Puerta{
	var property puertaSalida=null
	override method position() = game.at(3,1)
	override method image()="puerta.png"
	method salida(cordenada){
		puertaSalida= new Baja(position=cordenada,puertaEntrada=self)
		
	}
	method entrar(){
		conejo.position(puertaSalida.position())
	}
}
class Baja inherits Puerta{
	var puertaEntrada
	override method image()="puerta.png"
	method entrar(){
		conejo.position(puertaEntrada.position())
	}
}