# MWSG_IEEE_Paper
Codes for paper "Spectrogram enhancement using multiple window Savitzky Golay (MWSG) filter for robust bird sound detection" which is published in IEEE Transactions on Speech,Audio and Language Processing March 2017

Description of each MatLab file present in the folder is described below:

# compute_MWSG_Spec.m
 Function to calculate Multiple Window Savitzky Golay(SG) Filter of
Matrix Length M and Order P default M=21 P=3
High Pass filtered at 1Khz. DSP System ToolBox of MatLab is required
to run this program
Where
signal is the audio file 
fs is the sampling frequency
M is the Matrix Length required for SG Coefficients
P is the Order for SG Coefficients


# compute_Dir_Spec_From_MWSG.m
 Program to calculate four directional spectrogram and summed up
directional spectrogram calculated on a mentioned patch of len
Where 
Spect is the spectrogram 
x_D1 is the spectrogram which is replaced by values in the patch of
length len at angle 0 degrees
x_D2 is the spectrogram which is replaced by values in the patch of
length len at angle 45 degrees
x_D3 is the spectrogram which is replaced by values in the patch of
length len at angle 90 degrees
x_D4 is the spectrogram which is replaced by values in the patch of
length len at angle 135 degrees

# segment.m
 Function to generate segmented vector(PdframesC) based on the threshold on Input
Spectrogram (Spect)
Refrence Paper : Bird acoustic activity detection based on morphological filtering
of the spectrogram
Where
Spect is the Spectrogram
d is the Predicted frame array


# Demo.m 
 % This file is included to demonstrate the steps of algorithm we used to
% detect Bird sounds using Multiple Window Savitzky-Golay(MWSG) Filter

# GroundTruth.txt
 This file contains the ground truth of the audio file 'PC5_20090606_050000_0010' which is taken from
 MLSP dataset and is used to demonstrate our algorithm
