function LookupTable = MOPS(I, Index)
% The multi-scale oriented patches (MOPS) algorithm described by Brown,
% Szeliski, and Winder.

H = Haar(8);
b = 10;
LookupTable = zeros(b, b, b, 2);
for n = 1 : size(Index, 1);
    i = Index(n, 1);
    j = Index(n, 2);
    
    d = I((i - 3) : (i + 4), (j - 3) : (j + 4));
    m = sum(sum(d)) / 8^2;
    v = sqrt(sum(sum((d - m).^2)) / 8^2);
    d = (d - m) / v;
    d = H*d*H';
    c_1 = max(min(round(d(2, 1) + 5), 10), 1);
    c_2 = max(min(round(d(1, 2) + 5), 10), 1);
    c_3 = max(min(round(d(2, 2) + 5), 10), 1);
    LookupTable(c_1, c_2, c_3, 1) = i;
    LookupTable(c_1, c_2, c_3, 2) = j;
end