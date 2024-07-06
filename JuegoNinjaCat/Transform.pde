class Transform {
  //Atributos
  private PVector position;

  // Constructor que inicializa la posición
  public Transform(PVector position) {
    this.position = position;
  }
  
  //--Métodos Accesores--//
  
  // Getter 
  public PVector getPosition() {
    return this.position;
  }

  // Setter 
  public void setPosition(PVector position) {
    this.position = position;
  }
}
