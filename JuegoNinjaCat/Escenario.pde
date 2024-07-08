class Escenario {
  // Atributos privados de la clase
  private PVector posicion; 
  private PImage imagen; 
  private ArrayList<Objeto> objetos;
  private Personaje personaje; 
  private Hud hud; // Interfaz de usuario para mostrar información del personaje
  
  // Constructor por defecto del escenario
  public Escenario() {
    // Cargar imagen de fondo
    imagen = loadImage("Background.jpeg");
    // Establecer la tasa de cuadros por segundo
    frameRate(80);
    
    // Inicializar el personaje
    Transform transformPersonaje = new Transform(new PVector(width / 2, height - 90));
    ImageComponent imagePersonaje = new ImageComponent("NinjaCat.png");
    personaje = new Personaje(transformPersonaje, imagePersonaje, new PVector(320, 0), 0, 7);
    objetos= new ArrayList<Objeto>();
    agregarObjetos();
   
    // Inicializar el HUD
    hud = new Hud();
  }
  
  // Constructor que recibe la posición del escenario
  public Escenario(PVector posicion) {
    this.posicion = posicion;
  }

  // Método para dibujar el escenario
  public void dibujarEscenario() {
    image(imagen, this.posicion.x, this.posicion.y, width, height + 25);
    
    // Mostrar el personaje y la interfaz HUD
    personaje.display();
    hud.mostrarVida(personaje);
    hud.mostrarExperiencia(personaje);
    hud.mostrarNivelActual();
  }

  // Método para agregar objetos al escenario
  public void agregarObjetos() {
    
    //Inicializar el BonusSushi
    Transform transformBonusSushi = new Transform(new PVector(width, height/2));
    ImageComponent imageBonusSushi= new ImageComponent("BonusSushi.png");
    objetos.add(new BonusSushi(transformBonusSushi, imageBonusSushi, new PVector(150,4)));
  }
  
  public void verificarColisiones(){
    if (!objetos.isEmpty()){
      for (int i=objetos.size()-1; i>=0; i--){
        Objeto o= objetos.get(i);
        //Verificar si el personaje colisiona con el BonusSushi
        if(o instanceof BonusSushi) {
          Colisionador colisionadorSushi = o.getColisionador();
          if(personaje.getColisionador().verificarColision(colisionadorSushi)){
            objetos.remove(i);
            println("Colisión detectada con Sushi");
            personaje.aumentarExperiencia(5);
            //personaje.setExperiencia(personaje.getExperiencia()+5);
            crearBonusSushi();         
          }
        }        
       }
      }
    }
   
  public void dibujarObjetos(){
    //println(objetos.isEmpty());
    if (!objetos.isEmpty()){
      for (int i=objetos.size()-1; i>=0; i--){
        Objeto o= objetos.get(i);
        o.mover();
        o.display();
        if (o instanceof BonusSushi && o.transform.getPosicion().x < -200) {
            objetos.remove(i);
            crearBonusSushi();
        
        }
      }
    }
  }
  public void crearBonusSushi(){
    Transform transformBonusSushi = new Transform(new PVector(width, random(this.posicion.y+200,height-80)));
    ImageComponent imageBonusSushi= new ImageComponent("BonusSushi.png");
    BonusSushi nuevoSushi= new BonusSushi(transformBonusSushi, imageBonusSushi, new PVector(150,0));
    objetos.add(nuevoSushi);
  }

  // Método para establecer la posición del escenario
  public void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }
}
