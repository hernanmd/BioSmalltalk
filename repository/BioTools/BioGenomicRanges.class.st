"
A genomic range represents a Collection of genomic locations (regions or intervals) and associated annotations, enabling to attach chromosome coordinates, sequence name, and a strand.

- Each genomic range is described by 
-- A chromosome name, 
-- A start
-- An end
-- A strand.
- start and end are both considered included into the interval and represents 1-based positions relative to the 5’ end of the plus strand of the chromosome, even when the range is on the minus strand.



"
Class {
	#name : #BioGenomicRanges,
	#superclass : #BioNamedObject,
	#category : #'BioTools-Biological'
}

{ #category : #examples }
BioGenomicRanges class >> example01 [
"GRanges(seqnames=Rle(c('chr1', 'chr2', 'chr3'), c(3, 3, 4)),
      IRanges(1:10, width=5), strand='-',
      score=101:110, GC = runif(10))"

	BioGenomicRanges new
		seqNames: (RunArray runs: #('chr1' 'chr2' 'chr3') values: #(3 3 4));
		yourself
		

]
