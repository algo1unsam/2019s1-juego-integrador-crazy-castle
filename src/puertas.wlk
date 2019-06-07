import wollok.game.*
import conejo.*
class Puerta{
	
	var property position
	method image()
	method choque(alguien){
		
	}
}
class SubeDeNivel inherits Puerta{
	var property puertaSalida=null
	override method position() = game.at(3,1)
	override method image()="puerta subida.png"
	method salida(cordenada){
		puertaSalida= new BajaDeNivel(position=cordenada,puertaEntrada=self)
		
	}
	method entrar(){
		conejo.position(puertaSalida.position())
	}
}
class BajaDeNivel inherits Puerta{
	var puertaEntrada
	override method image()="puerta bajada.png"
	method entrar(){
		conejo.position(puertaEntrada.position())
	}
}