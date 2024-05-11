// Aleatoriedad en tipografía
String palabra = "Aleatorio";
PFont futuraLight, futuraLightItalic, futuraRegular, futuraRegularItalic, futuraMedium, futuraMediumItalic, futuraBold, futuraBoldItalic;
PFont[] FONT_FUTURA;

int framesToSave = 120; 
int framesSaved = 0; 


void setup() {
 
  textSize(10);
  frameRate(4);
  
  futuraLight = createFont("data/fonts/FUTURA45LIGHT.TTF",32);
  futuraLightItalic = createFont("data/fonts/FUTURA46LIGHTITALIC.TTF",32);
  futuraRegular = createFont("data/fonts/FUTURA55REGULAR.TTF",32);
  futuraRegularItalic = createFont("data/fonts/FUTURA56ITALIC.TTF",32);
  futuraMedium = createFont("data/fonts/FUTURA65MEDIUM.TTF",32);
  futuraMediumItalic = createFont("data/fonts/FUTURA66MEDIUMITALIC.TTF",32);
  futuraBold = createFont("data/fonts/FUTURA75BOLD.TTF",32);
  futuraBoldItalic = createFont("data/fonts/FUTURA76BOLDITALIC.TTF",32);
  
  FONT_FUTURA = new PFont[]{futuraLight, futuraLightItalic, futuraRegular, futuraRegularItalic, futuraMedium, futuraMediumItalic, futuraBold, futuraBoldItalic};
  
     if (framesSaved < framesToSave) {
    saveFrame("frames/dice-####.png");
    framesSaved++;
  }
}

void draw() {
  background(#AAF0E4);
  int espacio = 40;
  float x = (width - palabra.length() * espacio) / 2;
  float y = height / 2;
  float influenciaAnimacion = random(0, palabra.length());

  for (int i = int(influenciaAnimacion); i < palabra.length(); i++) {
    float tamaño = random(40, 80);
    float espaciado = random(-20, 5);
    fill(#1D3C4D);
    text(palabra.charAt(i), x + i * espacio + espaciado, y + i * 0.2);
    textSize(tamaño);
    PFont fuenteAleatoria = FONT_FUTURA[int(random(FONT_FUTURA.length))];
    textFont(fuenteAleatoria);
  }
}

void settings() {
  fullScreen();
    pixelDensity(2);
}
