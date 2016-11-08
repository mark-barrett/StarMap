Table table;
void setup()
{
  size(500,500);
  background(0);
  
  table = loadTable("stars.csv","header, csv");
  loadData();
  printStars();
  drawGrid();
}

ArrayList<Star> stars = new ArrayList<Star>();

float boxX = 50;
float boxY = 50;
    
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