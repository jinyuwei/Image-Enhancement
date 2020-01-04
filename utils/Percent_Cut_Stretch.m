function res = Percent_Cut_Stretch(im, r, varargin)
    im    = convert_im_type(im);

    if numel(size(im)) == 3
        im = get_rgb_bands(im);
        for i = 1:size(im, 3)
            I     = im(:,:,i);
            [y,x] = imhist(I, 255);
            [x1, x2] = get_x1_x2(im, r, x,y);
            I(I>=x2) = 1;
            I(I<=x1) = 0;
            scale = 1/(x2-x1);
            I(I>x1 & I<x2) = scale*(I(I>x1 & I<x2)-x1);
            im(:,:,i) = I;
        end
    else
        I = im;
        [y,x] = imhist(I, 255);
        [x1, x2] = get_x1_x2(im, r, x,y);
        I(I>=x2) = 1;
        I(I<=x1) = 0;
        scale = 1/(x2-x1);
        I(I>x1 & I<x2) = scale*(I(I>x1 & I<x2)-x1);
        im(:,:,i) = I; 
    end
    
    if nargin == 3
        im = im.^varargin{1};
    end
    
    res = im;
end



