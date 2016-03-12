
%% train_choose_lambda: function description
function [cost] = train_choose_lambda(lambda, input_layer_size, ...
	hidden_layer_size, num_labels, X, Y, X_cv, Y_cv)
	
Times_of_tianing = 50;


%% ================ Part 1: Initializing Pameters ================
%  In this part of the exercise, you will be starting to implment a two
%  l
ayer neural network that classifies digits. You will start by
%  implementing a function to initialize the weights of the neural network
%  (randInitializeWeights.m)

fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];



%% =================== Part 2: Training NN ===================
%  You have now implemented all the code necessary to train a neural 
%  network. To train your neural network, we will now use "fmincg", which
%  is a function which works similarly to "fminunc". Recall that these
%  advanced optimizers are able to train our cost functions efficiently as
%  long as we provide them with the gradient computations.
%
fprintf('\nTraining Neural Network... \n')
n = 0;

options = optimset('MaxIter', Times_of_tianing);

%  You should also try different values of lambda

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, Y, lambda);
[nn_params, cost_X, n] = fmincg(costFunction, initial_nn_params, options);
% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)

% Obtain Theta1 and Theta2 back from nn_params

[cost g] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size,...
	num_labels, X_cv, Y_cv, 0);


