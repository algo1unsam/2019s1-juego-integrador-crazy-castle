import wollok.game.*
import comida.*
import malo.*
import direccion.*
import niveles.*
import conejo.*

object juego {

	method cargar() {
		game.title("Bugs Bunny")
		game.height(15)
		game.width(25)
		game.ground("fondo.png")
		const ancho = game.width() - 1
		const largo = game.height() - 1
//LOGICA PARA PUERTAS
		var puerta1 = new PuertaQueHaceSubir(position = game.at(13, 1))
		puerta1.creoPuertaEn(game.at(13, 5))

		var puerta2 = new PuertaQueHaceSubir(position = game.at(2, 1))
		puerta2.creoPuertaEn(game.at(2, 13))
		const puerta3 = new PuertaQueHaceSubir(position = game.at(10, 5))
		puerta3.creoPuertaEn(game.at(10, 11))
		const puerta4 = new PuertaQueHaceSubir(position = game.at(13, 11))
		puerta4.creoPuertaEn(game.at(18, 13))

//onst pisonivel0 = new Ladrillo()

		const zanahoria = new Zanahoria()
		const zanahoria1 = new Zanahoria()
		const zanahoria2 = new Zanahoria()
		const zanahoria3 = new Zanahoria()
		const zanahoria4 = new Zanahoria()
		//puertaMagica.zanahoriasFaltantes([zanahoria,zanahoria1,zanahoria2,zanahoria3,zanahoria4])
		var caja = new Caja(position = game.at(10, 5))

		var caja1 = new Caja(position = game.at(6, 9))
		var malo = new Malo(imagen = "malo1.png", position = game.at(15, 1),cantidadpasosIzquierda=10,cantidadpasosDerecha=10)
	
		var malo1 = new Malo(imagen = "malo2.png", position = game.at(6, 13),cantidadpasosIzquierda=10,cantidadpasosDerecha=10)
		
		
//	AGREGO A BUGS BUNNY
		game.addVisual(conejo)
//PERSONAJES MALOS
		game.addVisual(malo)
		game.addVisual(malo1)
//COMIDA
		game.addVisualIn(zanahoria, game.at(19, 9))
		game.addVisualIn(zanahoria1, game.at(13, 5))
		game.addVisualIn(zanahoria2, game.at(7, 5))
		game.addVisualIn(zanahoria3, game.at(10, 11))
		game.addVisualIn(zanahoria4, game.at(5, 13))

//CAJAS
		game.addVisual(caja)
		game.addVisual(caja1)
			// PUERTAS
		game.addVisual(puerta1)
		game.addVisual(puerta2)
		game.addVisual(puerta3)
		game.addVisual(puerta4)
//LADRILLOS
		var posicionNiveles = []
		
		(0 .. largo).forEach{ n => posicionNiveles.add(new Position(0, n))}
		(0 .. largo).forEach{ n => posicionNiveles.add(new Position(ancho, n))} 

		posicionNiveles.addAll([ new Position(5,4), new Position(6,4), new Position(7,4), new Position(8,4), new Position (9,4), new Position (10,4), new Position (11,4), new Position (12,4), new Position (13,4), new Position (14,4), new Position (15,4), new Position (16,4), new Position (17,4), new Position (18,4) ])
		posicionNiveles.addAll([ new Position(1, 8), new Position(2, 8), new Position(3,8), new Position(4,8), new Position(5,8), new Position(6,8), new Position(18,8), new Position(19,8), new Position(20,8), new Position(21,8), new Position(22,8), new Position(23,8), new Position(24,8) ])
		posicionNiveles.addAll([ new Position(1, 12), new Position(2,12), new Position(3,12), new Position(4,12), new Position(5,12), new Position(6,12), new Position (18,12), new Position (19,12), new Position (20,12), new Position (21,12), new Position (22,12), new Position (23,12), new Position (24,12) ])
		posicionNiveles.addAll([ new Position(9, 10), new Position(10,10), new Position(11,10), new Position(12,10), new Position(13,10), new Position(14,10)])		
		posicionNiveles.forEach{ nivel => self.dibujar(new LadrillosnivelSiguientes(position = nivel))}
		
//PAREDES
		var posParedes = []
		var posParedIzquierda = []
		var posParedDerecha = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(n, 0))} // bordeAbajo
		(0 .. largo).forEach{ n => posParedIzquierda.add(new Position(0, n))} // bordeIzq 
		(0 .. largo).forEach{ n => posParedDerecha.add(new Position(ancho, n))} // bordeDer
		posParedes.forEach{ p => self.dibujar(new LadrillosnivelSiguientes(position = p))}
		posParedIzquierda.forEach{ p => self.dibujar(new LadrillosParedIzquierda(position = p))}
		posParedDerecha.forEach{ p => self.dibujar(new LadrillosParedDerecha(position = p))}
			// COLISIONES
		game.whenCollideDo(conejo, { algo => algo.chocaCon(conejo)})
		game.whenCollideDo(caja1, { algo => algo.chocaCon(caja)})
		game.whenCollideDo(caja, { algo => algo.chocaCon(caja)}
		)
		game.onTick(1000, "caminaHacialaIzquierda", { malo.movimiento()})
		game.onTick(1000, "caminaHacialaIzquierda", { malo1.movimiento()})
		
		var personajesConGravedad = [ conejo, malo1, malo, caja, caja1 ]
		 
			// gravedad
		//game.onTick(500, "gravedad", { gravedad.terrestre(personajesConGravedad)	})
		game.onTick(50, "tecla", { tecla.estaTocada(false)	})
			// TECLADO
		keyboard.left().onPressDo{ izquierda.movimientoIzquierda()}
		keyboard.right().onPressDo{ derecha.movimientoDerecha()}
		keyboard.up().onPressDo{ tecla.reseteate()}
	}

	method dibujar(dibujo) {
		game.addVisual(dibujo)
		
	}
	method juego2() {
		game.stop() 
	}

}

