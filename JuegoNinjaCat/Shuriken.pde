class Shuriken extends Objeto {
  private PVector direccion;
  private PVector gravedad = new PVector(0, 9.81f); 

  // Constructores
  public Shuriken() {}

  public Shuriken(Transform transform, ImageComponent imageComponent) {
    super(transform, imageComponent);
    this.direccion = gravedad ; // Aplicar gravedad como aceleración
  }

  public Shuriken(Transform transform, ImageComponent imageComponent, PVector velocidad) {
    super(transform, imageComponent, velocidad);
    this.direccion =gravedad;
  }

  @Override
  public void mover() {
    velocidad.add(PVector.mult(direccion, Time.getDeltaTime(frameRate))); // Aplicar gravedad a la velocidad
    transform.setPosicion(new PVector(
      transform.getPosicion().x + velocidad.x * Time.getDeltaTime(frameRate),
      transform.getPosicion().y + velocidad.y * Time.getDeltaTime(frameRate)
    ));
    colisionador.setPosicion(transform.getPosicion());
  }

  @Override
  public void display() {
    imageMode(CENTER);
    imageComponent.displayImage(transform.getPosicion(), 50, 50);
  }
}
