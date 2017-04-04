# MWSG_IEEE_Paper
Codes for paper "Spectrogram enhancement using multiple window Savitzky Golay (MWSG) filter for robust bird sound detection" which is published in IEEE Transactions on Speech,Audio and Language Processing March 2017
<br />IEEE Xplorer Link : (To be included soon)
<br />MatLab Version used : R2014a.

![Image](https://raw.githubusercontent.com/nithinraok/MWSG_IEEE_Paper/master/DemoFigure.jpg)
Description of each MatLab file present in the folder is described below:

# compute_MWSG_Spec.m
calculate Multiple Window Savitzky Golay(SG) Filter of
Matrix Length M and Order P default M=21 P=3
High Pass filtered at 1Khz. 
<br />DSP System ToolBox of MatLab is required
to run this program
<br />Parameters
<br />signal : I/P audio file 
<br />fs : Sampling frequency
<br />M : Matrix Length required for SG Coefficients
<br />P : Order for SG Coefficients
<br />MWSG : Multiple Window Savitzky Golay(SG) Filtered Spectrogram


# compute_Dir_Spec_From_MWSG.m
Calculate four directional spectrogram and summed up
directional spectrogram calculated on a mentioned patch of len
<br />Parameters 
<br />Spect : spectrogram 
<br />x_D1 : spectrogram which is replaced by values in the patch of
length len at angle 0 degrees
<br />x_D2 : spectrogram which is replaced by values in the patch of
length len at angle 45 degrees
<br />x_D3 : spectrogram which is replaced by values in the patch of
length len at angle 90 degrees
<br />x_D4 : spectrogram which is replaced by values in the patch of
length len at angle 135 degrees


# segment.m
Generate segmented vector(PdframesC) based on the threshold on Input
Spectrogram (Spect)
<br />Refrence Paper : Bird acoustic activity detection based on morphological filtering
of the spectrogram
<br />Parameters
<br />Spect : Spectrogram
<br />d : Predicted frame array



# Demo.m 
 This file is included to demonstrate the steps of algorithm we used to
 detect Bird sounds using Multiple Window Savitzky-Golay(MWSG) Filter

# GroundTruth.txt
 This file contains the ground truth of the audio file 'PC5_20090606_050000_0010' which is taken from
 MLSP dataset and is used to demonstrate our algorithm.
 <br />Ground truth is frame wise 0s and 1s

