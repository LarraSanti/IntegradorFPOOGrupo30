class BaldeAgua extends Objeto{
  
  //Constructores 
  public BaldeAgua(){
      imagen= loadImage("BaldeAgua.png");
  }
  
  //Constructor Parametrizado
  public BaldeAgua(PVector direccion){
    super(direccion);
  }
  
  //Metodos
  public PVector mover(){
    return this.direccion;
  }

}
