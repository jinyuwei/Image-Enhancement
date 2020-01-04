function res = Linear_Stretch(im, r, varargin)
%% ÏßÐÔÀ­Éý
    im = convert_im_type(im);
  
    if numel(size(im)) == 3
        im = get_rgb_bands(im);
        for i = 1:size(im, 3)
            I = im(:,:,i);
            [y,x] = imhist(I, 255);
            [x1, x2] = get_x1_x2(im, r, x,y);
            I(I>=x2) = 1;
            I(I<=x1) = 0;
            I(I>x1 & I<x2) = (I(I>x1 & I<x2) - x1)/(x2-x1);
            im(:,:,i) = I;
        end
    else
        I = im;
        [y,x] = imhist(I, 255);
        [x1, x2] = get_x1_x2(im, r, x,y);
        I(I>=x2) = 1;
        I(I<=x1) = 0;
        I(I>x1 & I<x2) = (I(I>x1 & I<x2) - x1)/(x2-x1);
        im = I;
    end

    if nargin == 3
        im = im.^varargin{1};
    end
    
    res = im;
end

