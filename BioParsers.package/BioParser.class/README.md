BioParser is the main access point to parsing in the BioSmalltalk library. It acts as a Facade to the parsing subsystem.

There are two ways of using a parser

1) As a tokenizer, which will always answer an Array with the input String tokenized.
2) As a proper parser, which will always construct and answer a real Smalltalk object.

1) As a tokenizer

The protocol for the tokenizer is sending:

BioParser tokenizeXXX where XXX is what you want to parse, for example: #tokenizeAccession: , #tokenizeSwissProtEntryName:, #tokenizeGenBankIdentifier:, etc. The corresponding parser will be instantiated and the answer will be a "primitive type" Smalltalk object. In the case of accession numbers would be an Array because an accession number is usually composed of name and version, in the case of a GenBank identifier would be a String, etc.

2) As a parser

The elemental protocol for starting to use the parser is sending a message to this class, for example: BioParser parseAccession: '...'

This will create a new instance of the appropiate parser, send the #parse: message and and answer, in this example, a BioAccession instance with values properly filled from the parsing results if it was succesful. You may always test manually the parsing process by tokenizing before constructing the real object (this may be useful if there are lots of input): BioParser tokenizeAccession: '....'

Use cases:

1) If the parsing was succesfully, and the parser was instantiated with #tokenize, the #results message will answer an Array with the elements parsed.
2) If the parsing was succesfully, and the parser was instantiated with #parseAccession:, #parseGb:, #parseGi:, #parseEmb:, etc. the #results message will answer an instance of the proper class, This could be BioAccession, BioGenBankIdentifier, etc.
3) If the parsing was unsuccesful, the #results message will answer the "expected" parser's message. This could indicate the parser used was not appropiate for parsing the input entered or the parser itself is not parsing well the input.

Format of database identifiers

 GenBank                           gi|gi-number|gb|accession|locus
 EMBL Data Library                 gi|gi-number|emb|accession|locus
 DDBJ, DNA Database of Japan       gi|gi-number|dbj|accession|locus
 NBRF PIR                          pir||entry
 Protein Research Foundation       prf||name
 SWISS-PROT                        sp|accession|name
 Brookhaven Protein Data Bank (1)  pdb|entry|chain
 Brookhaven Protein Data Bank (2)  entry:chain|PDBID|CHAIN|SEQUENCE
 Patents                           pat|country|number 
 GenInfo Backbone Id               bbs|number 
 General database identifier       gnl|database|identifier
 NCBI Reference Sequence           ref|accession|locus
 Local Sequence identifier         lcl|identifier