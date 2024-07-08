class ManejadorDeObjetos {
  private ArrayList<Objeto> objetos;
  private ArrayList<Shuriken> shurikens;
  private ArrayList<BonusSushi> bonusSushis;

  public ManejadorDeObjetos() {
    objetos = new ArrayList<Objeto>();
    shurikens = new ArrayList<Shuriken>();
    bonusSushis = new ArrayList<BonusSushi>();
  }

  public void agregarObjetos() {
    if (objetos.size() > 10) return; // Limitacion de objetos
    float yPosition = random(50, height - 10);
    Transform transformBonusSushi = new Transform(new PVector(640, yPosition));
    ImageComponent imageBonusSushi = new ImageComponent("Sushi.png");
    PVector velocity = new PVector(random(-250, -100), random(100, 100));
    BonusSushi bonusSushi = new BonusSushi(transformBonusSushi, imageBonusSushi, velocity);
    objetos.add(bonusSushi);
   
    
    Transform transform = new Transform(new PVector(1000, random(200, height - 50)));
    ImageComponent imageComponent = new ImageComponent("Shuriken.png"); 
    Shuriken shuriken = new Shuriken(transform, imageComponent, new PVector(-500, 0));
    objetos.add(shuriken);
    
  }

  public void moverObjetos() {
    for (int i = objetos.size() - 1; i >= 0; i--) {
      Objeto o = objetos.get(i);
      o.mover();
      o.display();
      if (o.getTransform().getPosicion().x < 0 || o.getTransform().getPosicion().y > height) {
        objetos.remove(i);
        if (o instanceof Shuriken) {
          shurikens.remove(o);
        } else if (o instanceof BonusSushi) {
          bonusSushis.remove(o);
        }
      }
    }
  }

  public void verificarColisiones(Personaje personaje) {
    for (int i = objetos.size() - 1; i >= 0; i--) {
        Objeto o = objetos.get(i);
        if (personaje.getColisionador().verificarColision(o.getColisionador())) {
            objetos.remove(i);
            if (o instanceof Shuriken) {
                shurikens.remove(o);
                personaje.reducirVida(1); 
            } else if (o instanceof BonusSushi) {
                bonusSushis.remove(o);
                personaje.setExperiencia(personaje.getExperiencia() + 5);
            }
        }
    }
}
}
