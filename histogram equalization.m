Img=imread('white_house256.jpg');
imshow(Img)
title('original image')
[M,N]=size(Img);
n=zeros(1,256);
for k=0:255
    for i=1:M
        for j=1:N
            if Img(i,j)==k
                n(k+1)=n(k+1)+1;
            end
        end
    end
end
p=n./(M*N);
plot(0:255,p,'.')
title('The normalized histogram of original image')
 
s(1)=255*p(1);
for i=2:256
s(i)=255*p(i)+s(i-1);
end
sr=round(s);
Img_s=zeros(M,N);
for i=1:M
    for j=1:N
        Img_s(i,j)=sr(Img(i,j)+1);
    end
end
Img_s_8=uint8(Img_s);
imshow(Img_s_8)
ns=zeros(1,256);
for k=0:255
    for i=1:M
        for j=1:N
            if Img_s(i,j)==k
                ns(k+1)=ns(k+1)+1;
            end
        end
    end
end
ps=ns./(M*N);
plot(0:255,ps,'.')
title('The normalized histogram of the processed image')    


