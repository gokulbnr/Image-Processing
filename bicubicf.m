function res=bicubicf(inp)
    n=2;
    inp=imread(inp);
    in=inp;
    for i=1:n
        op=zeros(size(inp));
        for j=4:2*size(inp,1)-4
            for k=4:2*size(inp,2)-4
                a=floor(j/2);
                b=floor(k/2);
                s=inp(a-1:a+2,b-1:b+2);
                if mod(j,2)+mod(k,2)==0
                    op(j,k)=inp(a,b);
                elseif mod(j,2)+mod(k,2)==2
                    op(j,k)=calc(s,0.5,0.5);
                elseif mod(j,2)==1
                    op(j,k)=calc(s,0.5,0);
                else
                    op(j,k)=calc(s,0,0.5);
                end
            end
        end
        inp=op;
    end
    res=op;
    subplot(1,2,1);
    imshow(in);
    subplot(1,2,2);
    imshow(uint8(res));
end