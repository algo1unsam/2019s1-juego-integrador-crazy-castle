import wollok.game.*
import conejo.*
import direccion.*
import juego.*
import comida.*

//https://www.youtube.com/watch?v=AowvrEbIiKI  sound del juego
//game.sound()permite poner musica al juego
class ParedDeLadrillos {

	var property position = game.at(0, 0)

	method nombre() = "ladrillo"

	method image() = "ladrillonivel.png"

	method chocaCon(alguien) {
	}

	method teMueres() {
	}

}

class LadrillosPared inherits ParedDeLadrillos { //modifique para que ambas paredes esten en un solo metodo

	override method image() = "ladrillonivel.png"

	override method chocaCon(alguien) {
		if (alguien.posicionAnterior() == derecha) {
			alguien.position(alguien.position().left(1))
		} else {
			alguien.position(alguien.position().right(1))
		}
	}

}

class LadrillosnivelSiguientes inherits ParedDeLadrillos {

	override method image() = "ladrillonivel.png"

	override method chocaCon(alguien) {
	}

}

class Puerta {

	var property position

	method nombre() = "puerta"

	method image()

	method salida()

	method chocaCon(conejo) {

	}

	method teMueres() {
	}

}

class PuertaQueHaceSubir inherits Puerta {

	var property puertaSalida = null

	override method image() = "puerta subida.png"

	method creoPuertaEn(posicion) {
		puertaSalida = new PuertaQueHaceBajar(position = posicion, puertaEntrada = self)
		juego.dibujar(puertaSalida)
	}

	override method salida() {
		conejo.position(puertaSalida.position())
	}

}

class PuertaQueHaceBajar inherits Puerta {

	var property puertaEntrada = null

	override method image() = "puerta bajada.png"

	override method salida() {
		conejo.position(puertaEntrada.position())
	}

}

class Piso {

	var property position

	method imagen() = "ladrillos.png"

	method choque(alguien) {
	}

}

object puertaMagica inherits PuertaQueHaceSubir {

	var property puertaFinal
	var cantidad = null

	method zanahoriasFaltantes(param) {
		// self.position(puertaSalida)
		cantidad = param
	}

	method restarZanahoria() {
		cantidad -= 1
		if (cantidad == 0) {
			juego.dibujar(self)
			self.creoPuertaEn(puertaSalida)
			puertaFinal.crearPuerta()
		}
	}

	method crearZanahorias(pos) {
		var posicion = []
		posicion.addAll(pos)
		self.zanahoriasFaltantes(pos.size())
		posicion.forEach{ p => juego.dibujar(new Zanahoria(position = p))}
	}

}

object puertaSiguienteNivel inherits Puerta {

	override method image() = "puerta_fin.png"

	override method salida() {
		game.clear()
		juego.nivel2()
	}

	method crearPuerta() {
		position = game.at(22, 13)
		juego.dibujar(self)
	}

}

object gameOver inherits Puerta {

	override method image() = "puerta_fin.png"

	override method salida() {
		game.stop()
	}

	method crearPuerta() {
		position = game.at(22, 13)
		juego.dibujar(self)
	}

}

class PisoEnMovimiento inherits ParedDeLadrillos {

	var property movimiento = 8
	var property movimientoizq = null
	var property movimientoder = null
	var property posicionAnterior = null

	method reseteoMovimiento() {
		movimientoizq = movimiento
		movimientoder = movimiento
	}

	method movimiento() {
		self.seMueveAlaIzquierda()
		if (movimientoizq == 0) {
			self.seMueveAlaDerecha()
		}
		if (movimientoizq == 0 && movimientoder == 0) {
			self.reseteoMovimiento( )
		}
	}

	method seMueveAlaDerecha() {
		var elemento = []
		elemento.addAll(game.getObjectsIn(position.up(1)))
		if (movimientoder > 0) {
			movimientoder -= 1
			derecha.movimientoDerecha(self)
			if (not elemento.isEmpty()) {
				elemento.forEach{ p => derecha.movimientoDerecha(p)}
			}
		}
	}

	method seMueveAlaIzquierda() {
		var elemento = []
		elemento.addAll(game.getObjectsIn(position.up(1)))
		if (movimientoizq > 0) {
			movimientoizq -= 1
			izquierda.movimientoIzquierda(self)
			if (not elemento.isEmpty()) {
				elemento.forEach{ p => izquierda.movimientoIzquierda(p)}
			}
		}
	}

}

