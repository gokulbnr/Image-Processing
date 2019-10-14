function res=bl(inp)
    inp=fftshift(fft2(rgb2gray(imread(inp))));
    [a,b]=size(inp);
    m=zeros(a,b);
    c=5;
    for i=1:a
        for j=1:b
            d=(i-a/2)^2+(j-b/2)^2;
            m(i,j)=1/(1+(d/c)^2);
        end
    end
    res=m.*inp;
    res=uint8(abs(ifft2(ifftshift(res))));
    imshow(res);
end