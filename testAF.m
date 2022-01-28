% test activation functions

testNode = Node("test", "relu", 0);
testNode.value = -1000;

out = ActivationFunctions(testNode);
disp("out: " + out);

% sigmoid works
% linear works
% summation works
% tanh works
% relu works