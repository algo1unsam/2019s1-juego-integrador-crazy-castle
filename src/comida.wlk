import wollok.game.*
import conejo.*

class Zanahoria {

	method image() = "zanahoria.png"

	method chocaCon(unconejo) {
		unconejo.comer(self)
	}
	method choco(dir){}

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
		//mati
		method arrastra(pos){
		
		
		self.position(pos)
		}
		method choque(persona,pos){
		 conejo.position(self.position())
		 self.arrastra(pos)
		 
			
		}
		method choco(dir){
			if(dir=="izq"){
				position=position.left(1)
			}else{
				position=position.right(1)
			}
		}

}


