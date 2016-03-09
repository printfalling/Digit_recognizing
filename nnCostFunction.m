function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));  	
Theta2_grad = zeros(size(Theta2));		

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

a1 = [ones(m, 1) X];
a2 = zeros(m, size(Theta1, 1));
a3 = zeros(m, size(Theta2, 1));
z2 = a1 * Theta1';
a2 = [ones(size(a2, 1), 1) sigmoid(z2) ];
z3 = a2 * Theta2';
a3 = sigmoid(z3);  
temp_y = zeros(size(y, 1), size(Theta2, 1)); 
for i = 1:size(y, 1),
	if y(i) == 0,
		temp_y(i, 10) = 1;
	else
		temp_y(i, y(i)) = 1;  	% temp_y is a 5000 * 10 matric
	end
	% disp(temp_y(i, :));
	% disp(temp_y(i+1, :));
	% disp(i);
	% disp(temp_y(i, 10));
	% pause;
end	

sum_theta1 = ones(size(Theta1, 2), 1);
sum_theta2 = ones(size(Theta2, 2), 1);
sum_theta1(1, 1) = 0;
sum_theta2(1, 1) = 0;						
J = - 1/m * sum(sum((temp_y .* log(a3) + (1 - temp_y) .* log(1 - a3))))  + lambda/(2*m) *(sum(Theta2.^2 * sum_theta2) + sum(Theta1.^2 * sum_theta1));
							%Theta1 is a 25 * 401 matric   Theta2 is a 10 * 26 matric


delta3 = zeros(size(Theta2, 1), 1);
delta2 = zeros(size(Theta1, 1), 1);
Delta2 = zeros(size(Theta2));
Delta1 = zeros(size(Theta1));
for i = 1:m,								%a3 is a 5000 * 10 matric
	delta3 = (a3(i, :) - temp_y(i, :))';			%delta3 is a 10 * 1 vector
	delta2 = Theta2' * delta3 .* [0; sigmoidGradient(z2(i, :)')]; % Theta2 is a 10 * 26 matric 
						% z2 is a 5000 * 25 matricx		delta2 is a 26 * 1 vector
	delta2 = delta2(2:end);					% delta2 is a 25 * 1 vector

	Delta2 = Delta2 + delta3 * a2(i, :);  	% a2 is a 5000 * 26 matric 		Delta1 is a 10 * 26 matric
	Delta1 = Delta1 + delta2 * a1(i, :);	% a1 is a 5000 * 401 matric     Delta2 is a 25 * 401 matric 

Theta1_grad = 1/m * Delta1 + lambda / m * [zeros(size(Theta1, 1), 1) ones(size(Theta1, 1), size(Theta1, 2) - 1)] .* Theta1;
Theta2_grad = 1/m * Delta2 + lambda / m * [zeros(size(Theta2, 1), 1) ones(size(Theta2, 1), size(Theta2, 2) - 1)] .* Theta2;










% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
