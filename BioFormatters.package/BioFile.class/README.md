A BioFile is used to represent a file, it's not intended to be used for parsing a file. For example this is used when having a CSV file, one could instatiate a BioCSVFile to set specific parsing paramenters, like the numbers of columns to read or ignore header lines.

A BioFormatter is what to use when a developer has an INPUT file and possible an OUTPUT file/stream.
