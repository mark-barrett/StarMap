Table table;
void setup()
{
  size(800,800);
  background(0);
  
  table = loadTable("stars.csv","header, csv");
  loadData();
  drawGrid();
  printStars();
  renderStars();
}

ArrayList<Star> stars = new ArrayList<Star>();

float boxX = 50;
float boxY = 50;

float startX;
float startY;

boolean lineDrawn = false;

Star star;
void draw()
{
  
  
}

void loadData()
{
  for(TableRow row : table.rows())
  {
    int hab = row.getInt("Hab?");
    String starName = row.getString("Display Name");
    float distance = row.getFloat("Distance");
    float xg = row.getFloat("Xg");
    float yg = row.getFloat("Yg");
    float zg = row.getFloat("Zg");
    float absMag = row.getFloat("AbsMag");
    
    star = new Star(hab, starName, distance, xg, yg, zg, absMag);
    stars.add(star);
  }
}

void printStars()
{
  for(int i=0; i<stars.size(); i++)
  {
    println(stars.get(i).toString());
  }
}

void drawGrid()
{
  float boxWidth = width / 10 -10;
  int parsecs = -5;
  
  for(int i=0; i<10; i++)
  {
    for(int j=0; j<10; j++)
    {
      float x = map(i, 0, 10, 50, width-50);
      float y = map(j, 0, 10, 50, height-50);
      noFill();
      stroke(208, 58, 250);
      rect(x, y, boxWidth, boxWidth);
      
      if(i==0)
      {
        fill(208, 58, 250);
        text(parsecs, y, 20);
        text(parsecs, x-40, y, 20);
        parsecs++;
      }
    }
  }
}

void renderStars()
{
  for(int i=0; i<stars.size(); i++)
  {
    stars.get(i).drawStar();
  }
}

void mousePressed()
{
  for(int i=0; i<stars.size(); i++)
  {
    float mappedxg = map(stars.get(i).xg, -5, 5, 50, width-50);
    float mappedyg = map(stars.get(i).yg, -5, 5, 50, height-50);
    if(mouseX > mappedxg-2 && mouseX < mappedxg+2)
    {
      stars.get(i).clickFlag = 1;
      println(stars.get(i).starName);
    }
  }  
    
}

void mouseDragged()
{
  for(int i=0; i<stars.size(); i++)
  {
    if(stars.get(i).clickFlag == 1)
    {
      float mappedxg = map(stars.get(i).xg, -5, 5, 50, width-50);
      line(mouseX, mouseY, mappedxg, stars.get(i).yg);
      startX = mappedxg;
      startY = stars.get(i).yg;
      lineDrawn = true;
      stars.get(i).clickFlag = 0;
    }
  }
}

void mouseReleased()
{
  if(lineDrawn == true)
  {
    strokeWeight(3);
    stroke(255);
    line(startX, startY, mouseX, mouseY);
    lineDrawn = false;
    startX = 0;
    startY = 0;
    float distance = startX-mouseY;
    String message = "Distance "+distance;
    text(message, 50, height-10);
  }
}