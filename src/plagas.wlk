import elementos.*

class Cucarachas inherits Plagas {
	var property peso
	override method puedeTrasmitirEnfe(){return super() and peso>=10 }
	override method nivelDeDanio(){return super() /2}
	override method efectoDelAtaque() {
		super()
		peso = peso + 2 
	}
}

class Mosquitos inherits Plagas {}

class Pulgas inherits Plagas  {
	override method puedeTrasmitirEnfe(){return super() and poblacion%3 ==0}
	override method nivelDeDanio(){return super() *2}
}

class Garrapatas inherits Plagas  {
	override method nivelDeDanio(){return super() *2}
	override method efectoDelAtaque() {poblacion = poblacion * 1.2}

}

class Plagas {
	var property poblacion
	method nivelDeDanio(){return poblacion}
	method puedeTrasmitirEnfe(){return poblacion>10}
	method efectoDelAtaque() {poblacion = poblacion * 1.1}
	method atacarA(unElemento){
		unElemento.recibirDanioDe(self)
		self.efectoDelAtaque()
	}	
}