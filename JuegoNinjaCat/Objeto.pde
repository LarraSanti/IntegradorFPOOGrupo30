abstract class Objeto implements IVisualizable {
  protected ImageComponent imageComponent;
  protected Transform transform;
  protected Colisionador colisionador;
  protected PVector velocidad;
  
  // Constructores
  public Objeto() {}

  public Objeto(Transform transform, ImageComponent imageComponent) {
    this.transform = transform;
    this.imageComponent = imageComponent;
    this.colisionador = new Colisionador(transform.getPosicion(), 25); 
  }

  public Objeto(Transform transform, ImageComponent imageComponent, PVector velocidad) {
    this.transform = transform;
    this.imageComponent = imageComponent;
    this.velocidad = velocidad;
    this.colisionador = new Colisionador(transform.getPosicion(), 25); 
  }

  // Métodos abstractos
  public abstract void mover();
  
  // Implementación de la interfaz
  public void display() {
  }

  // Métodos accesores

  public Colisionador getColisionador() {
    return colisionador;
  }
}
