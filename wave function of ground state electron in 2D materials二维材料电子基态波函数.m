   clear all
clc
N=100 ;
t=1;
k=1;

H=zeros(N^2);
for n=1:1:N
    for m=1:1:N
        if (n==1)&&(m==1)
            H(1,2)=-t;
            H(1,N+1)=-t;
        elseif (n==1)&&((1<m)&&(m<N))
            for nn=n:1:n+1
                for mm=m-1:1:m+1
                    if (nn==n)&&(mm==m-1)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n)&&(mm==m+1)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n+1)&&(mm==m)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    end
                end
            end
        elseif ((1<n)&&(n<N))&&(m==1)
            for nn=n-1:1:n+1
                for mm=m:1:m+1
                    if (nn==n)&&(mm==m+1)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n-1)&&(mm==m)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n+1)&&(mm==m)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    end
                end
            end
        elseif (n==N)&&((1<m)&&(m<N))
            for nn=n-1:1:n
                for mm=m-1:1:m+1
                    if (nn==n)&&(mm==m-1)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n)&&(mm==m+1)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n-1)&&(mm==m)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    end
                end
            end
        elseif ((1<n)&&(n<N))&&(m==N)
            for nn=n-1:1:n+1
                for mm=m-1:1:m
                    if (nn==n)&&(mm==m-1)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n-1)&&(mm==m)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n+1)&&(mm==m)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    end
                end
            end
        elseif (n==1)&&(m==N)
            for nn=n:1:n+1
                for mm=m-1:1:m
                    if (nn==n)&&(mm==m-1)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n+1)&&(mm==m)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    end
                end
            end
        elseif (n==N)&&(m==1)
            for nn=n-1:1:n
                for mm=m:1:m+1
                    if (nn==n)&&(mm==m-1)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n)&&(mm==m+1)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n-1)&&(mm==m)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n+1)&&(mm==m)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    end
                end
            end
        elseif (n==N)&&(m==N)
            H(N^2,N^2-1)=-t;
            H(N^2,N^2-N)=-t;
        else
            for nn=n-1:1:n+1
                for mm=m-1:1:m+1
                    if (nn==n)&&(mm==m-1)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n)&&(mm==m+1)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n-1)&&(mm==m)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    elseif (nn==n+1)&&(mm==m)
                      H(N*(n-1)+m,N*(nn-1)+mm)=-t;
                    end
                end
            end
        end
    end
end
[R,D]=eig(H);
R=R';
wv=R(k,:);
w=zeros(N);
for nnn=1:1:N
    for mmm=1:1:N
        w(nnn,mmm)=wv(N*(nnn-1)+mmm);
    end
end
x=1/N:1/N:1;
y=x;
[X,Y]=meshgrid(x,y);
mesh(X,Y,w)








