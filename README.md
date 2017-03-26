# MWSG_IEEE_Paper
Codes for paper "Spectrogram enhancement using multiple window Savitzky Golay (MWSG) filter for robust bird sound detection" which is published in IEEE Transactions on Speech,Audio and Language Processing March 2017

Description of each MatLab file present in the folder is described below:

# compute_MWSG_Spec.m
 Program to calculate Multiple Window Savitzky Golay Filter of
 Matrix Length M and Order P default M=21 P=3

# compute_Dir_Spec_From_MWSG.m
 Program to calculate four directional spectrograms and summed up
 directional spectrogram calculated on a mentioned patch of len on provide MWSG spectrogram.

# segment.m
 Function to generate segmented vector or Predicted Frames on Spectrogram (Spect)
 Refrence Paper : Bird acoustic activity detection based on morphological filtering of the spectrogram

# Demo.m 
 This file demostates the steps we followed in detecting bird sound using multiple window Savitzky Golay (MWSG) spectrogram

# GroundTruth.txt
 This file contains the ground truth of the audio file 'PC5_20090606_050000_0010' which is taken from
 MLSP dataset and is used to demonstrate our algorithm
