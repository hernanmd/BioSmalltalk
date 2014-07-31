Abstract XML Pull Parser for http://www.ncbi.nlm.nih.gov/dtd/NCBI_GBSeq.dtd

  GBSeq represents the elements in a GenBank style report
    of a sequence with some small additions to structure and support
    for protein (GenPept) versions of GenBank format as seen in
    Entrez. While this represents the simplification, reduction of
    detail, and flattening to a single sequence perspective of GenBank
    format (compared with the full ASN.1 or XML from which GenBank and
    this format is derived at NCBI), it is presented in ASN.1 or XML for
    automated parsing and processing. It is hoped that this compromise
    will be useful for those bulk processing at the GenBank format level
    of detail today. Since it is a compromise, a number of pragmatic
    decisions have been made.

See http://www.ncbi.nlm.nih.gov/dtd/NCBI_GBSeq.mod.dtd for details

Usage example:

| fileRef |
fileRef := FileSystem workingDirectory / 'temp3' / '1.xml'.
(BioEntrezXMLGBSeqParser on: fileRef readStream)	 collectGBSet

