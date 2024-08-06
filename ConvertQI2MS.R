setwd("C:\\ACES\\R\\method development\\Suspect screening")

#Dry condition
{
file_path <- "RealSed-dry-QI.txt"
input_text <- paste(readLines(file_path, warn = FALSE), collapse = "\n")

output_file_path <- "RealSed-dry-MS2.txt"
file_conn <- file(output_file_path, "w")
spectra <- strsplit(input_text, "\n\n")[[1]]

for (spectrum in spectra) {
  lines <- strsplit(spectrum, "\n")[[1]]
  compound_name <- gsub("Name: ", "", lines[1])
  parent_mass <- as.numeric(gsub("PrecursorMZ: ", "", lines[3])) + 1.0078
  ionization <- gsub("Charge: ", "", lines[2])
  ms2_peaks_lines <- lines[6:length(lines)]
  ms2_peaks <- paste(ms2_peaks_lines, collapse = "\n")
  target_text <- paste(
    ">compound", compound_name,
    "\n>parentmass", parent_mass,
    "\n>ionization [M+H]+", 
    "\n\n>ms2peaks\n", ms2_peaks,"\n\n", 
    collapse = " "
  )
  
  writeLines(target_text, file_conn)
}

close(file_conn)
}

#Wet condition
{
  file_path <- "RealSed-wet-QI.txt"
  input_text <- paste(readLines(file_path, warn = FALSE), collapse = "\n")
  
  output_file_path <- "RealSed-wet-MS2.txt"
  file_conn <- file(output_file_path, "w")
  
  spectra <- strsplit(input_text, "\n\n")[[1]]
  
  for (spectrum in spectra) {
    lines <- strsplit(spectrum, "\n")[[1]]
    
    compound_name <- gsub("Name: ", "", lines[1])
    parent_mass <- as.numeric(gsub("PrecursorMZ: ", "", lines[3]))
    ionization <- gsub("Charge: ", "", lines[2])
    
    ms2_peaks_lines <- lines[6:length(lines)]
    ms2_peaks <- paste(ms2_peaks_lines, collapse = "\n")
    
    target_text <- paste(
      ">compound", compound_name,
      "\n>parentmass", parent_mass,
      "\n>ionization [M+H]+", 
      "\n\n>ms2peaks\n", ms2_peaks,"\n\n", 
      collapse = " "
    )
    
    writeLines(target_text, file_conn)
  }
  
  close(file_conn)
}
