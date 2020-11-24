function [error_bycol, error_matrix, max_error_bycol] = error_analysis_onebyone(U,V)

figure();
subplot(2,1,1);plot(U(2:end-1,:),'.-b'),hold on;
plot(V(2:end-1,:),'-.g'),xlabel U;

error_matrix = U(2:end-1,:)-V(2:end-1,:);
%figure(),plot(error_matrix),xlabel N,ylabel T;

error_bycol = max(abs(error_matrix));
subplot(2,1,2),plot(error_bycol),xlabel T,ylabel error_bycol;

max_error_bycol = max(error_bycol);

[N,~]=size(U);

end