classdef OutputLayer < Layer

    properties
    end

    methods
        function obj = OutputLayer(number_of_nodes)
            obj@Layer(number_of_nodes);
            obj.nodes = Node.empty;
        end
    end
end