# Multidimension-constrained suspect screening

## Overview: 
This GitHub repository contains suspect lists, R scripts, and demo data associated with the article:

"Multidimensional-constrained Suspect Screening of Hydrophobic Chemicals Using Gas Chromatography-Atmospheric Pressure Chemical Ionization-Ion Mobility Spectrometry" by Xiaodi Shi, Anna Sobek, and Jonathan P. Benskin.

In this study, gas chromatography-atmospheric pressure chemical ionization-ion mobility-high resolution mass spectrometry (GC-APCI-IM-HRMS) was employed to develop a suspect screening workflow constrained by exact mass, retention time (RT), collision cross section (CCS), and product ion data, alongside a continuous scoring system, to reduce false positives and improve identification confidence.

## Suspect lists: 
We compiled two suspect lists containing information on identity, exact mass, CCS, and RT.

**-GCwCCS:** This list was derived from matching contaminants from all GC-based suspect lists in the NORMAN-SLE with experimentally-derived CCS values from a unified database of 23 scientific articles published between 2016 and 2022, resulting in 1,060 compounds.

**-CoCs:** This list was derived from both the Arctic Monitoring and Assessment Programme’s list of chemicals of emerging Arctic concern, as well as the European Chemical Agency’s list of substances of very high concern. A total of 530 chemicals of concern were obtained after cleanup.
Since analytes can be ionized through charge/proton transfer using APCI, the exact mass of the most abundant isotope for both M<sup>+.</sup> and [M+H]<sup>+</sup> were calculated. We assumed that possible discrepancies in CCS values among M<sup>+.</sup>, [M+H]<sup>+</sup>, and [M-H]<sup>-</sup> ions fell within measurement uncertainty. For compounds lacking literature values, CCS values for [M+H]<sup>+</sup> ions were predicted using AllCCS2. The Fiehn retention index (RI) was adopted with fatty acid methyl esters as references. For both lists, experimental Fiehn RIs were collected from the MS-DIAL metabolomics MSP spectral kit, if available. Kovats RIs for the remaining compounds were sourced from the NIST RI library, or otherwise predicted using a deep convolutional neural network method. Kovats RIs were then converted to Fiehn RIs, and thereafter RT.

More details can be found in the associated paper. 
