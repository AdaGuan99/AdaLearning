function [U_Denergy,V_Denergy]=error_analysis_Denergy(U,V)
N=size(U);N=N(1)-2;

U_Denergy=1/N*sum(U(2:end-1,end).^2);
V_Denergy=1/N*sum(V(2:end-1,end).^2);

end