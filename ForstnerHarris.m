function C = ForstnerHarris(I, width)
% Performs the Forster-Harris feature detection algorithm on the input
% image I with a width window, width, and returns a corner score matrix, C.

alpha = 0.06;

% Compute the derivatives of I.
[I_x, I_y] = gradient(I);

I_xx = I_x.^2;
I_yy = I_y.^2;
I_xy = I_x .* I_y;

G = fspecial('Gaussian', [width * 2 + 1, width * 2 + 1]);

% A linear combination of the eigenvalues of the auto-correlation
% at a given point representing the 'corner score'.
C = zeros(size(I));

for i = (1 + width) : (size(I, 1) - width)
    for j = (1 + width) : (size(I, 2) - width)
        P_xx = I_xx((i - width) : (i + width), (j - width) : (j + width));
        P_yy = I_yy((i - width) : (i + width), (j - width) : (j + width));
        P_xy = I_xy((i - width) : (i + width), (j - width) : (j + width));
        
        % The auto-correlation matrix.
        A = [sum(sum(G .* P_xx)) sum(sum(G .* P_xy)); 
            sum(sum(G .* P_xy)) sum(sum(G .* P_yy))];
        
        % This represents 'corner score' basically if both the eigenvalues
        % are large then this is a good feature point. The following
        % computation is the same as:
        % lambda_0 * lambda_1 - alpha(lambda_0 + lambda_1)^2
        C(i, j) = det(A) - alpha * trace(A)^2;
    end
end
end