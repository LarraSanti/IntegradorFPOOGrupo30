class PerroMadera extends Objeto{
  //Constructor
  public PerroMadera(){
      imagen= loadImage("BaldeAgua.png");
  }
  public PerroMadera(PVector direccion){
    super(direccion);
  }
  //Metodos
  public PVector mover(){
    return this.direccion;
  
  }
}
