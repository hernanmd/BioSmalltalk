Extension { #name : #BioFastaRecord }

{ #category : #'*BioPlots' }
BioFastaRecord >> plot [
	"Answer a new <RSCanvas> with the receiver nucleotides frequencies as y-axis and the nucleotides as x-axis"

	^ self sequence plot
]

{ #category : #'*BioPlots' }
BioFastaRecord >> plotGcSkewInt [
	"Open a plot of the receiver's GC Skew with the default parameters"

	self sequence plotGcSkewInt 
]
