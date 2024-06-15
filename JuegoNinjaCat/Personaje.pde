class Personaje extends GameObject{
  //Atributos
  private int experiencia; 
  private int vida; 
  
  //Constructores
  public Personaje(){
    imagen= loadImage("NinjaCat.png");
  }
  
  //Métodos
  public void mover(){
  
  }
  
  public void deslizar(){
  
  }
   
  //Métodos Accesores
  public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;   
  }
  

  
}
