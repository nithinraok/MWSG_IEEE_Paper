%%
% This file is included to demonstrate the steps of algorithm we used to
% detect Bird sounds using Multiple Window Savitzky-Golay(MWSG) Filter
%% Step 1 MWSG Filter
% Compute the MWSG spectrogram for the given audio signal
[signal,fs]=audioread('PC5_20090606_050000_0010.wav'); %% MLSP audio file
% Parameters
M=21; %Matrix length required to calculate SG coefficents
P=3; %Order required to calculate SG coefficents
nfft=512; %FFT Order
shift=256; % Shift
winlength=512;% Window Length
MWSG=compute_MWSG_Spec(signal,fs,M,P);
%% Step 2 Directionality
% Calculate the directional spectrograms based on MWSG Spectrogram
% Parameters
len=11; % No of array values to be summed up in the required direction
[D0,D45,D90,D135,DAll]=compute_Dir_Spec_From_MWSG(MWSG,len);
%% Step 3 Segmentation
% Calculating Predicted frames for each directed spectrogam
Pdframes0=segment(D0); % Predicted frames at 0 degress directed spectrogram
Pdframes45=segment(D45); % Predicted frames at 0 degress directed spectrogram
Pdframes90=segment(D90); % Predicted frames at 0 degress directed spectrogram
Pdframes135=segment(D135); % Predicted frames at 0 degress directed spectrogram
% Final Predicted frames = max(each directional predicted frame)
Pdframes= (Pdframes0+Pdframes90+Pdframes45+Pdframes135);
Pdframes(Pdframes>0)=1;

%% Figures
% Just to get Frequency and Time Points
[~,F,T,~]=spectrogram(signal,winlength,shift,nfft,fs);
% Loading ground truth frames
load('GroundTruth.txt');
figure;
subplot(3,1,1);
time=(1:length(signal))/fs;
plot(time,signal); % Signal
title('Signal');
xlabel('Time in sec');
ylabel('Amplitute');
subplot(3,1,2);
surf(T,F,10*log10(MWSG),'EdgeColor','none'); %MWSG Spectrogram
view(0,90);
axis tight;
title('MWSG Spectrogram');
xlabel('Time in sec');
ylabel('Frequency in Hz');
subplot(3,1,3);
plot(T,GroundTruth,'r'); % GroundTruth Frames
hold on;
plot(T,Pdframes,'b');   % Predicted Frames
hold off;
ylim([0 2]);
xlabel('Time in sec');
legend('GroundTruth','Predicted Frames');


