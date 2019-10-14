function res=bilinearf(inp)
    t=3;
    inp=imread(inp);
    in=inp;
    for i=1:t
        si=size(inp);
        res=zeros(si);
        for j=2:2*si(1)-2
            for k=2:2*si(2)-2
                a=floor(j/2);
                b=floor(k/2);
                res(j,k)=sum(inp(a:a+1,b))/4+sum(inp(a,b:b+1))/4;
            end
        end
        inp=res;
    end
    subplot(1,2,1);
    imshow(in);
    subplot(1,2,2);
    imshow(uint8(res));
end