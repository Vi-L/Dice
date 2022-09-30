void setup()
{
    size(750, 750);
    textSize(13);
    noLoop();
}

double sumAvg = 0;
int totalSum = 0;
int numTrials = 0;
void draw()
{   
    fill(255);
    stroke(1);
    background(136, 250, 137); // light green
    int sum = 0;
    int numDice = 0;
    int numCounts[] = {0, 0, 0, 0, 0, 0}; // indices: 0-5 instead of 1-6
    int longestStreak = 0; // TODO: track streak
    
    for (int row = 50; row < height; row += 50) {
      for (int col = 10; col < width; col += 50) {
        Die d = new Die(col, row);
        d.roll();
        d.show();
        
        numCounts[d.dieNum - 1]++; // dieNum - 1 because array is 0-indexed
        sum += d.dieNum;
        numDice++;
      }
    }
    
    numTrials++;
    totalSum += sum;
    sumAvg = totalSum / numTrials;
    
    fill(180, 0, 15);
    text("Sum of " + numDice + " dice rolls for this trial is: " + sum, 10, 20);
    text("Average of " + numTrials + " trials is: " + sumAvg, 10, 35);
    text("Most common number in this trial is: " + (indexOfMaxVal(numCounts) + 1), 400, 20); // index + 1 because array is 0-indexed
    
}
void mousePressed()
{
    redraw();
}
int indexOfMaxVal(int arr[]) {
  int maxIndex = 0;
  int maxVal = -1;
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] > maxVal) {
      maxIndex = i;
      maxVal = arr[i];
    }
  }
  return maxIndex;
}

class Die //models one single dice cube
{
    int dieX, dieY, dieSize, dieNum, dotSize;
    
    Die(int x, int y) //constructor
    {
        dieX = x;
        dieY = y;
        dieSize = 30;
        dotSize = 5;
        dieNum = (int)(Math.random() * 6 + 1);
    }
    void roll()
    {
        dieNum = (int)(Math.random() * 6 + 1);
    }
    void show()
    {    
        fill(0, 0, 0);
        if (dieNum == 1) {
          fill(255, 129, 139); // pink
          rect(dieX, dieY, dieSize, dieSize);
          
          fill(0, 0, 0);
          ellipse(dieX + dieSize/2, dieY + dieSize/2, dotSize, dotSize);
        } else if (dieNum == 2) {
          fill(255, 183, 49); // orange
          rect(dieX, dieY, dieSize, dieSize);
          
          fill(0, 0, 0);
          ellipse(dieX + dieSize/3, dieY + dieSize/3, dotSize, dotSize);
          ellipse(dieX + 2*dieSize/3, dieY + 2*dieSize/3, dotSize, dotSize);
        } else if (dieNum == 3) {
          fill(234, 255, 103); // yellow
          rect(dieX, dieY, dieSize, dieSize);
          
          fill(0, 0, 0);
          ellipse(dieX + dieSize/3, dieY + 2*dieSize/3, dotSize, dotSize);
          ellipse(dieX + 2*dieSize/3, dieY + dieSize/3, dotSize, dotSize);
          ellipse(dieX + dieSize/2, dieY + dieSize/2, dotSize, dotSize);
        } else if (dieNum == 4) {
          fill(62, 255, 73); // bright green
          rect(dieX, dieY, dieSize, dieSize);
          
          fill(0, 0, 0);
          ellipse(dieX + dieSize/4, dieY + dieSize/4, dotSize, dotSize);
          ellipse(dieX + 3*dieSize/4, dieY + dieSize/4, dotSize, dotSize);
          ellipse(dieX + dieSize/4, dieY + 3*dieSize/4, dotSize, dotSize);
          ellipse(dieX + 3*dieSize/4, dieY + 3*dieSize/4, dotSize, dotSize);
        } else if (dieNum == 5) {
          fill(166, 237, 245); // light blue
          rect(dieX, dieY, dieSize, dieSize);
          
          fill(0, 0, 0);
          ellipse(dieX + dieSize/4, dieY + dieSize/4, dotSize, dotSize);
          ellipse(dieX + 3*dieSize/4, dieY + dieSize/4, dotSize, dotSize);
          ellipse(dieX + dieSize/4, dieY + 3*dieSize/4, dotSize, dotSize);
          ellipse(dieX + 3*dieSize/4, dieY + 3*dieSize/4, dotSize, dotSize);
          ellipse(dieX + dieSize/2, dieY + dieSize/2, dotSize, dotSize);
        } else if (dieNum == 6) {
          fill(194, 166, 245); // light purple
          rect(dieX, dieY, dieSize, dieSize);
          
          fill(0, 0, 0);
          ellipse(dieX + dieSize/3, dieY + dieSize/4, dotSize, dotSize);
          ellipse(dieX + dieSize/3, dieY + 2*dieSize/4, dotSize, dotSize);
          ellipse(dieX + dieSize/3, dieY + 3*dieSize/4, dotSize, dotSize);
          ellipse(dieX + 2*dieSize/3, dieY + dieSize/4, dotSize, dotSize);
          ellipse(dieX + 2*dieSize/3, dieY + 2*dieSize/4, dotSize, dotSize);
          ellipse(dieX + 2*dieSize/3, dieY + 3*dieSize/4, dotSize, dotSize);
        }
    }
}
