import wollok.game.*
import conejo.*
class Puerta{
	
	var property position
	method image()
	method entraPorPuerta()
	method chocaCon(alguien){
			
	}
	method activar(pos){
		
	}
	method choco(dir){}
}
class SubeDeNivel inherits Puerta{
	var property puertaSalida=null
	override method position() = game.at(12,1)
	override method image()="puerta subida.png"
	method saleporPuerta(cordenada){
		puertaSalida= new BajaDeNivel(position=cordenada,puertaEntrada=self)
		game.addVisual(puertaSalida)
	}
	override method activar(pos){
		self.entraPorPuerta()
	}
	override method entraPorPuerta(){
		conejo.position(puertaSalida.position())
	}
	
	
}
class BajaDeNivel inherits Puerta{
	var property puertaEntrada=null
	override method image()="puerta bajada.png"
	override method entraPorPuerta(){
		conejo.position(puertaEntrada)
	}
	override method activar(pos){
		self.entraPorPuerta()
	}
	
}