function L2error=error_analysis_L2error(U,V)
N=size(U);N=N(1)-2;
L2error=sqrt(1/N*sum((U(2:end-1,end)-V(2:end-1,end)).^2));

end