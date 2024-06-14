class Personaje extends GameObject{
  //Atributos
  private int puntaje; 
  private int vida; 
  
  //Constructores
  public Personaje(){
    imagen= loadImage("");
  }
  
  //Métodos
  public void mover(){
  
  }
   
  //Métodos Accesores
  public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;   
  }
  

  
}
