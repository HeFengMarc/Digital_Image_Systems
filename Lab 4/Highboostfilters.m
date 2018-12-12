function [z,D] = Highboostfilters(f,cut_off,boost)

[M,N] = size(f);
F = fft2(f);
u = 0:M-1;
v = 0:N-1;
index_x = find(u > M/2);
u(index_x) = u(index_x)-M;
index_y = find(v > N/2);
v(index_y) = v(index_y)-N;
[V,U]=meshgrid(v,u);
%Computing distance from point (u,v) to center of frequency rectangle
D=sqrt(U.^2+V.^2);

H = double(D <= cut_off);
H1 = 1-H; 
%  Using high boost filter transfer function  
H2 = (boost-1)+H1; 
G = H2.*F;
z = ifft2(double(G));
z((z>255))=255;

end

