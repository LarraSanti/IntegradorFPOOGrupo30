class SpritePlayer {
  protected int xFrame;  //Representa la ´posicion X del inicio de un frame
  protected int yFrame;   //Representa la posicion Y del inicio de un frame 
  protected PImage sprite; //Representa a toda la imagen, al sprite sheet
  protected int widthFrame;  //Ancho del frame
  protected int heightFrame;  //Alto del frame
  private float xFrameFloat;  //Representa la posicion x del frame pero float. Lo vamos a utilizar para el calculo de la tranicion, de que pase de un frame a otro, un¿sando el delta tiempo
  private float nextxFrameFloat; //La posicón del próximo frame en float
  private float velTransicion;  //La velocidad en que se hará el movimiento
}
