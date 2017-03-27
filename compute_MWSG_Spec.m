function [MWSG]=compute_MWSG_Spec(signal,fs,M,P)
%%
% Function to calculate Multiple Window Savitzky Golay(SG) Filter of
% Matrix Length M and Order P default M=21 P=3
% High Pass filtered at 1Khz. DSP System ToolBox of MatLab is required
% to run this program
% Where
% signal is the audio file 
% fs is the sampling frequency
% M is the Matrix Length required for SG Coefficients
% P is the Order for SG Coefficients
% MWSG is the Multiple Window Savitzky Golay(SG) Filterd Spectrogram
%%
switch nargin
    case 1
        fs=16000; %16Khz default
        M=21;
        P=3;
    case 2
        M=21;
        P=3;
    case 3
        P=3;
end
%%
% Calculate Savitzky Golay Coefficients of MatrixLength M and Order P
[~,~,~,~,sgCoeff]=SavGolCoeff(P,M);
%% Parametrs for High Pass filtering
passBandFreq=(1000)/(fs/2);
stopBandFreq=(900)/(fs/2);
passBandAttn=1; %dB
stopBandAttn=60; %dB
D = fdesign.highpass('Fst,Fp,Ast,Ap',stopBandFreq,passBandFreq,stopBandAttn,passBandAttn);
H=design(D,'equiripple');
signal=signal(:,1); %considering only 1 channel if its dual channel
signal=filter(H,signal);
%%
% multiWindowSpec stores the spectrogram generated using multiWindow
% method
multiWindowSpec = multiWindow(signal,fs);
%%
% Passing the multiWindow Spectrogram to SGonImg function to calculate
% Multiple Window Savitzky Golay Spectrogram followed by 2D median
% filtering using 3x3 neighbourhood
P1 = SGonImg(multiWindowSpec,sgCoeff);
P1=P1-min(P1(:));
MWSG=medfilt2(P1,[3 3]);

end

function [NamesCoefs, NamesTerms, XPow, YPow, SGnew] = SavGolCoeff(nOrder,nSize)
% Compute Savitzky-Golay coefficients
% John Krumm, Microsoft Research, August 2001
% Requires MatLabSymbolic Math Toolbox
% On return:
% NamesCoefs(i,:) gives the name of coefficient i, e.g. a23
% NamesTerms(i,:) gives the name of the polynomial term i, e.g. (x^2)(y^3)
% XPow(i) and YPow(i) give exponents on x and y for coefficient i
% SG(:,:,i) gives the nSize x nSize filter for computing coefficient i

% Set up polynomial terms for a given order
Terms = [];
NamesCoefs = [];
NamesTerms = [];
XPow = [];
YPow = [];
syms x y real;
for j=0:nOrder
    for i=0:nOrder-j
        Terms = [Terms; (x^i)*(y^j)];
        XPow = [XPow; i];
        YPow = [YPow; j];
    end
end

% Compute A matrix for a nSize x nSize window
A = [];
for y = -(nSize-1)/2:(nSize-1)/2 % important to loop through in same scan order as image patch pixels
    for x = -(nSize-1)/2:(nSize-1)/2
        %sprintf ('%f %f',x,y)
        A = [A; subs(Terms')];
    end
end

% Compute coefficient matrix
C = inv(A'*A)*A';

% Pull out coefficients
SG = [];
[nTerms, nDum] = size(Terms);
for i=1:nTerms
    SG(:,:,i) = reshape(C(i,:),[nSize,nSize]);
end
% Print
%for i=1:nTerms
%     NamesCoefs(i,:)
%     NamesTerms(i,:)
%     SG(:,:,i)
%end
SGnew=SG(:,:,1);
end

function out_spec = multiWindow(signal,fs)
%%
% Function to generate spectrogram usig mutiple window length method
% FFT size =512;
winlength=[32 64 128 256 512];
shift=256;
nfft=512;
tempcols=[];
for i=1:length(winlength)
    noverlap=winlength(i)-shift;
    if winlength(i)>=256
        temp{i}=abs(spectrogram(signal,winlength(i),noverlap,nfft,fs));
    else
        t1=abs(spectrogram(signal,winlength(i),winlength(i)-32,nfft,fs));
        factor=round(256/32);
        temp{i}=t1(:,1:factor:end);
    end
    tempcols=[tempcols;size(temp{i},2)];
end
nrows=nfft/2 +1;
ncols=min(tempcols);
M=zeros(nrows,ncols);
for i=1:length(winlength)
    M=M+temp{i}(:,1:ncols);
end
out_spec=M;
end

function outimg = SGonImg(InImg,SGCoeff)
%%
% Function to generate Savitzky Golay 2D filtered Image using
% Savitzky Golay Coefficients on Input Image (here InImg)
SG=SGCoeff(:,:,1);
outimg=conv2(InImg,SG,'same');
end
