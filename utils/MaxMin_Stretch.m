function res = MaxMin_Stretch(im, min_v, max_v, varargin )
%MAXMIN_STRETCH 最值拉伸
%   此处显示详细说明
    im = convert_im_type(im);

    if numel(size(im)) == 3
        im = get_rgb_bands(im);
        for i = 1:size(im, 3)
            I = im(:,:,i);
     
            x1 = min_v;
            x2 = max_v;
            
            I(I>=x2) = 1;
            I(I<=x1) = 0;
            scale = 1/(x2-x1);
            I(I>x1 & I<x2) = scale*(I(I>x1 & I<x2)-x1);
            im(:,:,i) = I;
        end
    else
        I = im;
        
        x1 = min_v;
        x2 = max_v;

        I(I>=x2) = 1;
        I(I<=x1) = 0;
        scale = 1/(x2-x1);
        I(I>x1 & I<x2) = scale*(I(I>x1 & I<x2)-x1);
        im(:,:,i) = I;
    end
    
    if nargin == 4
        im = im.^varargin{1};
    end
    
    res = im;

end

