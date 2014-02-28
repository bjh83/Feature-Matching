clear all
close all

width = 4; % Width of the window (also width of the kernel).
radius = 11;
feature_number = 200;

load feature_matching_1
I_1 = X_1;
C_1 = ForstnerHarris(I_1, width);
Index_1 = NMSSubsample(C_1, radius, feature_number);
LookupTable_1 = MOPS(I_1, Index_1);

figure(1);
imshow(I_1);
hold on
plot(Index_1(:, 2)', Index_1(:, 1)', 'ro');
hold off

load feature_matching_2
I_2 = X_2;
C_2 = ForstnerHarris(I_2, width);
Index_2 = NMSSubsample(C_2, radius, feature_number);
LookupTable_2 = MOPS(I_2, Index_2);

figure(2);
imshow(I_2);
hold on
plot(Index_2(:, 2)', Index_2(:, 1)', 'ro');
hold off