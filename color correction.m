% a)
a=imread('rawimage.bmp');
% b)
figure(1),imshow(a);
xlabel('i'),ylabel('j'),title('rawimage')
% d)
[M,N]=size(a);
b=zeros(M/2,N/2,4);


 b(:,:,1)=a(1:2:M,1:2:N); % Blue pixel
 b(:,:,2)=a(2:2:M,2:2:N); % Red pixel
 b(:,:,3)=a(1:2:M,2:2:N); % Green pixel on blue rows
 b(:,:,4)=a(2:2:M,1:2:N); % Green pixel on red rows

b1=uint8(b(:,:,1));
figure(2),imshow(b1);
xlabel('i'),ylabel('j'),title('blue pixel')

b2=uint8(b(:,:,2));
figure(3),imshow(b2);
xlabel('i'),ylabel('j'),title('red pixel')

b3=uint8(b(:,:,3));
figure(4),imshow(b3)
xlabel('i'),ylabel('j'),title('green pixel on blue rows')

b4=uint8(b(:,:,4));
figure(5),imshow(b4)
xlabel('i'),ylabel('j'),title('green pixel on red rows')
% f)
n=zeros(M,N,3);

for i=1:1:M
    for j=1:1:N
        if((mod(i,2)==1) && (mod(j,2)==1))    %odd rows and odd columns are blue pixels
             n(i,j,3)=a(i,j);
             n(i+1,j,3)=a(i,j);
             n(i,j+1,3)=a(i,j);
             n(i+1,j+1,3)=a(i,j);
        else if((mod(i,2)==0) && (mod(j,2)==0)) %even rows and even columns are red pixels
             n(i,j,1)=a(i,j);
             n(i-1,j,1)=a(i,j);
             n(i,j-1,1)=a(i,j);
             n(i-1,j-1,1)=a(i,j);
            else                                %green pixels
           n(i,j,2)=a(i,j);
           n(i,j+1,2)=a(i,j);
            end
        end
    end
end
n=uint8(n);
figure(6),imshow(n);
xlabel('i'),ylabel('j'),title('full color image')

% i)
l=zeros(M,N,3);
a=double(a);

for i=2:1:M-1
    for j=2:1:N-1
        if((mod(i,2)==1) && (mod(j,2)==1))    %odd rows and odd columns are blue pixels
             l(i,j,3)=a(i,j);
             l(i,j,1)=(a(i-1,j-1)+a(i-1,j+1)+a(i+1,j-1)+a(i+1,j+1))/4;  %missing red on blue
             l(i,j,2)=(a(i,j+1)+a(i,j-1)+a(i-1,j)+a(i+1,j))/4;          %missing green on blue
             
        else if((mod(i,2)==0) && (mod(j,2)==0))   %even rows and even columns are red pixels
             l(i,j,1)=a(i,j);
             l(i,j,2)=(a(i,j+1)+a(i,j-1)+a(i-1,j)+a(i+1,j))/4;     %missing green on red
             l(i,j,3)=(a(i-1,j-1)+a(i-1,j+1)+a(i+1,j-1)+a(i+1,j+1))/4;   %missing blue on red
             
        else if((mod(i,2)==0) && (mod(j,2)==1))   %even rows and odd columns are green pixels on red rows
           l(i,j,2)=a(i,j);
           l(i,j,1)=(a(i,j-1)+a(i,j+1))/2;        %missing red on green
           l(i,j,3)=(a(i-1,j)+a(i+1,j))/2;        %missing blue on green
        else if((mod(i,2)==1) && (mod(j,2)==0))   %odd rows and even columns are green pixels on blue rows
           l(i,j,2)=a(i,j);
           l(i,j,3)=(a(i,j-1)+a(i,j+1))/2;        %missing blue on green
           l(i,j,1)=(a(i-1,j)+a(i+1,j))/2;        %missing red on green
            end
            end
            end
        end
    end
end
l=uint8(l);
figure(7),imshow(l);
xlabel('i'),ylabel('j'),title('full color image')

% l)
g=zeros(M,N,3);
a=double(a);

for i=3:1:M-2
    for j=3:1:N-2
        if((mod(i,2)==1) && (mod(j,2)==1))    %odd rows and odd columns are blue pixels
            
             g(i,j,3)=a(i,j);   %blue
             g(i,j,1)=(1/8)*(2*a(i+1,j+1)+2*a(i+1,j-1)+2*a(i-1,j-1)+2*a(i-1,j+1))+(1/8)*((-3/2)*(a(i,j+2)+a(i-2,j)+a(i+2,j)+a(i,j-2))+6*a(i,j));
             %missing red on blue
             g(i,j,2)=(1/8)*2*(a(i,j-1)+a(i,j+1)+a(i-1,j)+a(i+1,j))+(1/8)*(4*a(i,j)-a(i-2,j)-a(i+2,j)-a(i,j-2)-a(i,j+2));
             %missing green on blue
        else if((mod(i,2)==0) && (mod(j,2)==0))  %even rows and even columns are red pixels
             g(i,j,1)=a(i,j);  %red
             g(i,j,2)=(1/8)*2*(a(i,j-1)+a(i,j+1)+a(i-1,j)+a(i+1,j))+(1/8)*(4*a(i,j)-a(i-2,j)-a(i+2,j)-a(i,j-2)-a(i,j+2));
             %missing green on red
             g(1,j,3)=(1/8)*(2*a(i+1,j+1)+2*a(i+1,j-1)+2*a(i-1,j-1)+2*a(i-1,j+1))+(1/8)*((-3/2)*(a(i,j+2)+a(i-2,j)+a(i+2,j)+a(i,j-2))+6*a(i,j));
             %missing blue on red
       else if((mod(i,2)==1) && (mod(j,2)==0))  %odd rows and even columns are green pixels on blue rows
            g(i,j,2)=a(i,j);  %green
            g(i,j,1)=(1/8)*4*(a(i-1,j)+a(i+1,j))+(1/8)*((1/2)*(a(i,j-2)+a(i,j+2))-a(i-1,j-1)-a(i-2,j)-a(i+2,j)-a(i+1,j+1)-a(i-1,j+1)-a(i+1,j-1)+5*a(i,j));
            %missing red on green
            g(i,j,3)=(1/8)*4*(a(i,j-1)+a(i,j+1))+(1/8)*(5*a(i,j)+(1/2)*(a(i+2,j)+a(i-2,j))-a(i,j+2)-a(i,j-2)-a(i+1,j+1)-a(i+1,j-1)-a(i-1,j+1)-a(i-1,i-1));
            %missing blue on green
       else if((mod(i,2)==0) && (mod(j,2)==1))  %even rows and odd columns are green pixels on red pixels
            g(i,j,2)=a(i,j);  %green
            g(i,j,3)=(1/8)*4*(a(i-1,j)+a(i+1,j))+(1/8)*((1/2)*(a(i,j-2)+a(i,j+2))-a(i-1,j-1)-a(i-2,j)-a(i+2,j)-a(i+1,j+1)-a(i-1,j+1)-a(i+1,j-1)+5*a(i,j));
            %missing blue on green
            g(i,j,1)=(1/8)*4*(a(i,j-1)+a(i,j+1))+(1/8)*(5*a(i,j)+(1/2)*(a(i+2,j)+a(i-2,j))-a(i,j+2)-a(i,j-2)-a(i+1,j+1)-a(i+1,j-1)-a(i-1,j+1)-a(i-1,i-1));
            %missing red on green
            end
            end
            end
        end
    end
end
g=uint8(g);
figure(8),imshow(g);
xlabel('i'),ylabel('j'),title('full color image')


  
  
  
  
  
  
  
  
