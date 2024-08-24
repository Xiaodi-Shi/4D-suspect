# Multidimension-constrained suspect screening

## Overview: 
This GitHub repository contains suspect lists, R scripts, and demo data associated with the article:

**"Multidimensional-constrained Suspect Screening of Hydrophobic Chemicals Using Gas Chromatography-Atmospheric Pressure Chemical Ionization-Ion Mobility Spectrometry"** by Xiaodi Shi, Anna Sobek, and Jonathan P. Benskin.

In this study, gas chromatography-atmospheric pressure chemical ionization-ion mobility-high resolution mass spectrometry (GC-APCI-IM-HRMS) was employed to develop a suspect screening workflow constrained by exact mass, retention time (RT), collision cross section (CCS), and product ion data, alongside a continuous scoring system, to reduce false positives and improve identification confidence.

## Suspect lists: 
We compiled two suspect lists containing information on identity, exact mass, CCS, and RT.

**-GCwCCS.csv:** This list was derived from matching contaminants from all GC-based suspect lists in the NORMAN-SLE with experimentally-derived CCS values from a unified database of 23 scientific articles published between 2016 and 2022, resulting in 1,060 compounds.

**-CoCs.csv:** This list was derived from both the Arctic Monitoring and Assessment Programme’s list of chemicals of emerging Arctic concern, as well as the European Chemical Agency’s list of substances of very high concern. A total of 530 chemicals of concern were obtained after cleanup.

Since analytes can be ionized through charge/proton transfer using APCI, the exact mass of the most abundant isotope for both M<sup>+.</sup> and [M+H]<sup>+</sup> were calculated. We assumed that possible discrepancies in CCS values among M<sup>+.</sup>, [M+H]<sup>+</sup>, and [M-H]<sup>-</sup> ions fell within measurement uncertainty. For compounds lacking literature values, CCS values for [M+H]<sup>+</sup> ions were predicted using AllCCS2. The Fiehn retention index (RI) was adopted with fatty acid methyl esters as references. For both lists, experimental Fiehn RIs were collected from the MS-DIAL metabolomics MSP spectral kit, if available. Kovats RIs for the remaining compounds were sourced from the NIST RI library, or otherwise predicted using a deep convolutional neural network method. Kovats RIs were then converted to Fiehn RIs, and thereafter RT.

More details can be found in the associated paper. 

## R scripts: 
**-ConvertQI2MS.R:** This script is used to convert the format of MS<sup>2</sup> exported from Progenesis QI into a format compatible with SIRIUS. To use the script, change the extension of input file from .msp to .txt. For the output file, change the extension from .txt to .ms before importing it into the SIRIUS. Since SIRIUS only calculates the molecular compositions for protonated ions in positive mode, the mass of a hydrogen (i.e., 1.0078 Da) is added to the mass of precursor ions for peaks detected in the dry condition. 

**-SusScreen.R:** This script is used for matching exact mass, RT, and CCS data. A demo of the detected peak list (i.e., **Detected peaks.csv**) is included in the repository. Peaks must be sorted by exact mass from smallest to largest. For peaks acquired in the dry condition, only masses of M<sup>+.</sup> from suspect lists are referenced. For peaks acquired in the wet condition, only masses of [M+H]<sup>+</sup> from suspect lists are used for the look up.
