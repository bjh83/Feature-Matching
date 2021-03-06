% clear all
% close all
% GenerateDescriptors
% pause;

pc = [];
H = Haar(8);
for c_1 = 1 : 10
    for c_2 = 1 : 10
        for c_3 = 1 : 10
            for n = 1 : 20
                i_1 = LookupTable_1(c_1, c_2, c_3, n, 1);
                j_1 = LookupTable_1(c_1, c_2, c_3, n, 2);
                if i_1 ~= 0 && LookupTable_2(c_1, c_2, c_3, 1, 1) ~= 0
                    d_1 = I_1((i_1 - 3) : (i_1 + 4), (j_1 - 3) : (j_1 + 4));
                    m = sum(sum(d_1)) / 8^2;
                    v = sqrt(sum(sum((d_1 - m).^2)) / 8^2);
                    d_1 = (d_1 - m) / v;
                    d_1 = H*d_1*H';
                    dist = zeros(1, 20) + inf;
                    for k = 1 : 20
                        i_2 = LookupTable_2(c_1, c_2, c_3, k, 1);
                        j_2 = LookupTable_2(c_1, c_2, c_3, k, 2);
                        if i_2 ~= 0
                            d_2 = I_2((i_2 - 3) : (i_2 + 4), (j_2 - 3) : (j_2 + 4));
                            m = sum(sum(d_2)) / 8^2;
                            v = sqrt(sum(sum((d_2 - m).^2)) / 8^2);
                            d_2 = (d_2 - m) / v;
                            d_2 = H*d_2*H';
                            dist(k) = sum(sum(abs(d_1 - d_2)));
                        end
                    end
                    [~, k] = min(dist);
                    i_2 = LookupTable_1(c_1, c_2, c_3, k, 1);
                    j_2 = LookupTable_1(c_1, c_2, c_3, k, 2);
                    pc = [pc; i_1, j_1, i_2, j_2];
                end
            end
        end
    end
end

for n = 1 : 8 : size(pc, 1)
    figure(1);
    imshow(I_1);
    hold on
    figure(2);
    imshow(I_2);
    hold on
    for m = n : min(n + 8, size(pc, 1))
        switch m - n + 1
            case 1
                figure(1);
                plot(pc(m, 2), pc(m, 1), 'bo');
                figure(2);
                plot(pc(m, 4), pc(m, 3), 'bo');
            case 2
                figure(1);
                plot(pc(m, 2), pc(m, 1), 'go');
                figure(2);
                plot(pc(m, 4), pc(m, 3), 'go');
            case 3
                figure(1);
                plot(pc(m, 2), pc(m, 1), 'ro');
                figure(2);
                plot(pc(m, 4), pc(m, 3), 'ro');
            case 4
                figure(1);
                plot(pc(m, 2), pc(m, 1), 'co');
                figure(2);
                plot(pc(m, 4), pc(m, 3), 'co');
            case 5
                figure(1);
                plot(pc(m, 2), pc(m, 1), 'mo');
                figure(2);
                plot(pc(m, 4), pc(m, 3), 'mo');
            case 6
                figure(1);
                plot(pc(m, 2), pc(m, 1), 'yo');
                figure(2);
                plot(pc(m, 4), pc(m, 3), 'yo');
            case 7
                figure(1);
                plot(pc(m, 2), pc(m, 1), 'ko');
                figure(2);
                plot(pc(m, 4), pc(m, 3), 'ko');
            case 8
                figure(1);
                plot(pc(m, 2), pc(m, 1), 'wo');
                figure(2);
                plot(pc(m, 4), pc(m, 3), 'wo');
        end
    end
    pause;
    figure(1);
    hold off
    figure(2);
    hold off
end