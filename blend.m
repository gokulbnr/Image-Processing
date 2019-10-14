function res=blend(inp1,inp2,mask)
    img1=inp1;
    img2=inp2;
    imgm=mask;
    inp1=double(imread(inp1));
    inp2=double(imread(inp2));
    mask=im2double(imread(mask));

    si=size(mask);
    n=7;
    op=cell(n+1,1);
    
    pair1=pyrs(inp1,n,7,2);
    li1=pair1{2};
    pair2=pyrs(inp2,n,7,2);
    li2=pair2{2};
    pairm=pyrs(mask,n,17,6);
    gm=pairm{1};
    
    for i=n:-1:0
        a=double(li1{i+1,1});
        b=double(li2{i+1,1});
        c=double(gm{i+1,1});
        d=1-c;
        op{i+1,1}=a.*c+b.*d;
    end
    for i=n:-1:1
        a=double(op{i+1,1});
        si=size(op{i,1});
        a=imresize(a,[si(1),si(2)]);
        b=double(op{i,1});
        op{i,1}=a+b;
    end
    res=uint8(op{1,1});
    imshow(res);
end
