function rgb = get_rgb_bands(im)
%GET_RGB_BANDS 提取RGB波段
%   此处显示详细说明
    t = size(im);
    if numel(t) == 3
        if t(3) >= 7  %7 bands remote sensing image
            r = im(:,:,5);
            g = im(:,:,3);
            b = im(:,:,2);
            rgb = cat(3, r,g,b);
        elseif t(3) == 4
            r = im(:,:,3);
            g = im(:,:,2);
            b = im(:,:,1);
            rgb = cat(3, r,g,b);
        elseif t(3) == 3
            rgb = im;
        end
    end
end

