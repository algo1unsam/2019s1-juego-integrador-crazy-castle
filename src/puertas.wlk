import wollok.game.*
import conejo.*
class Puerta{
	
	var property position
	method image()
	method entraPorPuerta()
	method chocaCon(alguien){
			
	}
}
class SubeDeNivel inherits Puerta{
	var property puertaSalida=null
	override method position() = game.at(12,1)
	override method image()="puerta subida.png"
	method saleporPuerta(cordenada){
		puertaSalida= new BajaDeNivel(position=cordenada,puertaEntrada=self)
		game.addVisual(puertaSalida)
	}
	override method entraPorPuerta(){
		conejo.position(puertaSalida.position())
	}
	
}
class BajaDeNivel inherits Puerta{
	var puertaEntrada
	override method image()="puerta bajada.png"
	override method entraPorPuerta(){
		conejo.position(puertaEntrada.position())
	}
	method choque(persona,pos){}
}