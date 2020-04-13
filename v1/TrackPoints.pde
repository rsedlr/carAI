
public void setPoints(String type, PVector[] innerPoints, PVector[] outerPoints, PVector[] finishLine, PVector[] preFinLine) {  // PVector start, float startAngle
  if (type == "" || type == "default") {
    preFinLine[0] = new PVector(720, 680);
    preFinLine[1] = new PVector(720, 770);
    finishLine[0] = new PVector(800, 63);
    finishLine[1] = new PVector(800, 151);
    
    outerPoints[0] = new PVector(493, 770);
    outerPoints[1] = new PVector(235, 770);
    outerPoints[2] = new PVector(110, 722);
    outerPoints[3] = new PVector(35, 596);
    outerPoints[4] = new PVector(35, 430);  //
    outerPoints[5] = new PVector(35, 250);  // 
    outerPoints[6] = new PVector(35, 151);
    outerPoints[7] = new PVector(110, 63);
    outerPoints[8] = new PVector(206, 63);
    outerPoints[9] = new PVector(281, 151);
    outerPoints[10] = new PVector(281, 300);
    outerPoints[11] = new PVector(281, 410);  
    outerPoints[12] = new PVector(315, 479);
    outerPoints[13] = new PVector(380, 510);
    outerPoints[14] = new PVector(520, 510);
    outerPoints[15] = new PVector(710, 510);  //
    outerPoints[16] = new PVector(781, 510);
    outerPoints[17] = new PVector(844, 485);
    outerPoints[18] = new PVector(868, 427);
    outerPoints[19] = new PVector(844, 369);
    outerPoints[20] = new PVector(781, 354);
    outerPoints[21] = new PVector(550, 430);
    outerPoints[22] = new PVector(425, 392);
    outerPoints[23] = new PVector(357, 237);
    outerPoints[24] = new PVector(426, 112);
    outerPoints[25] = new PVector(596, 63);
    outerPoints[26] = new PVector(1021, 63);
    outerPoints[27] = new PVector(1125, 114);
    outerPoints[28] = new PVector(1165, 200);
    outerPoints[29] = new PVector(1165, 415);  //
    outerPoints[30] = new PVector(1165, 630);
    outerPoints[31] = new PVector(1088, 732);
    outerPoints[32] = new PVector(941, 770);
    outerPoints[33] = new PVector(717, 770);  //
    
    innerPoints[0] = new PVector(493, 680);
    innerPoints[1] = new PVector(269, 680);
    innerPoints[2] = new PVector(189, 645);
    innerPoints[3] = new PVector(125, 564);
    innerPoints[4] = new PVector(125, 430);  //
    innerPoints[5] = new PVector(125, 250);  //
    innerPoints[6] = new PVector(125, 190);
    innerPoints[7] = new PVector(148, 163);
    innerPoints[8] = new PVector(168, 163);
    innerPoints[9] = new PVector(191, 190);
    innerPoints[10] = new PVector(191, 300); 
    innerPoints[11] = new PVector(191, 473); 
    innerPoints[12] = new PVector(234, 560);
    innerPoints[13] = new PVector(311, 600);
    innerPoints[14] = new PVector(520, 600);
    innerPoints[15] = new PVector(710, 600);  //
    innerPoints[16] = new PVector(847, 600);
    innerPoints[17] = new PVector(956, 513);
    innerPoints[18] = new PVector(981, 372);
    innerPoints[19] = new PVector(902, 261);
    innerPoints[20] = new PVector(764, 244);
    innerPoints[21] = new PVector(574, 316);
    innerPoints[22] = new PVector(510, 309);
    innerPoints[23] = new PVector(476, 239);
    innerPoints[24] = new PVector(523, 177);
    innerPoints[25] = new PVector(630, 151);
    innerPoints[26] = new PVector(965, 151);
    innerPoints[27] = new PVector(1038, 195);
    innerPoints[28] = new PVector(1075, 255);
    innerPoints[29] = new PVector(1075, 415);  //
    innerPoints[30] = new PVector(1075, 575);
    innerPoints[31] = new PVector(1028, 641);
    innerPoints[32] = new PVector(941, 680);
    innerPoints[33] = new PVector(717, 680);  // 
  } else if (type == "brands") {
    
  }

}
