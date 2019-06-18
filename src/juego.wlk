import wollok.game.*
import comida.*
import malo.*
import direccion.*
import niveles.*
import conejo.*

object juego {

	method cargar() {
		game.title("Bugs Bunny")
		game.height(16)
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
		puerta4.creoPuertaEn(game.at(1, 9))
//const pisonivel0 = new Ladrillo()
		puertaMagica.crearZanahorias([ new Position(19,9), new Position(13,5), new Position(7,5), new Position(10,11), new Position(5,13) ])
		puertaMagica.posicionPuerta2(game.at(19,1))
		var cajas = []
		var caja = new Caja(position = game.at(10, 5))
		var caja1 = new Caja(position = game.at(6, 9))
		var malo = new Malo(imagen = "malo1.png", position = game.at(15, 1), cantidadpasosIzquierda = 10, cantidadpasosDerecha = 10)
		var malo1 = new Malo(imagen = "malo2.png", position = game.at(7, 13), cantidadpasosIzquierda = 4, cantidadpasosDerecha = 4)
		cajas.addAll([ caja, caja1 ])
			// metodos q se usan mas abajo
		var seMueven = [ malo, malo1 ]
		var personajesConGravedad = [ ]
		malo.cantidadPasos()
		malo1.cantidadPasos()
//	AGREGO A BUGS BUNNY
		game.addVisual(conejo)
//PERSONAJES MALOS
		game.addVisual(malo)
		game.addVisual(malo1)
//CAJAS
		game.addVisual(caja)
		game.addVisual(caja1)
			// PUERTAS
		game.addVisualIn(puerta1,puerta1.position())
		game.addVisualIn(puerta2,puerta2.position())
		game.addVisualIn(puerta3,puerta3.position())
		game.addVisualIn(puerta4,puerta4.position())
//LADRILLOS
		var posicionNiveles = []
		(0 .. largo).forEach{ n => posicionNiveles.add(new Position(0, n))}
		(0 .. largo).forEach{ n => posicionNiveles.add(new Position(ancho, n))}
		posicionNiveles.addAll([ new Position(5,4), new Position(6,4), new Position(7,4), new Position(8,4), new Position (9,4), new Position (10,4), new Position (11,4), new Position (12,4), new Position (13,4), new Position (14,4), new Position (15,4), new Position (16,4), new Position (17,4), new Position (18,4) ])
		posicionNiveles.addAll([ new Position(1, 8), new Position(2, 8), new Position(3,8), new Position(4,8), new Position(5,8), new Position(6,8), new Position(18,8), new Position(19,8), new Position(20,8), new Position(21,8), new Position(22,8), new Position(23,8), new Position(24,8) ])
		posicionNiveles.addAll([ new Position(1, 12), new Position(2,12), new Position(3,12), new Position(4,12), new Position(5,12), new Position(6,12), new Position (18,12), new Position (19,12), new Position (20,12), new Position (21,12), new Position (22,12), new Position (23,12), new Position (24,12) ])
		posicionNiveles.addAll([ new Position(9, 10), new Position(10,10), new Position(11,10), new Position(12,10), new Position(13,10), new Position(14,10), new Position(15,10) ])
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
		personajesConGravedad.addAll([ conejo, malo1, malo, caja, caja1 ])
			// COLISIONES
		game.whenCollideDo(conejo, { algo => algo.chocaCon(conejo)})
		game.whenCollideDo(caja1, { algo => algo.chocaCon(caja)})
		game.whenCollideDo(caja, { algo => algo.chocaCon(caja)})
			// movimiento		
		game.onTick(700, "caminaHacialaIzquierda", { seMueven.forEach{ mal => mal.movimiento()}})
			// gravedad
		game.onTick(100, "gravedad", { gravedad.bajar(personajesConGravedad)})
			// cajas
		game.onTick(100, "si alguien es aplastado", { cajas.forEach{ caj => caj.aplasta()}})
			// TECLADO
		keyboard.left().onPressDo{ izquierda.movimientoIzquierda()}
		keyboard.right().onPressDo{ derecha.movimientoDerecha()}
		keyboard.up().onPressDo{ tecla.reseteate()}
		game.onTick(100, "tecla", { tecla.estaTocada(false)})
	}

	method dibujar(dibujo) {
		game.addVisual(dibujo)
	}

	method borrar(dibujo) {
		game.removeVisual(dibujo)
	}

	method nivel2() {
		game.title("Bugs Bunny")
		game.height(16)
		game.width(25)
		game.ground("fondo.png")
		const ancho = game.width() - 1
		const largo = game.height() - 1
		conejo.position(game.at(1, 1))
//LOGICA PARA PUERTAS
		var puerta1 = new PuertaQueHaceSubir(position = game.at(10, 1))
		puerta1.creoPuertaEn(game.at(1, 5))
		var puerta2 = new PuertaQueHaceSubir(position = game.at(10, 5))
		puerta2.creoPuertaEn(game.at(1, 9))
		const puerta3 = new PuertaQueHaceSubir(position = game.at(8, 9))
		puerta3.creoPuertaEn(game.at(1, 13))
		const puerta4 = new PuertaQueHaceSubir(position = game.at(22, 13))
		puerta4.creoPuertaEn(game.at(22, 9))
			//puerta del final
		puertaMagica.crearZanahorias([ new Position(4,5), new Position(4,9), new Position(3,13), new Position(23,13), new Position(18,5) ])
		puertaMagica.position(game.at(14,1))
		gameOver.position(game.at(4,5))
		puertaMagica.posicionPuerta2(game.at(5,1))
		
		
		var cajas = []
		var caja = new Caja(position = game.at(15, 9))
		var caja1 = new Caja(position = game.at(19, 5))
		var malo = new Malo(imagen = "malo1.png", position = game.at(18, 5), cantidadpasosIzquierda = 6, cantidadpasosDerecha = 6)
		var malo1 = new Malo(imagen = "malo2.png", position = game.at(23, 3), cantidadpasosIzquierda = 6, cantidadpasosDerecha = 6)
		cajas.addAll([ caja, caja1 ])	
			// metodos q se usan mas abajo
		var seMueven = [ malo, malo1 ]
		var personajesConGravedad = []
		malo.cantidadPasos()
		malo1.cantidadPasos()
	//	game.addVisualIn(superTonico,game.at(20,13))
//	AGREGO A BUGS BUNNY
		game.addVisual(conejo)
//PERSONAJES MALOS
		game.addVisual(malo)
		game.addVisual(malo1)
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
		posicionNiveles.addAll([ new Position(12,1), new Position(12,2), new Position(12,3), new Position(12,4), new Position (12,5), new Position (12,6), new Position (12,7), new Position (12,8), new Position (1,4), new Position (2,4), new Position (3,4), new Position (4,4), new Position (5,4), new Position (6,4), new Position (7,4), new Position (8,4), new Position (9,4), new Position (10,4), new Position (11,4), new Position (13,4), new Position (14,4), new Position (15,4), new Position (16,4), new Position (17,4), new Position (18,4), new Position (19,4), new Position (20,4) ])
		posicionNiveles.addAll([ new Position(1, 8), new Position(2, 8), new Position(3, 8), new Position(4, 8), new Position(5,8), new Position(6,8), new Position(7,8), new Position(8,8), new Position(9,8), new Position(10,8), new Position(11,8), new Position(15,8), new Position(16,8), new Position(17,8), new Position(18,8), new Position(19,8), new Position (20,8), new Position (21,8), new Position (22,8), new Position (23,8), new Position (24,8) ])
		posicionNiveles.addAll([ new Position(1, 12), new Position(2,12), new Position(3,12), new Position(1,12), new Position(2,12), new Position(3,12), new Position (4,12), new Position (5,12), new Position (16,12), new Position (17,12), new Position (18,12), new Position (19,12), new Position (20,12), new Position (21,12), new Position (22,12), new Position (23,12), new Position (24,12) ])
		posicionNiveles.addAll([ new Position(10, 9), new Position(10,10),new Position(11, 9), new Position(11,10),new Position(12, 9), new Position(12,10) ])
		posicionNiveles.forEach{ p => self.dibujar(new LadrillosParedDerecha(position = p))}
		var posParedes = []
		var posParedIzquierda = []
		var posParedDerecha = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(n, 0))} // bordeAbajo
		(0 .. largo).forEach{ n => posParedIzquierda.add(new Position(0, n))} // bordeIzq 
		(0 .. largo).forEach{ n => posParedDerecha.add(new Position(ancho, n))} // bordeDer
		posParedes.forEach{ p => self.dibujar(new LadrillosnivelSiguientes(position = p))}
		posParedIzquierda.forEach{ p => self.dibujar(new LadrillosParedIzquierda(position = p))}
		posParedDerecha.forEach{ p => self.dibujar(new LadrillosParedDerecha(position = p))}
			// piso que se mueve
		var posicionDelPiso = []
		posicionDelPiso.addAll([ new PisoEnMovimiento(position=new Position(13,12)), new PisoEnMovimiento(position=new Position(14,12)), new PisoEnMovimiento(position=new Position(15,12)) ])
		posicionDelPiso.forEach{ p => self.dibujar(p)}
		posicionDelPiso.forEach{ p => p.reseteoMovimiento()}
		game.onTick(200, "piso en movimiento", { posicionDelPiso.forEach{ p => p.movimiento()}}) // movimiento del piso
		personajesConGravedad.addAll([ conejo, malo1, malo, caja, caja1 ])
			// COLISIONES
		game.whenCollideDo(conejo, { algo => algo.chocaCon(conejo)})
		game.whenCollideDo(caja1, { algo => algo.chocaCon(caja)})
		game.whenCollideDo(caja, { algo => algo.chocaCon(caja)})
			// movimiento		
		game.onTick(700, "caminaHacialaIzquierda", { seMueven.forEach{ mal => mal.movimiento()}})
			// gravedad
		game.onTick(100, "gravedad", { gravedad.bajar(personajesConGravedad)})
			// cajas
		game.onTick(100, "si alguien es aplastado", { cajas.forEach{ caj => caj.aplasta()}})
			// TECLADO
		keyboard.left().onPressDo{ izquierda.movimientoIzquierda()}
		keyboard.right().onPressDo{ derecha.movimientoDerecha()}
		keyboard.up().onPressDo{ tecla.reseteate()}
		game.onTick(100, "tecla", { tecla.estaTocada(false)})
	}

}

