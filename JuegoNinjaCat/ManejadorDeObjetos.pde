class ManejadorDeObjetos {
  // Listas para almacenar diferentes tipos de objetos en el juego
  private ArrayList<Objeto> objetos; 
  private ArrayList<Shuriken> shurikens;
  private ArrayList<BonusSushi> bonusSushis; 

  // Constructor que inicializa las listas
  public ManejadorDeObjetos() {
    objetos = new ArrayList<Objeto>();
    shurikens = new ArrayList<Shuriken>();
    bonusSushis = new ArrayList<BonusSushi>();
  }

  // Método para agregar nuevos objetos al juego
  public void agregarObjetos() {
    // Limita el número total de objetos en pantalla a 10
    if (objetos.size() > 10) return;

    // Crear y agregar un BonusSushi a las listas correspondientes
    float yPosition = random(50, height - 10); // Posición vertical aleatoria
    Transform transformBonusSushi = new Transform(new PVector(640, yPosition)); 
    ImageComponent imageBonusSushi = new ImageComponent("Sushi.png"); 
    PVector velocity = new PVector(random(-250, -100), random(100, 100)); 
    BonusSushi bonusSushi = new BonusSushi(transformBonusSushi, imageBonusSushi, velocity);
    objetos.add(bonusSushi); // Agregar a la lista de objetos
    bonusSushis.add(bonusSushi); // Agregar a la lista específica de BonusSushis

    // Crear y agregar un Shuriken a las listas correspondientes
    Transform transform = new Transform(new PVector(1000, random(200, height - 50))); 
    ImageComponent imageComponent = new ImageComponent("Shuriken.png");
    Shuriken shuriken = new Shuriken(transform, imageComponent, new PVector(-500, 0));
    objetos.add(shuriken); // Agregar a la lista de objetos
    shurikens.add(shuriken); // Agregar a la lista específica de Shurikens
  }

  // Método para mover y mostrar los objetos en pantalla
  public void moverObjetos() {
    // Iterar sobre la lista de objetos en orden inverso
    for (int i = objetos.size() - 1; i >= 0; i--) {
      Objeto o = objetos.get(i);
      o.mover(); 
      o.display(); 
      // Remover objetos que salen de la pantalla
      if (o.getTransform().getPosicion().x < 0 || o.getTransform().getPosicion().y > height) {
        objetos.remove(i); // Remover de la lista general de objetos
        if (o instanceof Shuriken) {
          shurikens.remove(o); // Remover de la lista específica de Shurikens
        } else if (o instanceof BonusSushi) {
          bonusSushis.remove(o); // Remover de la lista específica de BonusSushis
        }
      }
    }
  }

  // Método para verificar colisiones entre el personaje y los objetos
  public void verificarColisiones(Personaje personaje) {
    // Iterar sobre la lista de objetos en orden inverso
    for (int i = objetos.size() - 1; i >= 0; i--) {
      Objeto o = objetos.get(i);
      
      // Verificar si el personaje colisiona con el objeto
      if (personaje.getColisionador().verificarColision(o.getColisionador())) {
        objetos.remove(i); // Remover de la lista general de objetos
        if (o instanceof Shuriken) {
          shurikens.remove(o); // Remover de la lista específica de Shurikens
          personaje.reducirVida(1); // Reducir la vida del personaje
        } else if (o instanceof BonusSushi) {
          bonusSushis.remove(o); // Remover de la lista específica de BonusSushis
          personaje.setExperiencia(personaje.getExperiencia() + 5); // Incrementar la experiencia del personaje
        }
      }
    }
  }
}
