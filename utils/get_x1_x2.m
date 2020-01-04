function [x1, x2] = get_x1_x2(im, r, x,y)
    temp = 0;
    N = size(im,1)*size(im,2);
    for j = 1:length(y)
        temp = temp + y(j);
        if temp/N <= r
            x1 = x(j);
        end
        if temp/N >= (1-r)
            x2 = x(j);
            break;
        end
    end
end

