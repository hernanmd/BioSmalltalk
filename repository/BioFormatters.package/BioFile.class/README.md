A BioFile is used to represent a file, it's not intended to be used for parsing a file. This is useful when having a BioCSVFile which we need to set specific parsing paramenters, for example, numbers of columns to read or ignore header lines.

A BioFormatter is what to use when a developer has an INPUT file and possible an OUTPUT file/stream.