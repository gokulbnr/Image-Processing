function res=nf(inp)
    in=rgb2gray(imread(inp));
    inp=fftshift(fft2(rgb2gray(imread(inp))));
    ab=abs(inp);
    ab=log(ab+1);
    [a,b]=size(ab);
    m=ones(a,b);
    for i=1:a
        for j=1:b
            d=(i-a/2)^2+(j-b/2)^2;
            if d>1000 && ab(i,j)>1
                m(i,j)=0;
            end
        end
    end
    res=m.*inp;
    ab2=abs(res);
    ab2=log(ab2+1);
    res=real(ifft2(ifftshift(res)));
    res=uint8(res);
    figure,imshow(ab,[]);
    figure,imshow(ab2,[]);
    figure,imshow(res);
end