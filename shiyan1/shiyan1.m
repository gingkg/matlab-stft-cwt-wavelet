x=0:(1/1000):1;
w1=2*pi/0.1;
w2=2*pi;
w3=2*pi/10;
y1=cos(w1*x);
y2=cos(w2*x);
y3=cos(w3*x);

figure(1)
subplot(2,2,1),plot(x,y1);
grid on;
xlabel('cos_t=0.1s');
subplot(2,2,2),plot(x,y2);
grid on;
xlabel('cos_t=1s');
subplot(2,2,3),plot(x,y3);
grid on;
xlabel('cos_t=10s');

figure(2)
s=y1;
subplot(2,2,1),spectrogram(s,hamming(256),255,256,1000,'yaxis');
xlabel('t=0.1s');
s=y2;
subplot(2,2,2),spectrogram(s,hamming(256),255,256,1000,'yaxis');
xlabel('t=1s');
s=y3;
subplot(2,2,3),spectrogram(s,hamming(256),255,256,1000,'yaxis');
xlabel('t=10s');

figure(3)
s=y1;
subplot(2,2,1),spectrogram(s,hamming(32),31,32,1000,'yaxis');
xlabel('hamming(32)');
subplot(2,2,2),spectrogram(s,hamming(64),63,64,1000,'yaxis');
xlabel('hamming(64)');
subplot(2,2,3),spectrogram(s,hamming(128),127,128,1000,'yaxis');
xlabel('hamming(128)');
subplot(2,2,4),spectrogram(s,hamming(256),255,256,1000,'yaxis');
xlabel('hamming(256)');

figure(4)
s=y1;
subplot(2,2,1),spectrogram(s,rectwin(32),31,32,1000,'yaxis');
xlabel('rectwin');
subplot(2,2,2),spectrogram(s,blackman(64),63,64,1000,'yaxis');
xlabel('blackman');
subplot(2,2,3),spectrogram(s,hamming(128),127,128,1000,'yaxis');
xlabel('hamming');

y4=linspace(1,1000);
for n=1:1000
    if n<=500
        y4(n:n)=sin(0.03*n);
    else
        y4(n:n)=sin(0.3*n);
    end
end
figure(5)
plot(y4);
grid on;
xlabel('y4');
hold on;

figure(6)
s=y4;
spectrogram(s,hamming(256),255,256,1000,'yaxis');
xlabel('y4-stft');

n=0:1:20000;
A=5;
y5=A*cos(10*pi*0.00001*n.*n);

figure(7)
plot(y5);
grid on;
xlabel('y5');
hold on;

figure(8)
s=y5;
spectrogram(s,hamming(256),255,256,1000,'yaxis');
xlabel('y5-stft');


[y6,fs]=audioread('sealion.wav'); 
t=(0:length(y6)-1)/fs; 

figure(9)
plot(t,y6), xlabel('time(sec)');
grid on;
hold on;

L=length(y6);

v=1:L;
for n=1:L
    v(n)=y6(n,1);
end

figure(10)
s=v;
subplot(2,2,1),spectrogram(s,rectwin(32),31,32,1000,'yaxis');
xlabel('y6-stft-rectwin');
subplot(2,2,2),spectrogram(s,blackman(64),63,64,1000,'yaxis');
xlabel('y6-stft-blackman');
subplot(2,2,3),spectrogram(s,hamming(128),127,128,1000,'yaxis');
xlabel('y6-stft-hamming');















