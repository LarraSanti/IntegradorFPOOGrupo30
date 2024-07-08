class BonusSushi extends Objeto {
  private PVector direccion; // Dirección del movimiento del objeto
  private PVector gravedad = new PVector(0, 9.81f); // Vector de gravedad

  // Constructor vacío
  public BonusSushi() {}

  // Constructor con transform e imageComponent
  public BonusSushi(Transform transform, ImageComponent imageComponent) {
    super(transform, imageComponent);
    this.direccion = gravedad; // La dirección inicial es la gravedad
  }

  // Constructor con transform, imageComponent y velocidad
  public BonusSushi(Transform transform, ImageComponent imageComponent, PVector velocidad) {
    super(transform, imageComponent, velocidad);
    this.direccion = gravedad; // La dirección inicial es la gravedad
  }

  // Método para mostrar la imagen del objeto
  public void display() {
    this.imageComponent.displayImage(transform.getPosicion(), 50, 50); // Muestra la imagen con tamaño 50x50
  }

  // Método para mover el objeto
  public void mover() {
    // Aplica la gravedad a la velocidad
    velocidad.add(PVector.mult(direccion, Time.getDeltaTime(frameRate)));
    
    // Actualiza la posición del objeto
    transform.setPosicion(new PVector(
      transform.getPosicion().x + velocidad.x * Time.getDeltaTime(frameRate),
      transform.getPosicion().y + velocidad.y * Time.getDeltaTime(frameRate)
    ));
    
    // Actualiza la posición del colisionador
    colisionador.setPosicion(transform.getPosicion());
  }
}
