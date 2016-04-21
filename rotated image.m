I=imread('PeanutRotated-B.jpg');
G=rgb2gray(I);
imshow(G)
[M N]=size(G);
%c1=[0.84 0.5 125]';
%hc2=[-0.5 0.9 50]';
c1=[1.69 0.9687 -250.0119]';
c2=[-0.6126 1.0477 57.8553]';
for i=1:M
    for j=1:N
        io=round([i j 1]*c1);
        jo=round([i j 1]*c2);
        if jo>0 && io>0
            newG(io,jo)=G(i,j);
        end
    end
end
figure
imshow(newG,[])
newG=newG(1:250,1:307);
figure
imshow(newG,[])
    
for i=1:(250-2)
for j=1:(307-2)
Mat=newG(i:(i+2),j:(j+2));
newimg(i,j)=max(max(Mat));
end
end
figure
imshow(newimg)
