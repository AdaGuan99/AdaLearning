function [V,U] = IVP_1D_fd(lambda,N,T,k,scheme)
% input
%   lambda=dt/dx
%   N dx=X/N
%   T t\in[0,T]
%   k f(x)=sin(kx)
%   scheme=1,2,3

% output
%   V,U numerica sol&real sol on the grids

% initial parameter
dx=2*pi/N;
dt=abs(lambda*dx);
NT=ceil(T/dt);
U=zeros(N+2,NT+1);V=zeros(N+2,NT+1);
f=@(x)sin(k*x);
u=@(x,t)f(x+t);

% iteration
x=0+dx*(-1:N)';
t=0+dt*(0:NT)';
V(:,1)=f(x);
if scheme==1
    A = diag(ones(1,N+2)) + diag(repmat(-lambda/2,1,N+1),-1) + diag(repmat(lambda/2,1,N+1),1);
end
if scheme==2
    A = diag(repmat(-lambda/2+1/2,1,N+1),-1) + diag(repmat(lambda/2+1/2,1,N+1),1);
end
if scheme==3
    A = diag(repmat(1-lambda,1,N+2)) + diag(repmat(lambda,1,N+1),1);
end

for i=1:NT
    V(:,i+1)=A*V(:,i);
    V(1,i+1)=V(end-1,i+1);V(end,i+1)=V(2,i+1);
end

for i=1:NT+1
    tt=(i-1)*dt;
    for j=-1:1:N
        xx=j*dx;
        U(j+2,i)=u(xx,tt);
    end
end

end