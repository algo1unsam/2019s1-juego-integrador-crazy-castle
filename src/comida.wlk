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
	          if(alguien== conejo)
	        	 self.teArrastra()
  			}
		
	method teArrastra(){
		if(self.position()==conejo.position())
		self.position().up(1)
	}

}


