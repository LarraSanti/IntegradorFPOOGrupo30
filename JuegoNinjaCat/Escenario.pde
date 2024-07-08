class Escenario{
  //Atributos
  private PVector posicion;
  private PImage imagen;
  private ArrayList<Objeto> objetos;
  private ArrayList<Shuriken> shurikens;
  private Personaje personaje;
  private Hud hud; 
  
  
  //Constructores
  public Escenario(){
    imagen=loadImage("Background.jpeg");
    frameRate(50);
    //PERSONAJE//
    //*Se crea al Personaje en una posicion especifica y con su imagen
    Transform transformPersonaje = new Transform(new PVector(width/2,height-90));
    ImageComponent imagePersonaje = new ImageComponent("NinjaCat.png");
    personaje = new Personaje(transformPersonaje,imagePersonaje, new PVector(320,0), 0,7);
    
    //OBJETOS//
    objetos=new ArrayList<Objeto>();
    shurikens = new ArrayList<Shuriken>();
    agregarObjetos();
    
    //HUD//
    hud = new Hud();
  }
  
  public Escenario(PVector posicion){
    this.posicion = posicion;
  }
  
  //Metodos
  public void dibujar(){
    image(imagen,this.posicion.x,this.posicion.y, width,height+25);
    personaje.display();
    hud.mostrarVida(personaje);
    hud.mostrarExperiencia(personaje);
    hud.mostrarNivelActual();
       
if (frameCount % 180 == 0) { // Generate a new shuriken and sushi every second (assuming 60 FPS)
    agregarObjetos();
  }
      for (int i = shurikens.size() - 2; i >= 0; i--) {
    Shuriken shuriken = shurikens.get(i);
    shuriken.display();
    shuriken.mover();
    if (shuriken.getTransform().getPosicion().x < 0 || shuriken.getTransform().getPosicion().y > height) {
      shurikens.remove(i); //quitar la instancia shuriken si sale de pantalla
      }
    }
  }
  
  
 public void agregarObjetos() {
    Transform transformBonusSushi = new Transform(new PVector(width - 100, height / 2));
    ImageComponent imageBonusSushi = new ImageComponent("BonusSushi.png");
    objetos.add(new BonusSushi(transformBonusSushi, imageBonusSushi, new PVector(0, 4)));
   
     
  Transform transform = new Transform(new PVector(1000, random(200, height - 50)));
  ImageComponent imageComponent = new ImageComponent("Shuriken.png"); 
  objetos.add(new Shuriken(transform, imageComponent, new PVector(-500,0))); 
  }
  
  public void dibujarObjetos() {
    if (!objetos.isEmpty()) {
      for (Objeto o : objetos) {
        o.mover(); // Mueve el objeto antes de dibujarlo
        o.display();
      }
    }
  }
  
  //Metodos accesores
   public void setPosicion(PVector posicion){
    this.posicion=posicion; 
  }
  
}
