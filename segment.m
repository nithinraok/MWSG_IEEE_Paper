function [PdframesC]=segment(Spect)
%% 
% Function to generate segmented vector(PdframesC) based on the threshold on Input
% Spectrogram (Spect)
% Refrence Paper : Bird acoustic activity detection based on morphological filtering
% of the spectrogram

PdframesC=zeros(1,size(Spect,2));
W=sum(Spect);
[counts,bin]=hist(W);
[Countmax,b]=max(counts);
if b<10         %considered 10 bins
    threshold=bin(b+1);
else
    threshold=bin(b);
end
PdframesC(W>=threshold)=1;

end