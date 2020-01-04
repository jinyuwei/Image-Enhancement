function res = HistEqua_Stretch(im, varargin)
%HISTEQUA_STRETCH 直方图均衡化
%   此处显示详细说明
    im = convert_im_type(im);

    if numel(size(im)) == 3
        im = get_rgb_bands(im);
        for i = 1:size(im, 3)
            I = im(:,:,i);
            im(:,:,i) = sub_prorcess(I);
        end
    else
        im = sub_prorcess(im);
    end
    
    if nargin == 2
        im = im.^varargin{im};
    end
    
    res = im;
end

function res = sub_prorcess(I)
    I = im2uint8(I);
    I_gray = I;

    [height,width]=size(I_gray);
    
    %计算灰度直方图中的数值：每个灰度级对应的像素数目。
    r=zeros(1,256);
    for i=1:height
       for j=1:width
           r(I_gray(i,j)+1)= r(I_gray(i,j)+1)+1;
        end
    end  
    
    s=zeros(1,256);
    s(1)=r(1);
    for i=2:256
        s(i)=s(i-1)+r(i);
    end   %累积分布函数：对应的也是像素的数目。


    for i=1:256
        s(i)=floor(255*s(i)/(height*width));
    end   % s(i)/(height*width) 为频率，
    
    I_HE=I_gray;
    for i=1:height
       for j=1:width
           I_HE(i,j)= s(I_gray(i,j)+1);
        end
    end%得到均衡化后的图像。s(1)~s(256)里的数值即为灰度值，1~256标号对应的是原始灰度图像的0~255的灰度值。

    m=zeros(1,256);
    for i=1:height
       for j=1:width
           m(I_HE(i,j)+1)= m(I_HE(i,j)+1)+1;
        end
    end  %计算直方图中的数值：每个灰度级对应的像素数目。
    
    res = double(I_HE)/255;
end

