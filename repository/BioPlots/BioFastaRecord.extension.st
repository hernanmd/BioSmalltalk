Extension { #name : #BioFastaRecord }

{ #category : #'*BioPlots' }
BioFastaRecord >> plotBarChart [
	"Answer a new <RSCanvas> with the receiver nucleotides frequencies as y-axis and the nucleotides as x-axis"

	^ self sequence plotBarChart.
]
