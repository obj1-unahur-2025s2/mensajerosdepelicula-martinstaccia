object roberto{
    var vehiculo = bici
    //polimorfica
    method cambiarVehiculo(unVehiculo){
        vehiculo = unVehiculo
    }
    method peso(){
        return 90 + vehiculo.peso()
    }
    method puedeLlamar(){
        return false
    }
}

object bici{
    method peso(){
        return 5
    }
}

object camion{
    var acoplados = 1

    method setearAcoplados(cantAcoplados){
        acoplados = cantAcoplados
    }
    method peso(){
        return 500 * (acoplados.max(1))
    }

    
}


object chuck{
    method peso(){
        return 80
    }

    method puedeLlamar(){
        return true
    }
}


object neo{
    var tieneCredito = true
    method peso(){
        return 0
    }

    method puedeLlamar(){
        return tieneCredito
    }

    method cargarCredito(){
        tieneCredito = true
    }

    method agotarCredito(){
        tieneCredito = false
    }
}