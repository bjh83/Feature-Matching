function Index = NMSSubsample(C, suppression_radius, feature_number)
% Performs a Non-Maximal Suppression based subsampling of the input C,
% a corner score matrix.

C_new = zeros(size(C));

for n = 1 : feature_number
    [Maxs, I_Index] = max(C);
    [c_max, j] = max(Maxs);
    i = I_Index(j);
    C(max(1, (i - suppression_radius)) : min(size(C, 1), (i + suppression_radius)), max(1, (j - suppression_radius)) : min(size(C, 2), (j + suppression_radius))) = 0;
    C_new(i, j) = c_max;
end

[I_Index, J_Index] = find(C_new > 0);
Index = [I_Index, J_Index];
end