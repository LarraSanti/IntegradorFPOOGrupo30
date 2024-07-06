class BonusSushi extends Objeto{
 
  //Constructores 
  public BonusSushi(){
  }
  public BonusSushi(Transform transform, ImageComponent imageComponent){
    this.transform=transform;
    this.imageComponent=imageComponent;
  }
  public BonusSushi(Transform transform, ImageComponent imageComponent, PVector velocidad){
    this.transform=transform;
    this.imageComponent=imageComponent;
    this.velocidad=velocidad;
  }
  //Metodos
  
  //por la interfaz
  public void display(){
  }
  
  public void mover(){
  
  }

}
