
class NeuralNet {
  int inNodes,  hidNodes, outNodes;  // no. of nodes
  Matrix weightIn, weightHid, weightOut;  // maticies containing weights between the nodes
  
  NeuralNet( int inputs, int hiddenNo, int outputNo) {
    inNodes = inputs;
    hidNodes = hiddenNo;
    outNodes = outputNo;
    
    weightIn = new Matrix(hidNodes, inNodes+1);  // +1 for bias
    weightHid = new Matrix(hidNodes, hidNodes+1);
    weightOut = new Matrix(outNodes, hidNodes+1);
    weightIn.randomise();
    weightHid.randomise();
    weightOut.randomise();
  }
  
  void mutate(float mr) {
    weightIn.mutate(mr);
    weightHid.mutate(mr);
    weightOut.mutate(mr);
  }
  
  float[] output(float[] inputsArr) {  // calculate output values by feeding forward through NN
    Matrix inputs = weightOut.singleColumnMatrixFromArray(inputsArr);  // convert arr to matrix
    Matrix inputsBias = inputs.addBias();  // add bias
    
    Matrix hiddenInputs = weightIn.dot(inputsBias);  // apply layer one weights
    Matrix hiddenOutputs = hiddenInputs.activate();  // pass through activation function
    Matrix hiddenOutputsBias = hiddenOutputs.addBias();  // add bias
    
    Matrix hiddenInputs2 = weightHid.dot(hiddenOutputsBias);
    Matrix hiddenOutputs2 = hiddenInputs2.activate();
    Matrix hiddenOutputsBias2 = hiddenOutputs2.addBias();
    
    Matrix outputInputs = weightOut.dot(hiddenOutputsBias2);
    Matrix outputs = outputInputs.activate();
    
    return outputs.toArray();
  }
  
  NeuralNet crossover(NeuralNet partner) {  // creates a new child with layer matricies from both parents
    NeuralNet child = new NeuralNet(inNodes, hidNodes, outNodes);
    child.weightIn = weightIn.crossover(partner.weightIn);
    child.weightHid = weightHid.crossover(partner.weightHid);
    child.weightOut = weightOut.crossover(partner.weightOut);
    return child;
  }
  
  NeuralNet clone() {
    NeuralNet clone = new NeuralNet(inNodes, hidNodes, outNodes); 
    clone.weightIn = weightIn.clone();
    clone.weightHid = weightHid.clone();
    clone.weightOut = weightOut.clone();
    return clone;
  }
  
  Table NetToTable() {
    Table t = new Table();
    float[] weightInArr = weightIn.toArray();
    float[] weightHidArr = weightHid.toArray();
    float[] weightOutArr = weightOut.toArray();
    
    for (int i=0; i < max(weightInArr.length, weightHidArr.length, weightOutArr.length); i++) {
      t.addColumn();
    } 
    
    TableRow tr = t.addRow();
    for (int i=0; i < weightInArr.length; i++) {
      tr.setFloat(i, weightInArr[i]); 
    }
    tr = t.addRow();
    for (int i=0; i < weightHidArr.length; i++) {
      tr.setFloat(i, weightHidArr[i]); 
    }
    tr = t.addRow();
    for (int i=0; i < weightOutArr.length; i++) {
      tr.setFloat(i, weightOutArr[i]); 
    }
    return t;
  }
  
  void TableToNet(Table t) {
    float[] weightInArr = new float[weightIn.rows * weightIn.cols];  //create arrays to tempurarily store the data for each matrix
    float[] weightHidArr = new float[weightHid.rows * weightHid.cols];
    float[] weightOutArr = new float[weightOut.rows * weightOut.cols];

    TableRow tr = t.getRow(0);  //set the weightIn array as the first row of the table
    for (int i = 0; i< weightInArr.length; i++) {
      weightInArr[i] = tr.getFloat(i);
    }

    tr = t.getRow(1);  //set the weightHid array as the second row of the table
    for (int i = 0; i< weightHidArr.length; i++) {
      weightHidArr[i] = tr.getFloat(i);
    }

    tr = t.getRow(2);  //set the weightOut array as the third row of the table
    for (int i = 0; i< weightOutArr.length; i++) {
      weightOutArr[i] = tr.getFloat(i);
    }

    weightIn.fromArray(weightInArr);  //convert the arrays to matricies and set them as the layer matricies
    weightHid.fromArray(weightHidArr);
    weightOut.fromArray(weightOutArr);
  }
}
