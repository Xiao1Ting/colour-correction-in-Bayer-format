I=imread('white_house256.jpg');
[m n]=size(I);
figure(1):imshow(I),title('origin-image');
 
H(1:256)=0;
for i=1:m
    for j=1:n
        H(I(i,j)+1)=H(I(i,j)+1)+1;
    end
end
figure(2):plot(H,'.'),title('origin-histogram');
 
I=double(I);
w=15;
for i=1:m-w+1
    for j=1:n-w+1
        H(1:256)=0;
        for ii=0:w-1
            for jj=0:w-1
                H(I(i+ii,j+jj)+1)=H(I(i+ii,j+jj)+1)+1;
            end
        end
        T(1:256)=0;
        T(1)=H(1)*255/w^2;
        for ii=2:256
            T(ii)=T(ii-1)+H(ii)*255/w^2;
        end
        for ii=0:w-1
            for jj=0:w-1
                Inew(i+ii,j+jj)=round(T(I(i+ii,j+jj)+1));
            end
        end
    end
end
 
figure(3):imshow(uint8(Inew)),title('new-image');
 
H(1:256)=0;
for i=1:m
    for j=1:n
        H(Inew(i,j)+1)=H(Inew(i,j)+1)+1;
    end
end
figure(4):plot(H,'.'),title('new-histogram');


