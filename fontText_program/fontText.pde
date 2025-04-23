
int shorterSide;
float titleX, titleY, titleWidth;
float footerX, footerY, footerWidth;
float[] rectDIVHeight = new float [2];

void setup() {
  size(700, 500);
  int appWidth = width;
  int appHeight = height;
  shorterSide = (appWidth >= appHeight ) ? appHeight:  appWidth;

  textSetup1();
  
 
  titleX = appWidth*1/4;
  titleY = appHeight*1/4;
  titleWidth = appWidth*1/2;
  rectDIVHeight[0] = appHeight*1/10;

  footerX = appWidth*1/4;
  footerY  = appHeight*3/4;
  footerWidth = appWidth*1/2;
  rectDIVHeight[1]  = appHeight*1/10;

  rect(titleX, titleY, titleWidth, rectDIVHeight[0]);
  rect(footerX, footerY, footerWidth, rectDIVHeight[1]);
  textSetup2();
  //
  float fontSize = 39;
  println("Manueal entered foint size:", fontSize);

  
  textFont(appFont, fontSize);

  while ( footerWidth < textWidth( footer )) {
    fontSize = fontSize*0.99;
    textFont(appFont, fontSize);
  }
  
  println("segoeScriptBoldAspectRAtio:", segoeScriptBoldAspectRAtio);
  println();

  color purpleInk = #2C08FF;
  fill(purpleInk);
  textAlign (CENTER, CENTER);


  text(title, titleX, titleY, titleWidth, rectDIVHeight[0]);
  text(footer, footerX, footerY, footerWidth, rectDIVHeight[1]);
  color whiteInk = #FFFFFF;
  fill(whiteInk);

  println( "Text Width:", textWidth(title), "v rectWidth:", titleWidth ); //Always smaller or cut off, if text is drawn, always drawn
  println( "Text Height:", fontSize, "v. rectHeight:", rectDIVHeight[0] ); //largest fontSize that will be draw, relative to rectHeight
  println( "Harrington Aspect Ratio ( fontSize/rect(height) ):", fontSize/rectDIVHeight[0] ); //Remember casting
}

void draw() {
}

void mousePressed() {
}

void keyPressed() {
}
