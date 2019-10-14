function ret=calc(p,a,b)
    mat=zeros(4);
    mat(1)=inter(p(1,:),b);
    mat(2)=inter(p(2,:),b);
    mat(3)=inter(p(3,:),b);
    mat(4)=inter(p(4,:),b);
    ret=inter(mat,a);
end