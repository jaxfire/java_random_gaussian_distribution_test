import java.util.Random;

Random generator;

int allCount;

int oneDeviationCount;
float oneDPercent;

int twoDeviationCount;
float twoDPercent;

int threeDeviationCount;
float threeDPercent;

void setup(){
  size(640,360);
  background(255);
  generator = new Random();
  
  
}

void draw(){
  
  allCount++;
  
  float rand = (float) generator.nextGaussian();
  float standardDeviation = 30;
  float mean = 320;
  
  float x = rand * standardDeviation + mean;
  
  noStroke();
  fill(0,10);
  ellipse(x, 180, 16, 16);
  if(Math.abs(mean - x) < standardDeviation){
    oneDeviationCount++;
    oneDPercent = ((float)oneDeviationCount / allCount) * 100;
  } else if (Math.abs(mean - x) < 2 * standardDeviation){
    twoDeviationCount++;
    twoDPercent = ((float)twoDeviationCount / allCount) * 100;
  } else if(Math.abs(mean - x) < 3 * standardDeviation) {
    threeDeviationCount++;
    threeDPercent = ((float)threeDeviationCount / allCount) * 100;
  }
  
  //Random guassian should return circa 70% of values within one standard deviation
  System.out.println("--------");
  System.out.println("COUNT - 1D: " + oneDeviationCount + ", 2D: " + twoDeviationCount + ", 3D: " + threeDeviationCount);
  System.out.println("PERCENTAGE - 1D%: " + oneDPercent + ", 2D%: " + twoDPercent + ", 3D%: " + threeDPercent);
}