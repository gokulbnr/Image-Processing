function res=lf(inp)
    in=rgb2gray(imread(inp));
    inp=fftshift(fft2(rgb2gray(imread(inp))));
    [a,b]=size(inp);
    m=zeros(a,b);
    c=12.5;
    for i=1:a
        for j=1:b
            m(i,j)=-(i-a/2)^2-(j-b/2)^2;
        end
    end
    m=m/max(max(m));
    res=m.*inp;
    res=real(ifft2(ifftshift(res)));
    res=res/max(max(res));
    res=uint8(res*255);
    res=res+in;
    imshow(res);
end