function res=nearest(inp)
    t=3;
    inp=imread(inp);
    in=inp;
    for i=1:t
    si=size(inp);
    res=zeros(si);
        for k=2:2*si(1)
            for l=2:2*si(2)
                res(k,l)=inp(floor(k/2),floor(l/2));
            end
        end
    inp=res;
    end
    subplot(1,2,1);
    imshow(in);
    subplot(1,2,2);
    imshow(uint8(res));
end