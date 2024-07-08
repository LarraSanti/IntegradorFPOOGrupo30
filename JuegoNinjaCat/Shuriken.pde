class Shuriken extends Objeto {
  private PVector direccion; // Dirección en la que se mueve el shuriken
  private PVector gravedad = new PVector(0, 9.81f); // Vector de gravedad de la sala de entrenamiento aplicado al shuriken

  // Constructor por defecto
  public Shuriken() {}

  // Constructor
  public Shuriken(Transform transform, ImageComponent imageComponent) {
    super(transform, imageComponent); // Llamada al constructor de la superclase
    this.direccion = gravedad; // Aplicar dirección como gravedad
  }

  // Constructor con velocidad
  public Shuriken(Transform transform, ImageComponent imageComponent, PVector velocidad) {
    super(transform, imageComponent, velocidad); // Llamada al constructor de la superclase
    this.direccion = gravedad; // Aplicar dirección como gravedad
  }

  // Método para mover el shuriken, aplicando gravedad
  @Override
  public void mover() {
    // Aplicar la gravedad a la velocidad del shuriken
    velocidad.add(PVector.mult(direccion, Time.getDeltaTime(frameRate)));
    // Actualizar la posición del shuriken basado en la velocidad
    transform.setPosicion(new PVector(
      transform.getPosicion().x + velocidad.x * Time.getDeltaTime(frameRate),
      transform.getPosicion().y + velocidad.y * Time.getDeltaTime(frameRate)
    ));
    // Actualizar la posición del colisionador
    colisionador.setPosicion(transform.getPosicion());
  }

  // Método para mostrar el shuriken en la pantalla
  @Override
  public void display() {
    imageComponent.displayImage(transform.getPosicion(), 50, 50); // Mostrar imagen del shuriken con tamaño 50x50
  }
}
