
%% Initialization
clear ; close all; clc
Training_Data = '.\datas\datas.mat';
load(Training_Data);


lambda = [0.05 0.1 0.2 0.4 0.8 1 1.5 2]
cost = zeros(size(lambda, 2), 1);
%%All the parametrers can all be adjust.
input_layer_size  = 784;  % 20x20 Input Images of Digits  
hidden_layer_size = 50;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

m = size(lambda);
for i = 1:m,
	cost(i) = train_choose_lambda(lambda(i), input_layer_size, hidden_layer_size, ...
		num_labels, X, Y, X_cv, Y_cv);
end;

plot(1:m, cost);