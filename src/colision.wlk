import comida.*
import conejo.*
import malo.*
import niveles.*
import puertas.*
import piso.*
import malo.*
object colision{
	var element=[]
	method derecha(){
		self.muevo(conejo.position().right(1),"der")
		
	}
	method izquierda(){
		
		self.muevo(conejo.position().left(1),"izq")
		
	}
	method muevo(_direccion,dir){
		conejo.position(_direccion)
		element=_direccion.allElements()
		element.remove(conejo)
		if(element.isEmpty() and (not conejo.estado())){
			
			
		}else{
			if(conejo.estado()){
			var objeto
			objeto=element.anyOne()
			if(dir=="izq"){
				_direccion.left(1)
			}else{
				_direccion.right(1)
			}
			objeto.choque(conejo,_direccion)
		}
		
		}
		
	}
}