classdef HiddenLayer < Layer

    properties
    end

    methods
        function obj = HiddenLayer(number_of_nodes)
            obj@Layer(number_of_nodes);
            obj.nodes = Node.empty;
        end
    end
end