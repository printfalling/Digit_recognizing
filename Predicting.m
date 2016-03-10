
%% Initialization
clear ; close all; clc
Load_Theta = '.\datas\Theta_784.mat';
Training_Data = '.\datas\datas.mat';
lambda = 1;
%% Setup the parameters you will use for this exercise

input_layer_size  = 784;  % 20x20 Input Images of Digits
hidden_layer_size = 10;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset. 
%  You will be working with a dataset that contains handwritten digits.
%

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')
load(Load_Theta);
load(Training_Data);
m = size(X_cv, 1);

% Randomly select 100 data points to display
sel = randperm(size(X_cv, 1));
sel = sel(1:100);

displayData(X_cv(sel, :));

fprintf('Program paused. Press enter to continue.\n');
pause;



%% ================= Part 2: Visualize Weights =================
%  You can now "visualize" what the neural network is learning by 
%  displaying the hidden units to see what features they are capturing in 
%  the data.

fprintf('\nVisualizing Neural Network... \n')

displayData(Theta1(:, 2:end));

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% ================= Part 3: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

pred = predict(Theta1, Theta2, X_cv);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == Y_cv)) * 100);

fprintf('Program paused. Press enter to continue.\n');
pause;

%  To give you an idea of the network's output, you can also run
%  through the examples one at the a time to see what it is predicting.

%  Randomly permute examples
rp = randperm(m);

for i = 1:m
    % Display 
    fprintf('\nDisplaying Example Image\n');
    displayData(X_cv(rp(i), :));

    pred = predict(Theta1, Theta2, X_cv(rp(i),:));
    fprintf('\nNeural Network Prediction: %d (digit %d) \n', pred, mod(pred, 10));
    
    % Pause
    fprintf('Program paused. Press enter to continue.\n');
    pause;
end