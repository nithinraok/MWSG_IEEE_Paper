# MWSG_IEEE_Paper
Codes for paper "Spectrogram enhancement using multiple window Savitzky Golay (MWSG) filter for robust bird sound detection" which is published in IEEE Transactions on Speech,Audio and Language Processing March 2017
<br />IEEE Xplorer Link : (To be included soon)
<br />MatLab Version used : R2014a.

![Image](https://raw.githubusercontent.com/nithinraok/MWSG_IEEE_Paper/master/DemoFigure.jpg)
Description of each MatLab file present in the folder is described below:

# compute_MWSG_Spec.m
calculate Multiple Window Savitzky Golay(SG) Filter of
Matrix Length M and Order P default M=21 P=3
High Pass filtered at 1Khz. DSP System ToolBox of MatLab is required
to run this program
Where
signal : I/P audio file 
fs : Sampling frequency
M : Matrix Length required for SG Coefficients
P : Order for SG Coefficients
MWSG : Multiple Window Savitzky Golay(SG) Filtered Spectrogram


# compute_Dir_Spec_From_MWSG.m
Calculate four directional spectrogram and summed up
directional spectrogram calculated on a mentioned patch of len
Where 
Spect : spectrogram 
x_D1 : spectrogram which is replaced by values in the patch of
length len at angle 0 degrees
x_D2 : spectrogram which is replaced by values in the patch of
length len at angle 45 degrees
x_D3 : spectrogram which is replaced by values in the patch of
length len at angle 90 degrees
x_D4 : spectrogram which is replaced by values in the patch of
length len at angle 135 degrees


# segment.m
Generate segmented vector(PdframesC) based on the threshold on Input
Spectrogram (Spect)
Refrence Paper : Bird acoustic activity detection based on morphological filtering
of the spectrogram
Where
Spect : Spectrogram
d : Predicted frame array



# Demo.m 
 This file is included to demonstrate the steps of algorithm we used to
 detect Bird sounds using Multiple Window Savitzky-Golay(MWSG) Filter

# GroundTruth.txt
 This file contains the ground truth of the audio file 'PC5_20090606_050000_0010' which is taken from
 MLSP dataset and is used to demonstrate our algorithm.
 Ground truth is frame wise 0s and 1s

