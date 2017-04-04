function [x_D1,x_D2,x_D3,x_D4,DAll]=compute_Dir_Spec_From_MWSG(Spect,len)

%% 
% Calculate four directional spectrogram and summed up
% directional spectrogram calculated on a mentioned patch of len
% Where 
% Spect : spectrogram 
% x_D1 : spectrogram which is replaced by values in the patch of
% length len at angle 0 degrees
% x_D2 : spectrogram which is replaced by values in the patch of
% length len at angle 45 degrees
% x_D3 : spectrogram which is replaced by values in the patch of
% length len at angle 90 degrees
% x_D4 : spectrogram which is replaced by values in the patch of
% length len at angle 135 degrees

M=Spect;
[nrows,ncols]=size(M);
l=round(len/2);m=floor(len/2);
Mnew=zeros(nrows+2*m,ncols+2*m);

Mnew(1:m,m+1:ncols+m)=M(1:m,:);
Mnew(nrows+m+1:nrows+2*m,m+1:ncols+m)=M(nrows-m+1:nrows,:);
Mnew(m+1:nrows+m,1:m)=M(:,1:m);
Mnew(m+1:nrows+m,ncols+m+1:ncols+2*m)=M(:,ncols-m+1:ncols);
Mnew(m+1:nrows+m,m+1:ncols+m)=M;

P=Mnew;

D0=P;D90=P;D135=P;D45=P;
[M,N]=size(P);
P2=fliplr(P);

for i=round(len/2):M-floor(len/2)    
    for j=round(len/2):N-floor(len/2)
        widt=floor(len/2);
        
        D0(i,j)= sum(P(i-widt:i+widt,j));
        D90(i,j)=sum(P(i,j-widt:j+widt));        
        
        temp1=diag(P,j-i);
        k=min(i,j);
        
        D135(i,j)=sum(temp1(k-widt:k+widt));
        
        temp2=diag(P2,(N-(j-1)-i));

        k1=min(N-j+1,i);
       
        D45(i,j)=sum(temp2(k1-widt:k1+widt));        
    end
end
x_D1=D0(l:M-m,l:N-m);
x_D2=D45(l:M-m,l:N-m);
x_D3=D90(l:M-m,l:N-m);
x_D4=D135(l:M-m,l:N-m);
DAll = D0+D45+D135+D90;

end