class BonusSushi extends Objeto {
  private PVector direccion;
  private PVector gravedad = new PVector(0, 9.81f); 
  
  public BonusSushi() {}

  public BonusSushi(Transform transform, ImageComponent imageComponent){
    super(transform, imageComponent);
    this.direccion = gravedad;
  }

  public BonusSushi(Transform transform, ImageComponent imageComponent, PVector velocidad){
    super(transform, imageComponent, velocidad);
    this.direccion = gravedad;
  }

  public void display(){
    this.imageComponent.displayImage(transform.getPosicion(), 50, 50);
  }
  
  public void mover(){
    velocidad.add(PVector.mult(direccion, Time.getDeltaTime(frameRate)));
    transform.setPosicion(new PVector(
      transform.getPosicion().x + velocidad.x * Time.getDeltaTime(frameRate),
      transform.getPosicion().y + velocidad.y * Time.getDeltaTime(frameRate)
    ));
    colisionador.setPosicion(transform.getPosicion());
  }
}
