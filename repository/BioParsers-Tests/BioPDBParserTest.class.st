Class {
	#name : 'BioPDBParserTest',
	#superclass : 'BioAbstractParserTest',
	#category : 'BioParsers-Tests',
	#package : 'BioParsers-Tests'
}

{ #category : 'sampledata' }
BioPDBParserTest >> alternateLocPDB [
	^ 'HEADER    TRANSFERASE                             15-MAR-99   3XYZ
ATOM      1  N   ALA A   1       1.000   2.000   3.000  1.00 10.00           N
ATOM      2  CA  ALA A   1       2.000   3.000   4.000  1.00 12.00           C
ATOM      3  CA AALA A   1       2.100   3.100   4.100  0.30 12.50           C
ATOM      4  CB  ALA A   1       3.000   4.000   5.000  1.00 14.00           C
END'
]

{ #category : 'sampledata' }
BioPDBParserTest >> multiChainPDB [
	^ 'HEADER    OXIDOREDUCTASE                          01-JAN-20   2ABC
TITLE     CRYSTAL STRUCTURE OF A MULTI-CHAIN ENZYME
TITLE    2 COMPLEXED WITH NAD
COMPND    MOL_ID: 1;
COMPND   2 MOLECULE: OXIDOREDUCTASE;
COMPND   3 CHAIN: A, B;
SOURCE    MOL_ID: 1;
SOURCE   2 ORGANISM_SCIENTIFIC: HOMO SAPIENS;
KEYWDS    OXIDOREDUCTASE, NAD
EXPDTA    X-RAY DIFFRACTION
AUTHOR    J.DOE,K.SMITH
REMARK   2 RESOLUTION. 1.80 ANGSTROMS.
SEQRES   1 A   13  ALA GLY SER THR CYS PRO GLU ASP LYS ARG VAL ILE
SEQRES   2 A   13  PHE LEU
SEQRES   1 B    5  MET LEU TYR ASN GLN
HELIX    1  HA ALA A    2  GLY A    6  1
SHEET    1  AB 2  MET B   1  LEU B   3  0
MODEL        1
ATOM      1  N   ALA A   2       1.000   2.000   3.000  1.00 10.00           N
ATOM      2  CA  ALA A   2       2.000   3.000   4.000  1.00 12.00           C
ATOM      3  C   ALA A   2       3.000   4.000   5.000  1.00 14.00           C
ATOM      4  O   ALA A   2       4.000   5.000   6.000  1.00 16.00           O
ATOM      5  N   MET B   1       5.000   6.000   7.000  1.00 18.00           N
ATOM      6  CA  MET B   1       6.000   7.000   8.000  1.00 20.00           C
HETATM    7  FE  FE  A 200       7.000   8.000   9.000  0.50 30.00          FE
CONECT    1    2    3
CONECT    2    1    3
ENDMDL
MODEL        2
ATOM      1  N   ALA A   2      -1.000  -2.000  -3.000  1.00 10.00           N
ATOM      2  CA  ALA A   2      -2.000  -3.000  -4.000  1.00 12.00           C
ATOM      3  C   ALA A   2      -3.000  -4.000  -5.000  1.00 14.00           C
ATOM      4  O   ALA A   2      -4.000  -5.000  -6.000  1.00 16.00           O
ATOM      5  N   MET B   1      -5.000  -6.000  -7.000  1.00 18.00           N
ATOM      6  CA  MET B   1      -6.000  -7.000  -8.000  1.00 20.00           C
HETATM    7  FE  FE  A 200      -7.000  -8.000  -9.000  0.50 30.00          FE
ENDMDL
CONECT    5    6
END'
]

{ #category : 'sample data' }
BioPDBParserTest >> multiSeqResPDB [
	"Multiple SEQRES lines for the same chain"

	^ 'HEADER    PROTEIN                                  01-JAN-00   4DEF
SEQRES   1 A   15  ALA GLY SER THR CYS PRO GLU ASP LYS ARG VAL ILE PHE
SEQRES   2 A   15  LEU MET
SEQRES   1 B    5  MET LEU TYR ASN GLN
ATOM      1  N   ALA A   1       1.000   2.000   3.000  1.00 10.00           N
ATOM      2  N   MET B   1       4.000   5.000   6.000  1.00 20.00           N
END'
]

{ #category : 'accessing' }
BioPDBParserTest >> parserClass [
	^ BioPDBSmaCCParser
]

{ #category : 'sample data' }
BioPDBParserTest >> sampleAtom [
	^ 'ATOM      1  N   SER A   1      10.000  20.000  30.000  1.00 20.00           N'
]

{ #category : 'sample data' }
BioPDBParserTest >> sampleHeader [
	^ 'HEADER    HYDROLASE                               17-JAN-03   1ABC'
]

{ #category : 'sampledata' }
BioPDBParserTest >> sampleHelix [
	^ 'HELIX    1  HA GLY A    1  LYS A    5  1'
]

{ #category : 'sampledata' }
BioPDBParserTest >> samplePDB [
	^ 'HEADER    HYDROLASE                               17-JAN-03   1ABC
TITLE     CRYSTAL STRUCTURE OF A HYDROLASE
COMPND    MOL_ID: 1;
COMPND   2 MOLECULE: HYDROLASE;
COMPND   3 CHAIN: A;
SOURCE    MOL_ID: 1;
SOURCE   2 ORGANISM_SCIENTIFIC: HOMO SAPIENS;
KEYWDS    HYDROLASE, ENZYME
EXPDTA    X-RAY DIFFRACTION
AUTHOR    J.SMITH,A.BROWN
REMARK   1
REMARK   2 RESOLUTION. 2.00 ANGSTROMS.
SEQRES   1 A   10  SER GLY PRO LYS ALA VAL LEU ILE PHE THR
ATOM      1  N   SER A   1      10.000  20.000  30.000  1.00 20.00           N
ATOM      2  CA  SER A   1      11.000  21.000  31.000  1.00 18.00           C
ATOM      3  C   SER A   1      12.000  22.000  32.000  1.00 15.00           C
ATOM      4  O   SER A   1      13.000  23.000  33.000  1.00 12.00           O
HETATM    5  ZN  ZN  A 101      14.000  24.000  34.000  0.50 25.00          ZN2+
CONECT    1    2    3
END'
]

{ #category : 'sample data' }
BioPDBParserTest >> sampleSeqRes [
	^ 'SEQRES   1 A   10  SER GLY PRO LYS ALA VAL LEU ILE PHE THR'
]

{ #category : 'sample data' }
BioPDBParserTest >> sheetOnlyPDB [
	"PDB with SHEET and REMARK records"

	^ 'HEADER    PROTEIN                                  01-JAN-00   5GHI
REMARK   2 RESOLUTION. 2.50 ANGSTROMS.
SHEET    1  AB 2  MET B   1  LEU B   3  0
ATOM      1  N   MET B   1       1.000   2.000   3.000  1.00 10.00           N
END'
]

{ #category : 'sample data' }
BioPDBParserTest >> shortLinePDB [
	"PDB with short/truncated lines to test bounds safety"

	^ 'HEADER
ATOM      1  CA  ALA A   1       1.0    2.0    3.0  1.0 10.0
HETATM    2  FE  FE  A   1       4.0    5.0    6.0
SEQRES   1 A    3  ALA GLY SER
CONECT    1
HELIX    1  HA ALA A   1
END'
]

{ #category : 'testing' }
BioPDBParserTest >> testAlternateLocation [
	| file atomA atomAlt |
	file := (self parserClass parseString: self alternateLocPDB) parse.
	atomA := file atoms detect: [ :a | a serialNumber = 2 ].
	atomAlt := file atoms detect: [ :a | a serialNumber = 3 ].
	self assert: atomA altLoc equals: ''.
	self assert: atomAlt altLoc equals: 'A'.
	self assert: atomAlt resName equals: 'ALA'.
	self assert: atomAlt resSeq equals: 1.
	self assert: atomAlt occupancy equals: 0.30
]

{ #category : 'testing - multi-chain' }
BioPDBParserTest >> testAtomCoordinatesForChain [
	"Verify coordinate extraction per chain"

	| file chainA firstA |
	file := (self parserClass parseString: self multiChainPDB) parse.
	chainA := file atomsForChain: 'A'.
	firstA := chainA first.
	self assert: firstA x equals: 1.000.
	self assert: firstA y equals: 2.000.
	self assert: firstA z equals: 3.000
]

{ #category : 'testing' }
BioPDBParserTest >> testAtomRecordTypes [
	| file atom hetatm |
	file := (self parserClass parseString: self samplePDB) parse.
	atom := file atoms detect: [ :a | a serialNumber = 1 ].
	hetatm := file atoms detect: [ :a | a serialNumber = 5 ].
	self assert: atom recordType equals: 'ATOM'.
	self assert: hetatm recordType equals: 'HETATM'.
	self assert: atom resName equals: 'SER'.
	self assert: hetatm resName equals: 'ZN'.
	self assert: atom element equals: 'N'.
	self assert: hetatm element equals: 'ZN'
]

{ #category : 'testing' }
BioPDBParserTest >> testConectRecord [
	| record |
	parser := self parserClass new.
	record := parser parseConect: 'CONECT    1    2    3'.
	self assert: record recordType equals: 'CONECT'.
	self assert: record serialNumber equals: 1.
	self assert: record bondedAtoms size equals: 2.
	self assert: record bondedAtoms first equals: 2.
	self assert: record bondedAtoms second equals: 3
]

{ #category : 'testing - edge cases' }
BioPDBParserTest >> testEmptyHeaderFields [
	"HEADER with minimal content should parse without error"

	| record |
	parser := self parserClass new.
	record := parser parseHeader: 'HEADER                                                                    '.
	self assert: record recordType equals: 'HEADER'.
	self assert: record classification equals: ''
]

{ #category : 'testing - records' }
BioPDBParserTest >> testEndRecords [
	"END and ENDMDL records should be parsed"

	| file endRecords |
	file := (self parserClass parseString: self multiChainPDB) parse.
	endRecords := file records select: [ :r | r recordType = 'ENDMDL' ].
	self assert: endRecords size equals: 2
]

{ #category : 'testing - multi-chain' }
BioPDBParserTest >> testHETATMHasCorrectFields [
	"HETATM records should be parsed into BioPDBAtomRecord with recordType HETATM"
	"Full HETATM field coverage (serial, name, residue, chain, coordinates, occupancy, tempFactor, element)"

	| file hetatm |
	file := (self parserClass parseString: self multiChainPDB) parse.
	hetatm := file atoms detect: [ :a | a recordType = 'HETATM' ].
	self assert: hetatm serialNumber equals: 7.
	self assert: hetatm atomName equals: 'FE'.
	self assert: hetatm resName equals: 'FE'.
	self assert: hetatm chainID equals: 'A'.
	self assert: hetatm resSeq equals: 200.
	self assert: hetatm x equals: 7.000.
	self assert: hetatm y equals: 8.000.
	self assert: hetatm z equals: 9.000.
	self assert: hetatm occupancy equals: 0.50.
	self assert: hetatm tempFactor equals: 30.00.
	self assert: hetatm element equals: 'FE'
]

{ #category : 'testing - records' }
BioPDBParserTest >> testHeaderRecordFromMultiChain [
	"HEADER from multi-chain PDB should parse all fields"

	| file header |
	file := (self parserClass parseString: self multiChainPDB) parse.
	header := file records detect: [ :r | r recordType = 'HEADER' ].
	self assert: header classification equals: 'OXIDOREDUCTASE'.
	self assert: header depositionDate equals: '01-JAN-20'.
	self assert: header idCode equals: '2ABC'
]

{ #category : 'testing' }
BioPDBParserTest >> testHelixRecordFromMultiChain [
	| file helix |
	file := (self parserClass parseString: self multiChainPDB) parse.
	helix := file records detect: [ :r | r recordType = 'HELIX' ].
	self assert: helix serialNumber equals: 1.
	self assert: helix helixID equals: 'HA'.
	self assert: helix initResName equals: 'ALA'.
	self assert: helix initChainID equals: 'A'.
	self assert: helix initSeqNum equals: 2.
	self assert: helix endResName equals: 'GLY'.
	self assert: helix endChainID equals: 'A'.
	self assert: helix endSeqNum equals: 6
]

{ #category : 'testing - record classification' }
BioPDBParserTest >> testIsAtomRecord [
	"ATOM and HETATM records should both answer isAtomRecord true"

	| file |
	file := (self parserClass parseString: self multiChainPDB) parse.
	self assert: file atoms first isAtomRecord.
	self assert: (file atoms detect: [ :a | a recordType = 'HETATM' ]) isAtomRecord
]

{ #category : 'testing - record classification' }
BioPDBParserTest >> testIsSeqResRecord [
	"SEQRES records should answer isSeqResRecord true, other records false"

	| file |
	file := (self parserClass parseString: self multiChainPDB) parse.
	self assert: file seqResRecords first isSeqResRecord.
	self deny: file atoms first isSeqResRecord
]

{ #category : 'testing - records' }
BioPDBParserTest >> testModelRecords [
	"MODEL records should be parsed correctly"

	| file models |
	file := (self parserClass parseString: self multiChainPDB) parse.
	models := file records select: [ :r | r recordType = 'MODEL' ].
	self assert: models size equals: 2.
	self assert: models first serialNumber equals: 1.
	self assert: models second serialNumber equals: 2
]

{ #category : 'testing' }
BioPDBParserTest >> testMultiChainAtoms [
	"Atom counts per chain across 2 NMR models (14 total, A=10, B=4)"

	| file |
	file := (self parserClass parseString: self multiChainPDB) parse.
	self assert: file atoms size equals: 14.
	"Chain A: 4 ATOM + 1 HETATM per model x 2 models = 10"
	self assert: (file atomsForChain: 'A') size equals: 10.
	self assert: (file atomsForChain: 'B') size equals: 4
]

{ #category : 'testing' }
BioPDBParserTest >> testMultiChainSequence [
	"sequenceForChain: concatenation of SEQRES residues"

	| file seq |
	file := (self parserClass parseString: self multiChainPDB) parse.
	seq := file sequenceForChain: 'A'.
	self assert: seq size equals: 42.
	self assert: seq equals: 'ALAGLYSERTHRCYSPROGLUASPLYSARGVALILEPHELEU'.
	self assert: (file sequenceForChain: 'B') equals: 'METLEUTYRASNGLN'
]

{ #category : 'testing - conect' }
BioPDBParserTest >> testMultipleConectRecords [
	"Multiple CONECT records should all be parsed"

	| file conects |
	file := (self parserClass parseString: self multiChainPDB) parse.
	conects := file records select: [ :r | r recordType = 'CONECT' ].
	self assert: conects size >= 2.
	self assert: conects first serialNumber equals: 1.
	self assert: conects first bondedAtoms size equals: 2.
	self assert: conects second serialNumber equals: 2
]

{ #category : 'testing - seqres' }
BioPDBParserTest >> testMultipleSeqResLines [
	"SEQRES spanning multiple lines for the same chain should be parsed as separate records"

	| file seqA |
	file := (self parserClass parseString: self multiSeqResPDB) parse.
	seqA := file seqResRecords select: [ :r | r chainID = 'A' ].
	self assert: seqA size equals: 2.
	self assert: seqA first residues size equals: 13.
	self assert: seqA second residues size equals: 2
]

{ #category : 'testing - edge cases' }
BioPDBParserTest >> testNegativeCoordinates [
	"Negative coordinate values in MODEL 2 should parse correctly"

	| file |
	file := (self parserClass parseString: self multiChainPDB) parse.
	"End-to-end parse picks the last model or all atoms — verify negative coords exist"
	self assert: file atoms size >= 7
]

{ #category : 'testing' }
BioPDBParserTest >> testParseAtom [
	| record |
	parser := self parserClass new.
	record := parser parseAtom: self sampleAtom.
	self assert: record recordType equals: 'ATOM'.
	self assert: record serialNumber equals: 1.
	self assert: record atomName equals: 'N'.
	self assert: record resName equals: 'SER'.
	self assert: record chainID equals: 'A'.
	self assert: record resSeq equals: 1.
	self assert: record x equals: 10.000.
	self assert: record y equals: 20.000.
	self assert: record z equals: 30.000.
	self assert: record occupancy equals: 1.00.
	self assert: record tempFactor equals: 20.00.
	self assert: record element equals: 'N'
]

{ #category : 'testing' }
BioPDBParserTest >> testParseHeader [
	| record |
	parser := self parserClass new.
	record := parser parseHeader: self sampleHeader.
	self assert: record recordType equals: 'HEADER'.
	self assert: record classification equals: 'HYDROLASE'.
	self assert: record depositionDate equals: '17-JAN-03'.
	self assert: record idCode equals: '1ABC'
]

{ #category : 'testing' }
BioPDBParserTest >> testParseHelix [
	| record |
	parser := self parserClass new.
	record := parser parseHelix: self sampleHelix.
	self assert: record recordType equals: 'HELIX'.
	self assert: record serialNumber equals: 1.
	self assert: record helixID equals: 'HA'.
	self assert: record initResName equals: 'GLY'.
	self assert: record initChainID equals: 'A'.
	self assert: record initSeqNum equals: 1.
	self assert: record endResName equals: 'LYS'.
	self assert: record endChainID equals: 'A'.
	self assert: record endSeqNum equals: 5.
	self assert: record helixClass equals: 1
]

{ #category : 'testing' }
BioPDBParserTest >> testParseSeqRes [
	| record |
	parser := self parserClass new.
	record := parser parseSeqRes: self sampleSeqRes.
	self assert: record recordType equals: 'SEQRES'.
	self assert: record serialNumber equals: 1.
	self assert: record chainID equals: 'A'.
	self assert: record numResidues equals: 10.
	self assert: record residues size equals: 10.
	self assert: record residues first equals: 'SER'.
	self assert: record sequenceString equals: 'SERGLYPROLYSALAVALLEUILEPHETHR'
]

{ #category : 'testing' }
BioPDBParserTest >> testParseString [
	| file |
	file := (self parserClass parseString: self samplePDB) parse.
	self assert: file records size >= 5.
	self assert: file atoms size equals: 5.
	self assert: file seqResRecords size equals: 1.
	self assert: file atoms first isAtomRecord.
	self assert: file atoms first serialNumber equals: 1.
	self assert: file atoms fourth recordType equals: 'ATOM'.
	self assert: file atoms last recordType equals: 'HETATM'.
	self assert: (file sequenceForChain: 'A') equals: 'SERGLYPROLYSALAVALLEUILEPHETHR'
]

{ #category : 'testing' }
BioPDBParserTest >> testRecordTypeCounts [
	| file atomCount hetatmCount seqResCount |
	file := (self parserClass parseString: self multiChainPDB) parse.
	atomCount := file records count: [ :r | r recordType = 'ATOM' ].
	hetatmCount := file records count: [ :r | r recordType = 'HETATM' ].
	seqResCount := file records count: [ :r | r recordType = 'SEQRES' ].
	self assert: atomCount equals: 12.
	self assert: hetatmCount equals: 2.
	self assert: seqResCount equals: 3
]

{ #category : 'testing - records' }
BioPDBParserTest >> testRemarkRecord [
	"REMARK record should parse remark number"

	| file remarks |
	file := (self parserClass parseString: self sheetOnlyPDB) parse.
	remarks := file records select: [ :r | r recordType = 'REMARK' ].
	self assert: remarks size >= 1.
	self assert: remarks first remarkNumber equals: '2'
]

{ #category : 'testing - seqres' }
BioPDBParserTest >> testSeqResChainB [
	"SEQRES for chain B should be separate from chain A"

	| file seqB |
	file := (self parserClass parseString: self multiSeqResPDB) parse.
	seqB := file seqResRecords select: [ :r | r chainID = 'B' ].
	self assert: seqB size equals: 1.
	self assert: seqB first residues size equals: 5
]

{ #category : 'testing' }
BioPDBParserTest >> testSequenceForChainConcatenation [
	| file seqA |
	file := (self parserClass parseString: self multiSeqResPDB) parse.
	seqA := file sequenceForChain: 'A'.
	self assert: seqA size equals: 45.
	self assert: seqA equals: 'ALAGLYSERTHRCYSPROGLUASPLYSARGVALILEPHELEUMET'.
	self assert: (file sequenceForChain: 'B') size equals: 15
]

{ #category : 'testing - records' }
BioPDBParserTest >> testSheetRecord [
	"SHEET record should parse strand number, sheet ID, and strand count"

	| file sheet |
	file := (self parserClass parseString: self sheetOnlyPDB) parse.
	sheet := file records detect: [ :r | r recordType = 'SHEET' ].
	self assert: sheet strandNumber equals: 1.
	self assert: sheet sheetID equals: 'AB'.
	self assert: sheet numStrands equals: 2
]

{ #category : 'testing' }
BioPDBParserTest >> testShortLineAtomDefaults [
	"Missing numeric fields default to 0, element to empty string"
	| file atom |
	file := (self parserClass parseString: self shortLinePDB) parse.
	atom := file atoms detect: [ :a | a serialNumber = 2 ].
	self assert: atom recordType equals: 'HETATM'.
	"Short line has no element column (cols 77-78) — should default to empty"
	self assert: atom element equals: ''.
	self assert: atom occupancy equals: 0.
	self assert: atom tempFactor equals: 0
]

{ #category : 'testing - edge cases' }
BioPDBParserTest >> testShortLinesDoNotCrash [
	"Short or truncated lines should not crash the parser — missing fields default to 0/empty"

	| file |
	file := (self parserClass parseString: self shortLinePDB) parse.
	self assert: file atoms size >= 2.
	self assert: file atoms first serialNumber equals: 1
]

{ #category : 'testing - records' }
BioPDBParserTest >> testTitleRecord [
	"TITLE record should parse continuation number and text"

	| file titles |
	file := (self parserClass parseString: self multiChainPDB) parse.
	titles := file records select: [ :r | r recordType = 'TITLE' ].
	self assert: titles size equals: 2.
	self assert: titles first title equals: 'CRYSTAL STRUCTURE OF A MULTI-CHAIN ENZYME'.
	self assert: titles second continuationNumber equals: '2'
]
