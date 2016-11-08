class Star
{
  int hab;
  String starName;
  float distance;
  float xg, yg, zg;
  float absMag;
  
  Star(int hab, String starName, float distance, float xg, float yg, float zg, float absMag)
  {
    this.hab = hab;
    this.starName = starName;
    this.distance = distance;
    this.xg = xg;
    this.yg = yg;
    this.zg = zg;
    this.absMag = absMag;
  }
  
  //To string method
  String toString()
  {
    return hab + "\t" + starName + "\t" + distance + "\t" + xg + "\t" + yg + "\t" + zg + "\t" + absMag;
  }
  
}