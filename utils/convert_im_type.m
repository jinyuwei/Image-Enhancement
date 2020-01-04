function im = convert_im_type(im)
    if isa(im, 'uint8')
        im = double(im)/255;
    elseif isa(im, 'uint16')
        im = im2uint8(mat2gray(im));
        im = double(im)/255;
    elseif isa(im, 'double')
        im = im;
    else
        error('The type of input image is wrong!');
    end
end