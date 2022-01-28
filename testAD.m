% test activation derivatives

testNode = Node("test", "relu", 0);
testNode.value = -30000;

testNode.value = ActivationFunctions(testNode);
out = ActivationDerivatives(testNode);
disp("out: " + out);

% sigmoid works
% linear works
% summation works
% tanh works
% relu works