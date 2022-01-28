classdef Connection < handle

    properties
        name
        weight
        start_node
        end_node
        start_node_name
        end_node_name
        change_in_weight
    end

    methods
        function obj = Connection(name, weight, start_node_name, end_node_name)
            obj.name = name;
            obj.weight = weight;
            obj.start_node_name = start_node_name;
            obj.end_node_name = end_node_name;
        end

        function connect(obj,inputNode)
            if strcmp(inputNode.name, obj.start_node_name)
                obj.start_node = inputNode;
            end
            if strcmp(inputNode.name, obj.end_node_name)
                obj.end_node = inputNode;
            end
        end
    end
end