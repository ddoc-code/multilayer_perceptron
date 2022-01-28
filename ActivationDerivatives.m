function [output] = ActivationDerivatives(inputNode)

% function to return the correct derivative for each activation function

x = inputNode.value;
activation = inputNode.activation;

switch activation
    case "sigmoid"
        output = x * (1-x);

    case "linear"
        output = 1;

    case "summation"
        output = 1;

    case "tanh"
        output = 1 - x.^2;

    case "relu"
        if x < 0
            output = 0;
        else
            output = 1;
        end
end

end