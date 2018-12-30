function h = mywav(wname)
% h = [-0.0106
%     0.0329
%     0.0308
%     -0.1870
%     -0.0280
%     0.6309
%     0.7148
%     0.2304];

YPAT = imread('pattern.jpg');
YPAT = rgb2gray(YPAT);
YPAT = double(YPAT);
%YPAT = YPAT/255;

%[PSI,XVAL,NC] = pat2cwav(YPAT,METHOD,POLDEGREE,REGULARITY)
[psi,xval,nc] = pat2cwav(YPAT, 'polynomial',6, 'continuous');
h = nc*psi;

% verify the defined wavelet
% XPAT = linspace(0,1,length(YPAT));
% plot(XPAT,YPAT,'-',xval,nc*psi,'--'); title('Original Pattern and Adapted Wavelet (dashed line)');
% 
% dx = xval(2)-xval(1);
% Mu = sum(psi*dx);
% L2norm = sum(abs(psi).^2*dx);
% fprintf('psi integration: %f\n',Mu);
% fprintf('psi L2 norm: %f\n',L2norm);
% fprintf('You can check that psi satisfies the definition of a wavelet by noting that \nit integrates to zero and that its L2 norm is equal to 1.\n');
end