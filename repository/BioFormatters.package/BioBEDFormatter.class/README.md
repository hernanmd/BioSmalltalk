Abstract class to work with all the Browser Extensible Data (BED) formats out there, as described in the http://genome.ucsc.edu/FAQ/FAQformat#format1

The formatter holds a orderIndex to ensure the data lines fields are sent in the correct order.

BioBEDFormatter new
	addCFChr:  'chr3' start: 313213  end: 1382913;
	yourself.

	