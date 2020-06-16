import plagas.*

class Hogar inherits Elementos{
	var property mugre 
	var property confort
		
	method esBuene(){return mugre < confort/2}
	method recibirDanioDe(unaPlaga){ 
		mugre = mugre + unaPlaga.nivelDeDanio()
	}	 
}

class Huerta inherits Elementos {
	var property produccion
	var property nivelDeTodas =50
	
	method esBuene(){return produccion > nivelDeTodas}
	method recibirDanioDe(unaPlaga){
		produccion = produccion-(unaPlaga.nivelDeDanio() * 0.1)
		if (unaPlaga.puedeTrasmitirEnfe()){
			produccion = produccion - 10
		}
	}	 
}

class Mascota inherits Elementos {
	var property salud
	
	method esBuene(){return salud > 250 }
	method recibirDanioDe(unaPlaga) {
		if (unaPlaga.puedeTrasmitirEnfe()){
			salud = salud - unaPlaga.nivelDeDanio()
		}
	}
}

class Elementos inherits Barrio {
	/// no le encuentro sentido plantear las funciones	"esBuene" 
	/// y "recibirDanioDe" ya que difieren mucho en cada elemento
}

class Barrio {
	var property listaDeElementos = []
	method agregarElementoAlBarrio(elemento) {listaDeElementos.add(elemento)}
	method esCopado(){ 
		return listaDeElementos.count({e => e.esBuene()}) > listaDeElementos.count({e => not e.esBuene()})
	}	 
}