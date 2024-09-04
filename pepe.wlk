object pepe {

    var categoria = cadete //no es buena practica dejarlas vacias
    var faltas = 0
    var bonoPresentismo = 0
    var bonoResultado = 0

    method categoria(_categoria) {
      categoria = _categoria
    }

    method neto() {
      return categoria.neto() //lo busca de la categorpia guardada en la variable que por default es cadete.
    }

    method bonoResultado(_bonoResultado) {
      bonoResultado = _bonoResultado
    }

    method faltas(_faltas){
        faltas = faltas + _faltas
    }
    
    method faltas(){
        return faltas
    }

    method bonoPresentismo(_bonoPresentismo) {
      bonoPresentismo = _bonoPresentismo
    }

    method sueldo() {
      return self.neto() + self.extraResultado() + self.extraPresentismo()
      //sueldo = neto + bono por resultados + bono por presentismo
    }

    method extraResultado() {
      return bonoResultado.valor(self)
    }

    method extraPresentismo() {
      return bonoPresentismo.valor(self)
    }

}

//categorias
object cadete {

  method neto(){  //es mejor poner el neto en las categorías.
    return 20000
  }

}
object gerente {

  method neto(){
    return 15000
  }

}

//resultado
object porcentaje{

    method valor(empleado) {
      return empleado.neto() * 0.1 // 10 * x / 100
    }

}

object montoFijo{

    method valor(empleado) {
      return 800
    }

}

object nulo{
    
    method valor(empleado) {
      return 0
    }

}


//presentismo 
object normal{

    method valor(empleado) {
        
      if (empleado.faltas() == 0) {
        return 2000
      }
      if (empleado.faltas() == 1) {
        return 1000
      }
        return 0 
    /*otra opción es: usar formula ya que cada falta le saca mil
    
    return (2000 + faltas*1000).max(0) eso hace que se queda con el más grande entre el resultado y cero
    
    */
    }

}

object ajuste{
    
    method valor(empleado) {
      return if (empleado.faltas() == 0) 100  else 0 //operador ternario
    }

}
object demagogico{
    
    method valor(empleado) {
      return if (empleado.neto() < 18000) 500 else 300
    }

}
object preNulo{
    
    method valor(empleado) {
      return 0
    }

}
