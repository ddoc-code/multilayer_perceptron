% DEFINE THE NETWORK HERE

% Add your layers here
input_layer = InputLayer(2);
hidden_layer = HiddenLayer(3);
output_layer = OutputLayer(1);

% Add nodes to hidden and output layers here
hidden_layer.nodes(end+1) = Node("Sig1", "sigmoid", 0);
hidden_layer.nodes(end+1) = Node("Sig2", "sigmoid", 0);
hidden_layer.nodes(end+1) = Node("Sig3", "sigmoid", 0);

output_layer.nodes(end+1) = Node("Sum", "summation", 0);

% Add input nodes to input layer here - array contains inputs for
% each training example
input_layer.nodes(end+1) = Input("x1", [1,0]);
input_layer.nodes(end+1) = Input("x2", [0,1]);

% Add expected outputs here - array contains outputs for each training example
out = [1, 1];

% Set the learning rate (eta) here
learning_rate = 1;

% Add your connections here
all_connections = Connection.empty;

all_connections(end+1) = Connection("w1", 0.2, "x1", "Sig1");
all_connections(end+1) = Connection("w2", 0.15, "x1", "Sum");
all_connections(end+1) = Connection("w3", 0.3, "x1", "Sig2");

all_connections(end+1) = Connection("w4", -0.15, "x2", "Sig2");
all_connections(end+1) = Connection("w5", -0.1, "x2", "Sum");
all_connections(end+1) = Connection("w6", 0.25, "x2", "Sig3");

all_connections(end+1) = Connection("w7", -0.15, "Sig3", "Sum");
all_connections(end+1) = Connection("w8", 0.2, "Sig2", "Sum");
all_connections(end+1) = Connection("w9", -0.1, "Sig1", "Sum");

% Add a for loop for each layer to connect the connections
% add connections to input layer
for i = 1:length(input_layer.nodes)
    currentNode = input_layer.nodes(i);
    for j = 1:length(all_connections)
        currentConnection = all_connections(j);
        currentConnection.connect(currentNode);
    end
end

% add connections to hidden layer
for i = 1:length(hidden_layer.nodes)
    currentNode = hidden_layer.nodes(i);
    for j = 1:length(all_connections)
        currentConnection = all_connections(j);
        currentConnection.connect(currentNode);
    end
end

% add connections to output layer
for i = 1:length(output_layer.nodes)
    currentNode = output_layer.nodes(i);
    for j = 1:length(all_connections)
        currentConnection = all_connections(j);
        currentConnection.connect(currentNode);
    end
end