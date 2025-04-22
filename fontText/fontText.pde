String title = "Wahoo!";
String footer = "varoom! varoom!";


size(700,500);
int appWidth = width;
int appHeight = height;
int shorterSide = (appWidth >= appHeight ) ? appHeight:  appWidth;

println("start of console");
/*
String[] fontList = PFont.list();
printArray(fontList);*/

PFont titleFont = createFont("Segoe Script Bold", shorterSide);
float titleX, titleY, titleWidth, titleHeight;
float footerX, footerY, footerWidth, footerHeight;
titleX = appWidth*1/4;
titleY = appHeight*1/4;
titleWidth = appWidth*1/2;
titleHeight = appHeight*1/10;

footerX = appWidth*1/4;
footerY  = appHeight*3/4;
footerWidth = appWidth*1/2;
footerHeight  = appHeight*1/10;

rect(titleX, titleY, titleWidth, titleHeight);
rect(footerX, footerY, footerWidth, footerHeight);

float fontSize = 10;
println("Manueal entered foint size:", fontSize);
//float segoeScriptBoldAspectRAtio = fontSize / titleHeight;
//fontSize = tittleHeight * segoeScriptBoldAspectRAtio;

println("segoeScriptBoldAspectRAtio:", segoeScriptBoldAspectRAtio);
println();
//
color purpleInk = #2C08FF;
fill(purpleInk);
textAlign (CENTER, CENTER);



text(title, titleX, titleY, titleWidth, titleHeight);
text(footer, footerX, footerY, footerWidth, footerHeight);


//Segoe Script Bold
