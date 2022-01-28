function [output] = ActivationFunctions(inputNode)

% function to return the correct activation function

x = inputNode.value;
activation = inputNode.activation;

switch activation
    case "sigmoid"
        e = exp(1);
        output = (1 / (1 + e.^(-1*x)));

    case "linear"
        output = x;

    case "summation"
        output = x;

    case "tanh"
        output = (exp(x) - exp(-x)) / (exp(x) + exp(-x));

    case "relu"
        if x < 0
            output = 0;
        else
            output = x;
        end
end

end