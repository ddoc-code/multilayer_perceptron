classdef Input < Unit

    properties
        inputs
    end

    methods
        function obj = Input(name, inputs)
            obj@Unit(name);
            obj.inputs = inputs;
        end
    end
end