_board board = new _board(4,4);//4x4 grid
void setup(){
  size(500,500);
  //fullScreen();
  
  noStroke();
  board.clearBoard();
  
  background(color(210,180,140));
  board.clearBoard();
  board.spawnNum();
}

void draw(){
  board.drawBoard();
}
void keyTyped(){
  if(key==CODED){
    switch(keyCode){
      case UP:
        break;
      case DOWN:
        break;
      case LEFT:
        break;
      case RIGHT:
        break;
    }
  }
}
class _board{
  int boardWidth,boardHeight;
  int[][] numbers = new int[boardWidth][boardHeight];
  _board(int _width, int _height){
    boardWidth=_width;
    boardHeight=_height;
  }
  
  void drawBoard(){
    stroke(color(255,255,255));
    strokeWeight(5);
    float tileSize=width/boardWidth;
    for(int y=0;y<boardHeight;y++){
      for(int x=0;x<boardWidth;x++){
        fill(color(255, 253, 208));
        rect(x*tileSize, y*tileSize, width/boardWidth,height/boardHeight);
        fill(color(0,0,0));
        textSize(50);
        textAlign(CENTER);
        if(numbers[x][y]==-1){
          text(" ",x*tileSize+50, y*tileSize+50*1.5);
        }
        else
        {
          text(numbers[x][y],x*tileSize+50, y*tileSize+50*1.5);
        }
        
      }
    }
  }
  void clearBoard(){
    numbers=new int[][]{
      {-1,-1,-1,-1},
      {-1,-1,-1,-1},
      {-1,-1,-1,-1},
      {-1,-1,-1,-1}};
  }
  ArrayList<int[]> findUnoccupied(){
    ArrayList<int[]> temp=new ArrayList<int[]>(){};
    for(int x=0;x<numbers[0].length;x++){
      for(int y=0;y<numbers.length;y++){
        if(numbers[x][y]==-1){
          temp.add(new int[]{x,y});
        }
      }
    }
    return temp;
  }
  void spawnNum(){//adds either 2 or 4 at a random unoccupied square
    int twoOrFour=int(random(0,1+1))==0?2:4;
    ArrayList<int[]> unoccupied=findUnoccupied();
    int randomUnoccupiedPosition=int(random(0,unoccupied.size()));
    numbers[unoccupied.get(randomUnoccupiedPosition)[0]][unoccupied.get(randomUnoccupiedPosition)[1]]=twoOrFour;
  }
  
}
