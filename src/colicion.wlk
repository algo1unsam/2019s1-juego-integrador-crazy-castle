import comida.*
import conejo.*
import malo.*
import niveles.*
import puertas.*
import piso.*

object colicion{
	var element=[]
	method derecha(){
		self.muevo(conejo.position().right(1))
	}
	method izquierda(){
		self.muevo(conejo.position().left(1))
	}
	method muevo(_direccion){
		element=_direccion.allElements()
		element.remove(conejo)
		if(self.choque()){
			conejo.position(_direccion)
		}else{
			var objeto
			objeto=element.anyOne()
			objeto.choque(conejo)
		}
		element.allRemove(element)
	}
	method choque()=element.isEmpty()
}