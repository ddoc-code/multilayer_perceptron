classdef Layer

    properties
        number_of_nodes
        nodes
    end

    methods
        function obj = Layer(number_of_nodes)
            obj.number_of_nodes = number_of_nodes;
        end
    end
end