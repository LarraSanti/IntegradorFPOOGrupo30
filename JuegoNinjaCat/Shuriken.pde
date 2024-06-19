class Shuriken extends Objeto{
  //Constructores
  public Shuriken(){
    imagen= loadImage("Shuriken.png");
  }
  public Shuriken(PVector direccion){
    super(direccion);
  }
  
  //Metodos 
   public PVector mover(){
     return this.direccion;
   }
}
