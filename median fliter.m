X=imread('LennaDeltaNoise.jpg');
a=3;
b=3;
k=floor(a*b/2)+1;
[M,N]=size(X);
uint8 Y=zeros(M,N);
window=zeros(a,b);
temp=zeros(a*b);
 
for i=1:M-a
    for j=1:N-b
        window=X(i:i+a,j:j+b);
        temp=window(:);
        tempSort=sort(temp);
        Y(i,j)=tempSort(k);
    end;
end;
imshow(Y);
