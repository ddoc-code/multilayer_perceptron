classdef InputLayer < Layer

    properties
    end

    methods
        function obj = InputLayer(number_of_nodes)
            obj@Layer(number_of_nodes);
            obj.nodes = Input.empty;
        end
    end
end