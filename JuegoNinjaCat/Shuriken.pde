class Shuriken extends Objeto {

  // Constructor por defecto
  public Shuriken() {
  }

  // Constructores Parametrizados
  public Shuriken(Transform transform, ImageComponent imageComponent) {
    super(transform, imageComponent); // Llamada al constructor de la superclase
  }

  // Constructor con velocidad
  public Shuriken(Transform transform, ImageComponent imageComponent, PVector velocidad) {
    super(transform, imageComponent, velocidad); // Llamada al constructor de la superclase
  }
  
  // Método para mostrar el shuriken en la pantalla
  @Override
  public void display() {
    imageComponent.displayImage(transform.getPosicion(), 50, 50); // Mostrar imagen del shuriken con tamaño 50x50
  }
  
  // Método para mover el shuriken
  @Override
  public void mover() {
    this.transform.getPosicion().y+=(this.velocidad.y * Time.getDeltaTime(frameRate));
    
    // Actualizar la posición del colisionador
    this.colisionador.setPosicion(transform.getPosicion());
  }
}
