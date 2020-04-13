
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
  } else if (type == "new") {
    preFinLine[0] = new PVector(720, 680);
    preFinLine[1] = new PVector(720, 770);
    finishLine[0] = new PVector(800, 63);
    finishLine[1] = new PVector(800, 151);
    
    innerPoints[0] = new PVector(750, 745);
    innerPoints[1] = new PVector(1063, 745);
    innerPoints[2] = new PVector(1112, 701);
    innerPoints[3] = new PVector(1070, 642);
    innerPoints[4] = new PVector(570, 547);
    innerPoints[5] = new PVector(581, 504);
    innerPoints[6] = new PVector(1129, 318);
    innerPoints[7] = new PVector(1107, 172);
    innerPoints[8] = new PVector(927, 138);
    innerPoints[9] = new PVector(647, 139);
    innerPoints[10] = new PVector(713, 317);
    innerPoints[11] = new PVector(387, 428);
    innerPoints[12] = new PVector(353, 407);
    innerPoints[13] = new PVector(570, 130);
    innerPoints[14] = new PVector(101, 136);
    innerPoints[15] = new PVector(87, 201);
    innerPoints[16] = new PVector(345, 231);
    innerPoints[17] = new PVector(128, 394);
    innerPoints[18] = new PVector(50, 470);
    innerPoints[19] = new PVector(101, 529);
    innerPoints[20] = new PVector(392, 533);
    innerPoints[21] = new PVector(452, 542);
    innerPoints[22] = new PVector(411, 612);
    innerPoints[23] = new PVector(168, 598);
    innerPoints[24] = new PVector(51, 670);
    innerPoints[25] = new PVector(118, 737);
    innerPoints[26] = new PVector(440, 739);
    innerPoints[27] = new PVector(540, 668);
    innerPoints[28] = new PVector(560, 668);
    innerPoints[29] = new PVector(660, 741);
    
    outerPoints[0] = new PVector(750, 745);
    outerPoints[1] = new PVector(1063, 745);
    outerPoints[2] = new PVector(1112, 701);
    outerPoints[3] = new PVector(1070, 642);
    outerPoints[4] = new PVector(570, 547);
    outerPoints[5] = new PVector(581, 504);
    outerPoints[6] = new PVector(1129, 318);
    outerPoints[7] = new PVector(1107, 172);
    outerPoints[8] = new PVector(927, 138);
    outerPoints[9] = new PVector(647, 139);
    outerPoints[10] = new PVector(713, 317);
    outerPoints[11] = new PVector(387, 428);
    outerPoints[12] = new PVector(353, 407);
    outerPoints[13] = new PVector(570, 130);
    outerPoints[14] = new PVector(101, 136);
    outerPoints[15] = new PVector(87, 201);
    outerPoints[16] = new PVector(345, 231);
    outerPoints[17] = new PVector(128, 394);
    outerPoints[18] = new PVector(50, 470);
    outerPoints[19] = new PVector(101, 529);
    outerPoints[20] = new PVector(392, 533);
    outerPoints[21] = new PVector(452, 542);
    outerPoints[22] = new PVector(411, 612);
    outerPoints[23] = new PVector(168, 598);
    outerPoints[24] = new PVector(51, 670);
    outerPoints[25] = new PVector(118, 737);
    outerPoints[26] = new PVector(440, 739);
    outerPoints[27] = new PVector(540, 668);
    outerPoints[28] = new PVector(560, 668);
    outerPoints[29] = new PVector(660, 741);

    
  }

}

    //innerPoints[0] = new PVector(456, 653);
    //innerPoints[1] = new PVector(456, 653);
    //innerPoints[2] = new PVector(310, 679);
    //innerPoints[3] = new PVector(164, 629);
    //innerPoints[4] = new PVector(95, 517);
    //innerPoints[5] = new PVector(113, 323);
    //innerPoints[6] = new PVector(183, 145);
    //innerPoints[7] = new PVector(255, 109);
    //innerPoints[8] = new PVector(297, 169);
    //innerPoints[9] = new PVector(264, 344);
    //innerPoints[10] = new PVector(290, 467);
    //innerPoints[11] = new PVector(431, 497);
    //innerPoints[12] = new PVector(636, 457);
    //innerPoints[13] = new PVector(816, 384);
    //innerPoints[14] = new PVector(889, 200);
    //innerPoints[15] = new PVector(986, 140);
    //innerPoints[16] = new PVector(1102, 212);
    //innerPoints[17] = new PVector(1111, 353);
    //innerPoints[18] = new PVector(1021, 460);
    //innerPoints[19] = new PVector(848, 541);
