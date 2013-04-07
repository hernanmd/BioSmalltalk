A CSV file is a Comma-Separated Value file format used to store tabular data in plain text form.

To create a CSVFile specify the full path string:

| myCsv |
myCsv := BioCSVFile on: 'c:\myFiles\Test001.csv'.

To configure for ignoring the first 4 lines on read (the default is NOT to ignore any header line):

myCsv ignoreLinesCount: 4.

To configure for ignoring the last 3 lines on read (the default is NOT to ignore any last line):

myCsv ignoreLastLines.
myCsv ignoreLinesCount: 3.