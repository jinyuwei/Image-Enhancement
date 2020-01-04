function res = HistEqua_Stretch(im, varargin)
%HISTEQUA_STRETCH ֱ��ͼ���⻯
%   �˴���ʾ��ϸ˵��
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
    
    %����Ҷ�ֱ��ͼ�е���ֵ��ÿ���Ҷȼ���Ӧ��������Ŀ��
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
    end   %�ۻ��ֲ���������Ӧ��Ҳ�����ص���Ŀ��


    for i=1:256
        s(i)=floor(255*s(i)/(height*width));
    end   % s(i)/(height*width) ΪƵ�ʣ�
    
    I_HE=I_gray;
    for i=1:height
       for j=1:width
           I_HE(i,j)= s(I_gray(i,j)+1);
        end
    end%�õ����⻯���ͼ��s(1)~s(256)�����ֵ��Ϊ�Ҷ�ֵ��1~256��Ŷ�Ӧ����ԭʼ�Ҷ�ͼ���0~255�ĻҶ�ֵ��

    m=zeros(1,256);
    for i=1:height
       for j=1:width
           m(I_HE(i,j)+1)= m(I_HE(i,j)+1)+1;
        end
    end  %����ֱ��ͼ�е���ֵ��ÿ���Ҷȼ���Ӧ��������Ŀ��
    
    res = double(I_HE)/255;
end

