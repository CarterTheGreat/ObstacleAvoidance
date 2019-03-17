public class Layer {

    double[][] weights;
 
    public Layer(int numberOfNeurons, int numberOfInputsPerNeuron) {
        weights = new double[numberOfInputsPerNeuron][numberOfNeurons];

        for (int i = 0; i < numberOfInputsPerNeuron; ++i) {
            for (int j = 0; j < numberOfNeurons; ++j) {    
                weights[i][j] = (2 * Math.random()) - 1; // shift the range from 0-1 to -1 to 1
            }
        }        
    }

    public void adjustWeights(double[][] adjustment) {
        this.weights = NNUtil.matrixAdd(weights, adjustment);
    }

    @Override
    public String toString() {
        return NNUtil.matrixToString(weights);
    }
}
