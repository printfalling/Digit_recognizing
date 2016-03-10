count = 1;
count_cv = 1;
count_test = 1;
X = zeros(60, 784);
Y = zeros(6000, 1);
X_cv = zeros(2000, 784);
Y_cv = zeros(2000, 784);
X_test = zeros(2000, 784);
Y_test = zeros(2000, 784);
%%load data0
fi = fopen('data0', 'r');
for i = 1:600,
	[t1 N] = fread(fi, 784, 'uchar');
	X(count, :) = t1';
	Y(count) = 0;
	count = count + 1;
end;
for i = 1:200,
	[t1_cv N] = fread(fi, 784, 'uchar');
	X_cv(count, :) = t1_cv';
	Y_cv(count) = 0;
	count_cv = count_cv + 1;
end;
for i = 1:200,
	[t1_test N] = fread(fi, 784, 'uchar');
	X_test(count, :) = t1_test';
	Y_test(count) = 0;
	count_test = count_test + 1;
end;
fclose(fi);

%% Load data1
fi = fopen('data1', 'r');
for i = 1:600,
	[t1 N] = fread(fi, 784, 'uchar');
	X(count, :) = t1';
	Y(count) = 1;
	count = count + 1;
end;
for i = 1:200,
	[t1_cv N] = fread(fi, 784, 'uchar');
	X_cv(count, :) = t1_cv';
	Y_cv(count) = 1;
	count_cv = count_cv + 1;
end;
for i = 1:200,
	[t1_test N] = fread(fi, 784, 'uchar');
	X_test(count, :) = t1_test';
	Y_test(count) = 1;
	count_test = count_test + 1;
end;
fclose(fi);

% Load data2
fi = fopen('data2', 'r');
for i = 1:600,
	[t1 N] = fread(fi, 784, 'uchar');
	X(count, :) = t1';
	Y(count) = 2;
	count = count + 1;
end;
for i = 1:200,
	[t1_cv N] = fread(fi, 784, 'uchar');
	X_cv(count, :) = t1_cv';
	Y_cv(count) = 2;
	count_cv = count_cv + 1;
end;
for i = 1:200,
	[t1_test N] = fread(fi, 784, 'uchar');
	X_test(count, :) = t1_test';
	Y_test(count) = 2;
	count_test = count_test + 1;
end;
fclose(fi);

% Load data3
fi = fopen('data3', 'r');
for i = 1:600,
	[t1 N] = fread(fi, 784, 'uchar');
	X(count, :) = t1';
	Y(count) = 3;
	count = count + 1;
end;
for i = 1:200,
	[t1_cv N] = fread(fi, 784, 'uchar');
	X_cv(count, :) = t1_cv';
	Y_cv(count) = 3;
	count_cv = count_cv + 1;
end;
for i = 1:200,
	[t1_test N] = fread(fi, 784, 'uchar');
	X_test(count, :) = t1_test';
	Y_test(count) = 3;
	count_test = count_test + 1;
end;
fclose(fi);

% Load data4
fi = fopen('data4', 'r');
for i = 1:600,
	[t1 N] = fread(fi, 784, 'uchar');
	X(count, :) = t1';
	Y(count) = 4;
	count = count + 1;
end;
for i = 1:200,
	[t1_cv N] = fread(fi, 784, 'uchar');
	X_cv(count, :) = t1_cv';
	Y_cv(count) = 4;
	count_cv = count_cv + 1;
end;
for i = 1:200,
	[t1_test N] = fread(fi, 784, 'uchar');
	X_test(count, :) = t1_test';
	Y_test(count) = 4;
	count_test = count_test + 1;
end;
fclose(fi);

% Load data5
fi = fopen('data5', 'r');
for i = 1:600,
	[t1 N] = fread(fi, 784, 'uchar');
	X(count, :) = t1';
	Y(count) = 5;
	count = count + 1;
end;
for i = 1:200,
	[t1_cv N] = fread(fi, 784, 'uchar');
	X_cv(count, :) = t1_cv';
	Y_cv(count) = 5;
	count_cv = count_cv + 1;
end;
for i = 1:200,
	[t1_test N] = fread(fi, 784, 'uchar');
	X_test(count, :) = t1_test';
	Y_test(count) = 5;
	count_test = count_test + 1;
end;
fclose(fi);

% Load data6
fi = fopen('data6', 'r');
for i = 1:600,
	[t1 N] = fread(fi, 784, 'uchar');
	X(count, :) = t1';
	Y(count) = 6;
	count = count + 1;
end;
for i = 1:200,
	[t1_cv N] = fread(fi, 784, 'uchar');
	X_cv(count, :) = t1_cv';
	Y_cv(count) = 6;
	count_cv = count_cv + 1;
end;
for i = 1:205,
	[t1_test N] = fread(fi, 784, 'uchar');
	X_test(count, :) = t1_test';
	Y_test(count) = 6;
	count_test = count_test + 1;
end;
fclose(fi);

% Load data7
fi = fopen('data7', 'r');
for i = 1:600,
	[t1 N] = fread(fi, 784, 'uchar');
	X(count, :) = t1';
	Y(count) = 7;
	count = count + 1;
end;
for i = 1:200,
	[t1_cv N] = fread(fi, 784, 'uchar');
	X_cv(count, :) = t1_cv';
	Y_cv(count) = 7;
	count_cv = count_cv + 1;
end;
for i = 1:260,
	[t1_test N] = fread(fi, 784, 'uchar');
	X_test(count, :) = t1_test';
	Y_test(count) = 7;
	count_test = count_test + 1;
end;
fclose(fi);

% Load data8
fi = fopen('data8', 'r');
for i = 1:600,
	[t1 N] = fread(fi, 784, 'uchar');
	X(count, :) = t1';
	Y(count) = 8;
	count = count + 1;
end;
for i = 1:200,
	[t1_cv N] = fread(fi, 784, 'uchar');
	X_cv(count, :) = t1_cv';
	Y_cv(count) = 8;
	count_cv = count_cv + 1;
end;
for i = 1:200,
	[t1_test N] = fread(fi, 784, 'uchar');
	X_test(count, :) = t1_test';
	Y_test(count) = 8;
	count_test = count_test + 1;
end;
fclose(fi);

% Load data9
fi = fopen('data9', 'r');
for i = 1:600,
	[t1 N] = fread(fi, 784, 'uchar');
	X(count, :) = t1';
	Y(count) = 9;
	count_cv = count_cv + 1;
end;
for i = 1:200,
	[t1_cv N] = fread(fi, 784, 'uchar');
	X_cv(count, :) = t1_cv';
	Y_cv(count) = 9;
	count = count + 1;
end;
for i = 1:200,
	[t1_test N] = fread(fi, 784, 'uchar');
	X_test(count, :) = t1_test';
	Y_test(count) = 9;
	count_test = count_test + 1;
end;
fclose(fi);

save('Data_base.mat', 'X', 'Y', 'X_cv', 'Y_cv', 'X_test', 'Y_test');