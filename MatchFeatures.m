clear all
load feature_matching_1

width = 2; % Width of the window (also width of the kernel).
radius = 11;
feature_number = 50;
I = X_1;

C = ForstnerHarris(I, width);
Index = NMSSubsample(C, radius, feature_number);

figure(1);
imshow(I);
hold on
plot(Index(:, 2)', Index(:, 1)', 'ro');
hold off