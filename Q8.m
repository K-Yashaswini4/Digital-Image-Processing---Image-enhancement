% inputting the images
LC1 = imread('LC1.png');
LC2 = imread('LC2.jpg');
global_eq_LC1 = histeq(LC1);
global_eq_LC2 = histeq(LC2);



% Applying local histogram equalization for two images
local_eq_LC1_7x7 = adapthisteq(LC1, 'NumTiles', [7 7], 'ClipLimit', 0.01);
local_eq_LC1_31x31 = adapthisteq(LC1, 'NumTiles', [31 31], 'ClipLimit', 0.01);
local_eq_LC1_51x51 = adapthisteq(LC1, 'NumTiles', [51 51], 'ClipLimit', 0.01);
local_eq_LC1_71x71 = adapthisteq(LC1, 'NumTiles', [71 71], 'ClipLimit', 0.01);


local_eq_LC2_7x7 = adapthisteq(LC2, 'NumTiles', [7 7], 'ClipLimit', 0.01);
local_eq_LC2_31x31 = adapthisteq(LC2, 'NumTiles', [31 31], 'ClipLimit', 0.01);
local_eq_LC2_51x51 = adapthisteq(LC2, 'NumTiles', [51 51], 'ClipLimit', 0.01);
local_eq_LC2_71x71 = adapthisteq(LC2, 'NumTiles', [71 71], 'ClipLimit', 0.01);
% Displaying results 
figure;
subplot(2,4,1), imshow(LC1), title('Original LC1');
subplot(2,4,2), imshow(global_eq_LC1), title('Global Equalization LC1');
subplot(2,4,3), imshow(local_eq_LC1_7x7), title('Local 7x7 LC1');
subplot(2,4,4), imshow(local_eq_LC1_31x31), title('Local 31x31 LC1');
subplot(2,4,5), imshow(local_eq_LC1_51x51), title('Local 51x51 LC1');
subplot(2,4,6), imshow(local_eq_LC1_71x71), title('Local 71x71 LC1');


figure;
subplot(2,4,1), imshow(LC2), title('Original LC2');
subplot(2,4,2), imshow(global_eq_LC2), title('Global Equalization LC2');
subplot(2,4,3), imshow(local_eq_LC2_7x7), title('Local 7x7 LC2');
subplot(2,4,4), imshow(local_eq_LC2_31x31), title('Local 31x31 LC2');
subplot(2,4,5), imshow(local_eq_LC2_51x51), title('Local 51x51 LC2');
subplot(2,4,6), imshow(local_eq_LC2_71x71), title('Local 71x71 LC2');
