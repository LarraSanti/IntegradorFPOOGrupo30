class Colisionador{
  private PVector posicion;
  private float radio;
  
  public Colisionador(PVector posicion, float radio){
    this.posicion = posicion;
    this.radio = radio;
  }
  
  public PVector getPosicion(){
    return this.posicion;
  }
  
  public float getRadio(){
    return this.radio;
  }
  
  public void setPosicion(PVector posicion){
    this.posicion = posicion;
  }
}
