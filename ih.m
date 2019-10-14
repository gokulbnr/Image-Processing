function res=ih(inp)
    inp=fftshift(fft2(rgb2gray(imread(inp))));
    [a,b]=size(inp);
    m=zeros(a,b);
    c=7.5;
    for i=1:a
        for j=1:b
            ch=(i-a/2)^2+(j-b/2)^2;
            if ch<=c
                m(i,j)=1;
            end
        end
    end
    m=1-m;
    res=m.*inp;
    res=uint8(ifft2(ifftshift(res)));
    imshow(res);
end