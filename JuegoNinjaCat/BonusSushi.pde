class BonusSushi extends Objeto{
  
  //Constructores
  public BonusSushi(){
  imagen= loadImage("Sushi.png");
  }
  
  //Constructor Parametrizado
  public BonusSushi(PVector direccion){
    super(direccion);
  }
  
  //Metodos
  public PVector mover(){
    return this.direccion;
  }

}
