object galvan {
	var property sueldo = 150000
	var totalDinero = 0
	var totalDeuda = 0
	
	method cobrarSueldo(){
		totalDinero += 0.max(sueldo - totalDeuda)
		totalDeuda = 0.max(totalDeuda - sueldo)
	}
	
	method gastar(cuanto){
		totalDeuda += 0.max(cuanto - totalDinero)
		totalDinero = 0.max(totalDinero - cuanto)
	}
	method totalDinero() = totalDinero
	method totalDeuda() = totalDeuda
}

object baigorria {
	var cantidadEmpanadasVendidas = 0
	const montoPorEmpanada = 150
	var totalCobrado = 0
	
	method totalCobrado() = totalCobrado
	method venderEmpanada(){
		cantidadEmpanadasVendidas += 1
	}
	method sueldo() = cantidadEmpanadasVendidas * montoPorEmpanada
	method cobrarSueldo(){}
}

object gimenez {
	var dinero = 3000000
	
	method dinero() {return dinero}
	method pagarA(empleado) {
		dinero -= empleado.sueldo()
		empleado.cobrarSueldo()
	}
}