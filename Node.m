classdef Node < Unit

    properties
        activation
        bias
        error
    end

    methods
        function obj = Node(name,activation, bias)
            obj@Unit(name);
            obj.activation = activation;
            obj.bias = bias;
            obj.value = 0;
        end
    end
end