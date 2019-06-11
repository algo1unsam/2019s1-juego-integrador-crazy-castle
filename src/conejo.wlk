import wollok.game.*
import comida.*
import malo.*
import niveles.*
import puertas.*
import piso.*
import colision.*
object conejo {

	var property estado = true
	var property zanahorias = 8
	var puntos = 100
	var property position = game.at(1, 1)
	var imagen = "conejo2.png"
	var property direccion
	var elemento = #{}
	method image() = "conejo2.png"

	method move(nuevaPosicion) {
		if (self.sigueVivo()) {
			self.position(nuevaPosicion)
		}
	}

	method comer(unazanahoria) {
		if (self.sigueVivo()) {
			puntos += 100
			game.removeVisual(unazanahoria)
		}
	}

	method chocaCon(alguien) {
	}

	method restaPuntos() {
		if (puntos >= 100) {
			puntos -= 100
		} else {
			self.muerto()
		}
	}

	method teclaUP() {
		var objeto
		elemento.addAll(self.colision())
		self.eliminoConejo(elemento)
		objeto=elemento.anyOne()
		objeto.activar(position)
	}

	method estado() = false

	method muerto() {
		game.stop()
	}

	method sigueVivo() = estado

	method eliminoConejo(element) {
			element.remove(self)
			return element
	}

	method derecha() {
		self.move(self.position().right(1))
		direccion = "der"
		self.conquienChoco()
	}

	method izquierda() {
		direccion = "izq"
		self.move(self.position().left(1))
	}
	method colision()=position.allElements()
	method conquienChoco() {
		
		elemento.addAll(self.colision())
		elemento.remove(self)
		elemento.all({elem=>elem.choco(direccion)})
	}
	method activar(pos){}
	

}

