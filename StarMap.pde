Table table;
void setup()
{
  size(800,800);
  
  table = loadTable("stars.csv","header, csv");
  loadData();
}

ArrayList<Star> stars = new ArrayList<Star>();

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