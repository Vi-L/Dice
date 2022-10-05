void setup()
{
    size(750, 750);
    textSize(13);
    noLoop();
}

double sumAvg = 0;
int totalSum = 0;
int numTrials = 0;
Die[] allDice = new Die[210]; // hardcoded to 210 for now
void draw()
{   
    fill(255);
    stroke(1);
    background(136, 250, 137); // light green
    int sum = 0;
    int numDice = 0;
    int numCounts[] = new int[6]; // indices: 0-5 instead of 1-6
    int longestStreak = 0;
    int currStreak = 0;
    int prevNum = 0;
    
    for (int row = 50; row < height; row += 50) {
      for (int col = 10; col < width; col += 50) {
        Die d = new Die(col, row);
        d.roll();
        d.show();
        
        allDice[numDice] = d;
        
        if (d.dieNum == prevNum) currStreak++;
        else currStreak = 0;
        if (currStreak > longestStreak) longestStreak = currStreak;
        prevNum = d.dieNum;
        
        numCounts[d.dieNum - 1]++; // dieNum - 1 because array is 0-indexed
        sum += d.dieNum;
        numDice++;
      }
    }
    for (int i = 0; i < allDice.length; i++) {
      if ( isStreakStart(allDice, i, longestStreak) ) {
        for (int j = i; j < i + longestStreak + 1; j++) {
          fill(59, 59, 59, 150);
          strokeWeight(0);
          int w = 0;
          if (j == i + longestStreak) w = 30;
          else w = 50;
          if (j < allDice.length) rect(allDice[j].dieX, allDice[j].dieY, w, 30);
        }
      }
    }
    
    numTrials++;
    totalSum += sum;
    sumAvg = totalSum / numTrials;
    
    fill(180, 0, 15);
    strokeWeight(1);
    text("Sum of " + numDice + " dice rolls for this trial is: " + sum, 10, 20);
    text("Average of " + numTrials + " trials is: " + sumAvg, 10, 35);
    text("Most common number in this trial is: " + (indexOfMaxVal(numCounts) + 1), 400, 20); // index + 1 because array is 0-indexed
    text("Longest streak for this trial is: " + (longestStreak+1) + " in a row (highlighted)", 400, 35);
    
}
void mousePressed()
{
    redraw();
}

boolean isStreakStart(Die[] arr, int index, int streakLength) {
  if (index == arr.length - 1) return false;
  for (int i = index; i < index + streakLength; i++) {
    if (i + 1 >= arr.length) return false;
     if (arr[i].dieNum != arr[i + 1].dieNum) {
       return false;
    }
  }
  return true;
}

int indexOfMaxVal(int[] arr) {
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
