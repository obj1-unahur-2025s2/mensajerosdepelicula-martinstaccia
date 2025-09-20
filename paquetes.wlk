import mensajeros.*
import destinos.*

object paquete{
    var destino = matrix

    method cambiarDestino(nuevoDestino){
        destino = nuevoDestino
    }

    var estaPago = false
    method estaPago(){
        return estaPago
    }

    method registrarPago(){
        estaPago = true
    }

    method puedeSerEntregado(unMensajero){
        return estaPago and destino.puedePasar(unMensajero) 
    }


    method precio(){
        return 50
    }


}

object paquetito{
    var destino = matrix
    method cambarDestino(nuevoDestino){
        destino = nuevoDestino
    }
    method estaPago(){
        return true
    }
    method precio(){
        return 0
    }

    method puedeSerEntregado(unMensajero){
        return true
    }
}


object paqueton{
    var importePagado = 0
    const destinos = []
    method precio(){
        return destinos.size()*100
    }

    method recibirPago(unPago){
        importePagado = (importePagado + unPago).min(self.precio())
    }

    method agregarDestino(unDestino) {
        destinos.add(unDestino)      
    }
    method estaPago(){
        return importePagado == self.precio()
    }

    method puedeSerEntregado(unMensajero){
        return destinos.all({cadaDestinoDeLaLista => cadaDestinoDeLaLista.puedePasar(unMensajero)})
    }
}