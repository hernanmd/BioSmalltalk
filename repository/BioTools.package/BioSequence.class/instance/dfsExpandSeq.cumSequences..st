accessing
dfsExpandSeq: currentDFSNode cumSequences: cumList

    currentDFSNode beVisited.
    currentDFSNode remainingSeqSize > 0
		ifTrue: [ " construct neighbors of currentDFSNode based on remaining sequence "
			(self disambiguateLetter: (currentDFSNode remainingSeqAt: 1)) do: [ : nucleotide |
				currentDFSNode neighbors add: 
					(BioDFSNode 
						newWith: currentDFSNode cumulSeq , nucleotide asString 
						remaining: currentDFSNode remainSeq allButFirst) ].
        "# implement recursive DFS"
			currentDFSNode neighbors do: [ : neighbor | 
				neighbor isVisited
					ifFalse: [ self dfsExpandSeq: neighbor cumSequences: cumList ] ] ]
		ifFalse: [ 
			currentDFSNode remainingSeqSize = 0
				ifTrue: [ cumList add: currentDFSNode cumulSeq ] ]

