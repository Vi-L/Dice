void setup()
{
    size(500, 500);
    noLoop();
}

double sumAvg = 0;
int totalSum = 0;
int numTrials = 0;
void draw()
{   
    fill(255);
    stroke(1);
    background(200);
    int sum = 0;
    int numDice = 0;
    
    for (int row = 50; row < height; row += 50) {
      for (int col = 10; col < width; col += 50) {
        Die d = new Die(col, row);
        d.roll();
        d.show();
        
        sum += d.dieNum;
        numDice++;
      }
    }
    
    numTrials++;
    totalSum += sum;
    sumAvg = totalSum / numTrials;
    
    fill(0);
    text("Sum of " + numDice + " dice rolls for this trial is: " + sum, 10, 20);
    text("Average of " + numTrials + " trials is: " + sumAvg, 10, 35);
    
}
void mousePressed()
{
    redraw();
}
class Die //models one single dice cube
{
    int dieX, dieY, dieSize, dieNum, dotSize;
    
    Die(int x, int y) //constructor
    {
        dieX = x;
        dieY = y;
        dieSize = 30;
        dotSize = 3;
        dieNum = (int)(Math.random() * 6 + 1);
    }
    void roll()
    {
        dieNum = (int)(Math.random() * 6 + 1);
    }
    void show()
    {    
        fill(255, 255, 255);
        rect(dieX, dieY, dieSize, dieSize);
        fill(0, 0, 0);
        if (dieNum == 1) {
          ellipse(dieX + dieSize/2, dieY + dieSize/2, dotSize, dotSize);
        } else if (dieNum == 2) {
          ellipse(dieX + dieSize/3, dieY + dieSize/3, dotSize, dotSize);
          ellipse(dieX + 2*dieSize/3, dieY + 2*dieSize/3, dotSize, dotSize);
        } else if (dieNum == 3) {
          ellipse(dieX + dieSize/3, dieY + 2*dieSize/3, dotSize, dotSize);
          ellipse(dieX + 2*dieSize/3, dieY + dieSize/3, dotSize, dotSize);
          ellipse(dieX + dieSize/2, dieY + dieSize/2, dotSize, dotSize);
        } else if (dieNum == 4) {
          ellipse(dieX + dieSize/4, dieY + dieSize/4, dotSize, dotSize);
          ellipse(dieX + 3*dieSize/4, dieY + dieSize/4, dotSize, dotSize);
          ellipse(dieX + dieSize/4, dieY + 3*dieSize/4, dotSize, dotSize);
          ellipse(dieX + 3*dieSize/4, dieY + 3*dieSize/4, dotSize, dotSize);
        } else if (dieNum == 5) {
          ellipse(dieX + dieSize/4, dieY + dieSize/4, dotSize, dotSize);
          ellipse(dieX + 3*dieSize/4, dieY + dieSize/4, dotSize, dotSize);
          ellipse(dieX + dieSize/4, dieY + 3*dieSize/4, dotSize, dotSize);
          ellipse(dieX + 3*dieSize/4, dieY + 3*dieSize/4, dotSize, dotSize);
          ellipse(dieX + dieSize/2, dieY + dieSize/2, dotSize, dotSize);
        } else if (dieNum == 6) {
          ellipse(dieX + dieSize/3, dieY + dieSize/4, dotSize, dotSize);
          ellipse(dieX + dieSize/3, dieY + 2*dieSize/4, dotSize, dotSize);
          ellipse(dieX + dieSize/3, dieY + 3*dieSize/4, dotSize, dotSize);
          ellipse(dieX + 2*dieSize/3, dieY + dieSize/4, dotSize, dotSize);
          ellipse(dieX + 2*dieSize/3, dieY + 2*dieSize/4, dotSize, dotSize);
          ellipse(dieX + 2*dieSize/3, dieY + 3*dieSize/4, dotSize, dotSize);
        }
    }
}
