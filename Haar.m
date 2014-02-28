function H = Haar(n)
% Computes the n x n normalized Haar Wavelet Transformation.

if n == 2
    H = 1 / sqrt(2) * [1 1; 1 -1];
else
    H = 1 / sqrt(2) * [kron(Haar(n / 2), [1 1]); kron(eye(n / 2), [1 -1])];
end
end