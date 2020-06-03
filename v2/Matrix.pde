
class Matrix {
  int rows;
  int cols;
  float[][] matrix;
  
  Matrix(int r, int c) {
    rows = r;
    cols = c;
    matrix = new float[rows][cols];
  }
  
  Matrix(float[][] m) {  // constructor from 2D array
    matrix = m;
    cols = m.length;
    rows = m[0].length;
  }
  
  void output() {  //print matrix
    for (int i =0; i<rows; i++) {
      for (int j = 0; j<cols; j++) {
        print(matrix[i][j] + "  ");
      }
      println(" ");
    }
    println();
  }
  
  
  void multiply(float n ) {  //multiply by scalor
    for (int i =0; i<rows; i++) {
      for (int j = 0; j<cols; j++) {
        matrix[i][j] *= n;
      }
    }
  }


  Matrix dot(Matrix n) {  //return a matrix which is this matrix dot product parameter matrix 
    Matrix result = new Matrix(rows, n.cols);
   
    if (cols == n.rows) {
      for (int i=0; i < rows; i++) {  //for each spot in the new matrix
        for (int j=0; j < n.cols; j++) {
          float sum = 0;
          for (int k=0; k < cols; k++) {
            sum += matrix[i][k] * n.matrix[k][j];
          }
          result.matrix[i][j] = sum;
        }
      }
    }
    return result;
  }


  void randomise() {  //set the matrix to random ints between -1 and 1
    for (int i=0; i < rows; i++) {
      for (int j=0; j < cols; j++) {
        matrix[i][j] = random(-1, 1);
      }
    }
  }


  void Add(float n ) {  //add a scalor to the matrix
    for (int i =0; i<rows; i++) {
      for (int j = 0; j<cols; j++) {
        matrix[i][j] += n;
      }
    }
  }


  Matrix add(Matrix n ) {  //return a matrix which is this matrix + parameter matrix
    Matrix newMatrix = new Matrix(rows, cols);
    if (cols == n.cols && rows == n.rows) {
      for (int i=0; i < rows; i++) {
        for (int j=0; j < cols; j++) {
          newMatrix.matrix[i][j] = matrix[i][j] + n.matrix[i][j];
        }
      }
    }
    return newMatrix;
  }


  Matrix subtract(Matrix n ) {  //return a matrix which is this matrix - parameter matrix
    Matrix newMatrix = new Matrix(cols, rows);
    if (cols == n.cols && rows == n.rows) {
      for (int i=0; i < rows; i++) {
        for (int j=0; j < cols; j++) {
          newMatrix.matrix[i][j] = matrix[i][j] - n.matrix[i][j];
        }
      }
    }
    return newMatrix;
  }

  
  Matrix multiply(Matrix n ) {  //return a matrix which is this matrix * parameter matrix (element wise multiplication)
    Matrix newMatrix = new Matrix(rows, cols);
    if (cols == n.cols && rows == n.rows) {
      for (int i=0; i < rows; i++) {
        for (int j=0; j < cols; j++) {
          newMatrix.matrix[i][j] = matrix[i][j] * n.matrix[i][j];
        }
      }
    }
    return newMatrix;
  }

  
  Matrix transpose() {  //return a matrix which is the transpose of this matrix
    Matrix n = new Matrix(cols, rows);
    for (int i=0; i < rows; i++) {
      for (int j=0; j < cols; j++) {
        n.matrix[j][i] = matrix[i][j];
      }
    }
    return n;
  }

  
  Matrix singleColumnMatrixFromArray(float[] arr) {  //Creates a single column array from the parameter array
    Matrix n = new Matrix(arr.length, 1);
    for (int i=0; i < arr.length; i++) {
      n.matrix[i][0] = arr[i];
    }
    return n;
  }
  
  
  void fromArray(float[] arr) {  //sets this matrix from an array
    for (int i=0; i < rows; i++) {
      for (int j=0; j < cols; j++) {
        matrix[i][j] = arr[j+i*cols];
      }
    }
  }
  
  
  float[] toArray() {  //returns an array which represents this matrix
    float[] arr = new float[rows*cols];
    for (int i=0; i < rows; i++) {
      for (int j=0; j < cols; j++) {
        arr[j+i*cols] = matrix[i][j];
      }
    }
    return arr;
  }


  Matrix addBias() {  //for ix1 matrixes adds one to the bottom
    Matrix n = new Matrix(rows+1, 1);
    for (int i=0; i < rows; i++) {
      n.matrix[i][0] = matrix[i][0];
    }
    n.matrix[rows][0] = 1;
    return n;
  }

  
  Matrix activate() {  //applies the activation function(sigmoid) to each element of the matrix
    Matrix n = new Matrix(rows, cols);
    for (int i=0; i < rows; i++) {
      for (int j=0; j < cols; j++) {
        n.matrix[i][j] = sigmoid(matrix[i][j]);
      }
    }
    return n;
  }
  
  
  float sigmoid(float x) {  //sigmoid activation function
    float y = 1 / (1 + pow((float)Math.E, -x));
    return y;
  }
  
  
  Matrix sigmoidDerived() {  //returns the matrix that is the derived sigmoid function of the current matrix
    Matrix n = new Matrix(rows, cols);
    for (int i =0; i<rows; i++) {
      for (int j = 0; j<cols; j++) {
        n.matrix[i][j] = (matrix[i][j] * (1- matrix[i][j]));
      }
    }
    return n;
  }


  Matrix removeBottomLayer() {  //returns the matrix which is this matrix with the bottom layer removed
    Matrix n = new Matrix(rows-1, cols);      
    for (int i=0; i < n.rows; i++) {
      for (int j=0; j < cols; j++) {
        n.matrix[i][j] = matrix[i][j];
      }
    }
    return n;
  }

  
  void mutate(float mutationRate) {  //Mutation function for genetic algorithm 
    for (int i=0; i < rows; i++) {  //for each element in the matrix
      for (int j=0; j < cols; j++) {
        float rand = random(1);
        if (rand < mutationRate) {  //if chosen to be mutated
          matrix[i][j] += randomGaussian()/5;  //add a random value to it(can be negative)
          if (matrix[i][j] > 1) {  //set the boundaries to 1 and -1
            matrix[i][j] = 1;
          }
          if (matrix[i][j] < -1) {
            matrix[i][j] = -1;
          }
        }
      }
    }
  }

  
  Matrix crossover(Matrix partner) {  //returns a matrix which has a random number of vaules from this matrix and the rest from the parameter matrix
    Matrix child = new Matrix(rows, cols);
    int randC = floor(random(cols));  //pick a random point in the matrix
    int randR = floor(random(rows));
    for (int i =0; i<rows; i++) {
      for (int j = 0; j<cols; j++) {
        if ((i< randR)|| (i==randR && j<=randC)) {  //if before the random point then copy from this matric
          child.matrix[i][j] = matrix[i][j];
        } else {  //if after the random point then copy from the parameter array
          child.matrix[i][j] = partner.matrix[i][j];
        }
      }
    }
    return child;
  }

  
  Matrix clone() {  //return a copy of this matrix
    Matrix clone = new  Matrix(rows, cols);
    for (int i =0; i<rows; i++) {
      for (int j = 0; j<cols; j++) {
        clone.matrix[i][j] = matrix[i][j];
      }
    }
    return clone;
  }
}
