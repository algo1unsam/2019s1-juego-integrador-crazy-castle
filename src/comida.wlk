import wollok.game.*
import conejo.*

class Zanahoria {

	method image() = "zanahoria.png"

	method chocaCon(unconejo) {
		unconejo.comer(self)
	}

}

class Caja {
    var property position
	method image() = "caja1.png"
   
	method chocaCon(alguien) {
	 
	 self.arrastra()
  	
		}
		
		method arrastra()
		{var elementos=#{}
		elementos= game.colliders(self)
		
		elementos.remove(self)
		
		self.position(self.position().right(1))
		}
	

}

