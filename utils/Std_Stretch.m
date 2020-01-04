function  res = Std_Stretch( im, r, varargin )
%STD_STRETCH 标准差拉伸
%   此处显示详细说明
    im = convert_im_type(im);

    if numel(size(im)) == 3
        im = get_rgb_bands(im);
        for i = 1:size(im, 3)
            I = im(:,:,i);
            st = std(I(:));
            m  = mean(I(:));
            
            x1 = m - r*st;
            x2 = m + r*st;
            
            I(I>=x2) = 1;
            I(I<=x1) = 0;
            scale = 1/(x2-x1);
            I(I>x1 & I<x2) = scale*(I(I>x1 & I<x2)-x1);
            im(:,:,i) = I;
        end
    else
        I = im;
        st = std(I(:));
        m  = mean(I(:));

        x1 = m - r*st;
        x2 = m + r*st;

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

