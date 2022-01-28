% Neural Networks CW1 Part B

% call Network script to build the network
% please see this file to define your network
Network;

% Enter the number of iterations to run for - this must match the number of
% inputs and outputs defined in Network!!!
iterations = 2;

%% 1.a) & 1.b) Calculations to process the first & second training examples

% this loop processes each iteration (training example)
for h = 1:iterations
    disp(" ")
    disp("ITERATION " + h);

    % set input values for the current iteration
    for i = 1:length(input_layer.nodes)
        currentNode = input_layer.nodes(i); % select each input from this layer

        currentNode.value = currentNode.inputs(h); % set the input value for this iteration
    end
    
    %% 1.a.i) & 1.b.i) Compute the ouputs from each network node during the forward pass

    % calculate hidden layer outputs
    for i = 1:length(hidden_layer.nodes)
        currentNode = hidden_layer.nodes(i); % select each node from this layer

        currentNode.value = currentNode.bias; % set the value to the bias

        % iterate through incoming connections
        for j = 1:length(all_connections)
            currentConnection = all_connections(j);
    
            if currentConnection.end_node == currentNode
                % add the start node value * the weight
                currentNode.value = currentNode.value + (currentConnection.start_node.value * currentConnection.weight);
            end
        end
        
        currentNode.value = ActivationFunctions(currentNode); % apply activation function
        disp(currentNode.name + " output: " + currentNode.value); % print output of the current node
    end
    
    % calculate output layer outputs
    for i = 1:length(output_layer.nodes)
        currentNode = output_layer.nodes(i); % select each node from this layer

        currentNode.value = currentNode.bias; % set the value to the bias

        % iterate through incoming connections
        for j = 1:length(all_connections)
            currentConnection = all_connections(j);
    
            if currentConnection.end_node == currentNode
                % add the start node value * the weight
                currentNode.value = currentNode.value + (currentConnection.start_node.value * currentConnection.weight);
            end
        end
        currentNode.value = ActivationFunctions(currentNode); % apply activation function
        disp(currentNode.name + " output: " + currentNode.value); % print output of the current node
    end
    
    disp(" ");
    
    %% 1.a.ii) & 1.b.ii) Compute the errors (betas) at each network node during the backward pass

    % calculate errors (betas) for output layer nodes
    for i = 1:length(output_layer.nodes)
        currentNode = output_layer.nodes(i); % select each node from this layer
    
        derivative = ActivationDerivatives(currentNode); % get the derivative for this activation function
        currentNode.error = derivative * (out(h) - currentNode.value); % multiply derivative by (expected output - actual output)
        disp(currentNode.name + " error: " + currentNode.error);
    end
    
    % calculate errors (betas) for hidden layer nodes
    for i = 1:length(hidden_layer.nodes)
        currentNode = hidden_layer.nodes(i); % select each node from this layer
        
        derivative = ActivationDerivatives(currentNode); % get the derivative for this activation function
    
        % iterate through subsequent connections for currentNode
        store = 1;
        for j = 1:length(all_connections)
            currentConnection = all_connections(j);
    
            % iterate through incoming connections and multiply by (end
            % node error * weight) for each one
            if currentConnection.start_node == currentNode
                store = store * (currentConnection.end_node.error * currentConnection.weight);
            end
        end
   
        currentNode.error = derivative * store; % multiply derivative by stored value
        disp(currentNode.name + " error: " + currentNode.error);
    end
    
    disp(" ");
    
    %% 1.a.iii) & 1.b.iii) Compute the weight changes (deltas) and weight updates

    % calculate differences (deltas) for all weights
    for i = 1:length(all_connections)
        beta = all_connections(i).end_node.error; % beta = error of the end node
        val = all_connections(i).start_node.value; % val = value of the start node
        all_connections(i).change_in_weight = learning_rate * beta * val; % delta = eta * beta * val
        disp(all_connections(i).name + " difference: " + all_connections(i).change_in_weight);
    end
    
    disp(" ");
    
    % calculate new weights for all weights
    for i = 1:length(all_connections)
        new_weight = all_connections(i).weight + all_connections(i).change_in_weight; % w = w + Delta w
        all_connections(i).weight = round(new_weight, 4); % round to 4 decimal places
        disp(all_connections(i).name + " new weight: " + all_connections(i).weight);
    end
end

disp(" ");
disp("All weight updates match those from Part A!"); % Comparison of weight updates from part A