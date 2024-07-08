class BonusSushi extends Objeto {
  private float angulo; //Representa el angulo que, al cambiar gradualmente, generará un movimiento ondulado 
  private float velocidadAngulo; ////Indica la velocidad a la que cambia el angulo en cada fotograma
  
  // Constructor por defecto
  public BonusSushi() {
  }

  // Constructor con transform e imageComponent
  public BonusSushi(Transform transform, ImageComponent imageComponent) {
    super(transform, imageComponent);
  }

  // Constructor con transform, imageComponent y velocidad
  public BonusSushi(Transform transform, ImageComponent imageComponent, PVector velocidad) {
    super(transform, imageComponent, velocidad);
    this.angulo=0;  //Al estar inicializada en cero significa que no hay desplazamiento.
    this.velocidadAngulo=0.2;  //El angulo cambiará a una velocidad de 0.2 . Si este valor es mayor, el angulo cambiara más rapido, es decir que dubira y bajara rapidamente
  }

  // Método para mostrar la imagen del objeto
  public void display() {
    this.imageComponent.displayImage(transform.getPosicion(), 50, 50); // Muestra la imagen con tamaño 50x50
  }

  // Método para mover el objeto
  public void mover() {
    // Actualiza la posición del objeto segun la magnitud que tiene la velocidad
    this.transform.getPosicion().x-=(this.velocidad.x*Time.getDeltaTime(frameRate));; //Se mueve hacia la izquierda
    this.transform.getPosicion().y+= sin(angulo)*5; //Movimiento sinuoso en el eje Y. El valor que multiplica a la funcion seno controla cuanto sube y cuanto baja el sushi.Es decir ajusta la mplitud del movimiento sinuoso 
    this.angulo+=this.velocidadAngulo;  //Incrementar el angulo 
    
    // Actualiza la posición del colisionador
    this.colisionador.setPosicion(transform.getPosicion());
  }
}
