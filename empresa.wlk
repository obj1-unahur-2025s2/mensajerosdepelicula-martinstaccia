import mensajeros.*
import paquetes.*


object empresa{
    const mensajeros = []
    const paquetesEnviados = []
    const paquetesPendientes = []

    method paquetesEnviados(){
        return paquetesEnviados
    }

    method paquetesPendientes(){
        return paquetesPendientes
    }

    method enviarPaquete(unPaquete){
        if(self.algunMensajeroPuedeEntregar(unPaquete)){
        paquetesEnviados.add(unPaquete)
    }
    else{
        paquetesPendientes.add(unPaquete)
    }}

    method contratar(unMensajero){
        mensajeros.add(unMensajero)
    }

    method despedir(unMensajero){
        mensajeros.remove(unMensajero)
    }

    method mensajeros() = mensajeros

    method despedirATodos(){
       mensajeros.clear() 
    }

    method esGrande(){
        return mensajeros.size()>2
    }

   method sePuedeEntregarPaquetePorPrimerEmpleado(unPaquete){
        return if(not mensajeros.isEmpty()){
         paquete.puedeSerEntregado(mensajeros.first())
   }else{
    false
   }}

    method algunMensajeroPuedeEntregar(unPaquete){
        return mensajeros.any({unMensajeroRandom => unPaquete.puedeSerEntregado(unMensajeroRandom)})
    }

    method todosLosQuePuedenLlevar(unPaquete){
        return mensajeros.filter({unosMensajeros => unPaquete.puedeSerEntregado(unosMensajeros)})
    }


    method tieneSobrePeso(){
        return mensajeros.su({cadaMensajero => cadaMensajero.peso()}) / mensajeros.size()>500
        //mensajeros.map({m=>m.peso()}).sum() / mensajeros.size() > 500
    }



    method pesoUltimoMensajero(){
        return mensajeros.last().peso()
   }

   method facturacion(){
    return paquetesEnviados.sum({paquetes => paquetes.precio()})
}

    method enviar(conjuntoDePaquetes){
        conjuntoDePaquetes.forEach({paquetes => self.enviarPaquete(paquetes)})
    }

    method enviarPaquetePendienteMasCaro(){
       const paqMasCaro = self.paquetePendienteMasCaro()
       paquetesPendientes.remove(paqMasCaro)
       self.enviarPaquete(paqMasCaro)
    }

    method paquetePendienteMasCaro(){
        return paquetesPendientes.max({p => p.precio()})
    }
}

