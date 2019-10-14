function res=pyrs(inp,n,s,sig)
    
    %Gaussian Matrix
    gmat=zeros(s,s);
    for j=1:s
        for k=1:s
            m=(s+1)/2;
            gmat(j,k)=exp(-1*(((j-m)*(j-m))/(2*sig*sig)+((k-m)*(k-m))/(2*sig*sig)));
        end
    end
    gmat=gmat/sum(sum(gmat));

    %Guassian Pyramid
    fin1=cell(n+1,1);
    fin1{1,1}=inp;
    for i=1:n
        op=uint8(imfilter(inp,gmat));
        fin1{i+1,1}=op(1:2:end,1:2:end,:);
        inp=fin1{i+1,1};
    end
%      figure,
%      for i=1:n+1
%          subplot(n+1,1,i);
%          imshow(fin1{i,:});
%      end
    
    %Laplacian Pyramid
    fin2=cell(n+1,1);
    fin2{n+1,1}=fin1{n+1,1};
    for i=n:-1:1
        op=fin1{i+1,1};
        si=size(fin1{i,1});
        op=imresize(op,[si(1),si(2)]);
        op=double(fin1{i,1})-double(op);
        fin2{i,1}=op;
    end
%      figure,
%      for i=1:n+1
%          subplot(n+1,1,i);
%          imshow(fin2{i,:});
%      end
    
    res={fin1,fin2};
end