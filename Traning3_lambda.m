
%% Initialization
clear ; close all; clc
Training_Data = '.\datas\datas.mat';
%Save_Theta = '.\datas\Theta_784_3.mat';
%%Times_of_tianing = 100;
lambda = 1;

%%All the parametrers can all be adjust.
input_layer_size  = 784;  % 20x20 Input Images of Digits  
hidden_layer_size = 100;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

% %% =========== Part 1: Loading and Visualizing Data =============
% %  We start the exercise by first loading and visualizing the dataset. 
% %  You will be working with a dataset that contains handwritten digits.
% %


% % Load Training Data
 fprintf('Loading and Visualizing Data ...\n')

 load(Training_Data);
 m = size(X, 1);

% % Randomly select 100 data points to display
% sel = randperm(size(X, 1));
% sel = sel(1:100);

% displayData(X(sel, :));

% fprintf('Program paused. Press enter to continue.\n');
% pause;



%% ================ Part 2: Initializing Pameters ================
%  In this part of the exercise, you will be starting to implment a two
%  layer neural network that classifies digits. You will start by
%  implementing a function to initialize the weights of the neural network
%  (randInitializeWeights.m)

fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


%% =============== Part 3: Implement Backpropagation ===============
%  Once your cost matches up with ours, you should proceed to implement the
%  backpropagation algorithm for the neural network. You should add to the
%  code you've written in nnCostFunction.m to return the partial
%  derivatives of the parameters.
%
fprintf('\nChecking Backpropagation... \n');

%  Check gradients by running checkNNGradients
%checkNNGradients;

fprintf('\nProgram paused. Press enter to continue.\n');
% pause;

%% =================== Part 4: Training NN ===================
%  You have now implemented all the code necessary to train a neural 
%  network. To train your neural network, we will now use "fmincg", which
%  is a function which works similarly to "fminunc". Recall that these
%  advanced optimizers are able to train our cost functions efficiently as
%  long as we provide them with the gradient computations.
%
cost_train = zeros(100, 1);
cost_cv = zeros(100, 1);
for i = 1:100;
	fprintf('\nTraining Neural Network... \n')
	n = 0;

	options = optimset('MaxIter', 1);

	%  You should also try different values of lambda

	% Create "short hand" for the cost function to be minimized
	costFunction = @(p) nnCostFunction(p, ...
	                                   input_layer_size, ...
	                                   hidden_layer_size, ...
	                                   num_labels, X, Y, lambda);

	% Now, costFunction is a function that takes in only one argument (the
	% neural network parameters)
	[nn_params, cost, n] = fmincg(costFunction, initial_nn_params, options);
	plot(cost, 1:n);
	% Obtain Theta1 and Theta2 back from nn_params
	% Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
	%                  hidden_layer_size, (input_layer_size + 1));

	% Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
	%                  num_labels, (hidden_layer_size + 1));
	initial_nn_params = nn_params;
	cost_cv(i) = nnCostFunction(nn_params, input_layer_size, hidden_layer_size,...
							  num_labels, X_cv, Y_cv, 0)
	cost_train(i) = nnCostFunction(nn_params, input_layer_size, hidden_layer_size,...
							  num_labels, X, Y, 0)
	%fprintf('Program paused. Press enter to continue.\n');
	%pause;
end
plot(1:100, cost_cv);
hold on;
plot(1:100, cost_train);
%% =========== Part 5: Visualize Weights and Save Theta ===============
%  You can now "visualize" what the neural network is learning by 
%  displaying the hidden units to see what features they are capturing in 
%  the data.

% fprintf('\nVisualizing Neural Network... \n')

% displayData(Theta1(:, 2:end));

% fprintf('\nProgram paused. Press enter to continue.\n');
% %pause;

% save(Save_Theta);
