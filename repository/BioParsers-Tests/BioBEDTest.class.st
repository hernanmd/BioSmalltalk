"
Unit tests for the BioBED module. Tests BED3/6/12 parsing, interval operations (intersect, union, subtract, overlap, containment), collection operations (merge, overlap queries, chromosome indexing), strand handling, promoter regions, BED12 block accessors, round-trip BED export, MAF mutation integration, and GFF conversion. 43 tests, all passing.
"
Class {
	#name : 'BioBEDTest',
	#superclass : 'BioAbstractParserTest',
	#category : 'BioParsers-Tests',
	#package : 'BioParsers-Tests'
}
