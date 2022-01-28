classdef Unit < handle

    properties
        name
        value
    end

    methods
        function obj = Unit(name)
            obj.name = name;
        end
    end
end