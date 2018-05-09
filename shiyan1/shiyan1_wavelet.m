%haar小波
figure(1)
i=20;
wav = 'haar';
[phi,g1,xval] = wavefun(wav,i);
subplot(1,2,1);
plot(xval,g1,'-r','LineWidth',1.5);
grid on;
xlabel('t')
title('haar 时域');
g2=fft(g1);
g3=abs(g2);
subplot(1,2,2);plot(g3);
grid on;
xlabel('f');
title('haar 频域');

%db4小波
figure(2)
i=10;
wname = 'db4';
[phi,g1,xval] = wavefun(wname,i);
subplot(1,2,1);
plot(xval,g1,'-r','LineWidth',1.5);
grid on;
xlabel('t')
title('db4 时域');
g2=fft(g1);
g3=abs(g2);
subplot(1,2,2);plot(g3,'LineWidth',1.5);
grid on;
xlabel('f');
title('db4 频域');

%mexihat
figure(3)
d=-6;
h=6;
n=100;
[g1,x]=mexihat(d,h,n);
%subplot(2,2,1);plot(x,g1,'-r','LineWidth',1.5);
subplot(1,2,1);plot(x,g1,'-r');
grid on;
xlabel('t')
title('mexihat 时域 ');
g2=fft(g1);
g3=(abs(g2));
subplot(1,2,2);plot(g3);
grid on;
xlabel('f')
title('mexihat 频域');

%morlet
figure(4)
d=-6;
h=6;
n=100;
[g1,x]=morlet(d,h,n);
subplot(1,2,1);plot(x,g1,'-r','LineWidth',1.5);
grid on;
xlabel('t')
title('Morlet 时域 ');
g2=fft(g1);
g3=abs(g2);
subplot(1,2,2);plot(g3);
grid on;
xlabel('f')
title('Morlet 频域 ')

%meyer
figure(5)
d = -6;
h = 6;
n = 128;
[psi,x] = meyer(d,h,n,'psi');
subplot(2,1,1), plot(x,psi,'-r','LineWidth',1.5);
grid on;
xlabel('t')
title('Meyer 时域 ');
PSI=fft(psi);
PSII=abs(PSI);
subplot(2,1,2), plot(PSII);
grid on;
xlabel('f')
title('meyer 频域 ');

%sym6
figure(6)
i=10;
wname = 'sym6';
[phi,g1,xval] = wavefun(wname,i);
subplot(1,2,1);
plot(xval,g1,'-r','LineWidth',1.5);
grid on;
xlabel('t')
title('sym6 时域');
g2=fft(g1);
g3=abs(g2);
subplot(1,2,2);plot(g3,'LineWidth',1.5);
grid on;
xlabel('f');
title('sym6 频域');

%一维连续小波变换
%Plot the continuous wavelet transform and scalogram using sym2 wavelet 
%at all integer scales from 1 to 32, using a fractal signal as input: 
%noissin cwt 变换及5，6层分解及低高频重构
figure(7)
load noissin
noissin=noissin(1:510); 
len = length(noissin);
cw1 = cwt(noissin,1:32,'db5','plot'); 
title('Continuous Transform, absolute coefficients.') 
ylabel('Scale')
[cw1,sc] = cwt(noissin,1:32,'db5','scal');
title('Scalogram') 
ylabel('Scale')
% %Compare discrete and continuous wavelet transforms, using a fractal signal as input:
figure(8)
[c,l]=wavedec(noissin,5,'db5');
% Compute and reshape DWT to compare with CWT.
cfd=zeros(5,len);
for k=1:5
    d=detcoef(c,l,k);
    d=d(ones(1,2^k),:);
    cfd(k,:)=wkeep(d(:)',len);
end
cfd=cfd(:);
I=find(abs(cfd) <sqrt(eps));
cfd(I)=zeros(size(I));
cfd=reshape(cfd,5,len);
% Plot DWT.
subplot(3,1,1); plot(noissin); title('Analyzed signal.');
set(gca,'xlim',[0 510]);
subplot(3,1,2); 
image(flipud(wcodemat(cfd,255,'row')));
colormap(pink(255));
set(gca,'yticklabel',[]);
title('Discrete Transform,absolute coefficients');
ylabel('Level');
% Compute CWT and compare with DWT
subplot(3,1,3);
ccfs=cwt(noissin,1:32,'db5','plot');
title('Continuous Transform, absolute coefficients');
set(gca,'yticklabel',[]);
ylabel('Scale');

figure(9)

y1=wrcoef('a',c,l,'db5',5);
subplot(2,1,1),plot(y1);
title('noissin 5 层低高频重构') ;
y2=wrcoef('d',c,l,'db5',5);
subplot(2,1,2),plot(y2);

%6层
figure(10)
[c,l]=wavedec(noissin,6,'db5');
% Compute and reshape DWT to compare with CWT.
cfd=zeros(6,len);
for k=1:6
    d=detcoef(c,l,k);
    d=d(ones(1,2^k),:);
    cfd(k,:)=wkeep(d(:)',len);
end
cfd=cfd(:);
I=find(abs(cfd) <sqrt(eps));
cfd(I)=zeros(size(I));
cfd=reshape(cfd,6,len);
% Plot DWT.
subplot(3,1,1); plot(noissin); title('Analyzed signal.');
set(gca,'xlim',[0 510]);
subplot(3,1,2); 
image(flipud(wcodemat(cfd,255,'row')));
colormap(pink(255));
set(gca,'yticklabel',[]);
title('Discrete Transform,absolute coefficients');
ylabel('Level');
% Compute CWT and compare with DWT
subplot(3,1,3);
ccfs=cwt(noissin,1:32,'db5','plot');
title('Continuous Transform, absolute coefficients');
set(gca,'yticklabel',[]);
ylabel('Scale');

figure(11)

y1=wrcoef('a',c,l,'db5',6);
subplot(2,1,1),plot(y1);
title('noissin 6 层低高频重构') ;
y2=wrcoef('d',c,l,'db5',6);
subplot(2,1,2),plot(y2);

%trsin cwt 变换及5，6层分解及低高频重构
figure(12)
load trsin
trsin=trsin(1:510); 
len = length(trsin);
cw1 = cwt(trsin,1:32,'db5','plot'); 
title('Continuous Transform, absolute coefficients.') 
ylabel('Scale')
[cw1,sc] = cwt(trsin,1:32,'db5','scal');
title('Scalogram') 
ylabel('Scale')
% %Compare discrete and continuous wavelet transforms, using a fractal signal as input:
figure(13)
[c,l]=wavedec(trsin,5,'db5');
% Compute and reshape DWT to compare with CWT.
cfd=zeros(5,len);
for k=1:5
    d=detcoef(c,l,k);
    d=d(ones(1,2^k),:);
    cfd(k,:)=wkeep(d(:)',len);
end
cfd=cfd(:);
I=find(abs(cfd) <sqrt(eps));
cfd(I)=zeros(size(I));
cfd=reshape(cfd,5,len);
% Plot DWT.
subplot(3,1,1); plot(trsin); title('Analyzed signal.');
set(gca,'xlim',[0 510]);
subplot(3,1,2); 
image(flipud(wcodemat(cfd,255,'row')));
colormap(pink(255));
set(gca,'yticklabel',[]);
title('Discrete Transform,absolute coefficients');
ylabel('Level');
% Compute CWT and compare with DWT
subplot(3,1,3);
ccfs=cwt(trsin,1:32,'db5','plot');
title('Continuous Transform, absolute coefficients');
set(gca,'yticklabel',[]);
ylabel('Scale');

figure(14)

y1=wrcoef('a',c,l,'db5',5);
subplot(2,1,1),plot(y1);
title('trsin 5 层低高频重构') ;
y2=wrcoef('d',c,l,'db5',5);
subplot(2,1,2),plot(y2);

%6层
figure(15)
[c,l]=wavedec(trsin,6,'db5');
% Compute and reshape DWT to compare with CWT.
cfd=zeros(6,len);
for k=1:6
    d=detcoef(c,l,k);
    d=d(ones(1,2^k),:);
    cfd(k,:)=wkeep(d(:)',len);
end
cfd=cfd(:);
I=find(abs(cfd) <sqrt(eps));
cfd(I)=zeros(size(I));
cfd=reshape(cfd,6,len);
% Plot DWT.
subplot(3,1,1); plot(trsin); title('Analyzed signal.');
set(gca,'xlim',[0 510]);
subplot(3,1,2); 
image(flipud(wcodemat(cfd,255,'row')));
colormap(pink(255));
set(gca,'yticklabel',[]);
title('Discrete Transform,absolute coefficients');
ylabel('Level');
% Compute CWT and compare with DWT
subplot(3,1,3);
ccfs=cwt(trsin,1:32,'db5','plot');
title('Continuous Transform, absolute coefficients');
set(gca,'yticklabel',[]);
ylabel('Scale');

figure(16)

y1=wrcoef('a',c,l,'db5',6);
subplot(2,1,1),plot(y1);
title('trsin 6 层低高频重构') ;
y2=wrcoef('d',c,l,'db5',6);
subplot(2,1,2),plot(y2);


