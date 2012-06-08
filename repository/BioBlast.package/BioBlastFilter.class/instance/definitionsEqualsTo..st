filtering-blast-definitions
definitionsEqualsTo: aTermCollection
	" Answer a filtered result with the receiver's definition nodes equals with the strings in aTermCollection (ignoring case) "
	<userComment: 'Select hits with definition line exactly matching a given definition string. A definition string is a mandatory description of the origin and function of a sequence, and is typically found in FASTA descriptions. Although the string line is structured, it doesn''t use a controlled vocabulary, which means you can''t be sure which words will or won''t appear. In the BlastOutput XML file it matches with the Hit_def node. Examples:
	
	''H.sapiens CDK2 mRNA.'' = ''H.sapiens CDK2 mRNA''. ==> true
	''H.sapiens CDK2 mRNA.'' = ''H.sapiens'' ==> false'>
	
	^ aTermCollection size = 1
		ifTrue: [ 
			self
				definition: aTermCollection anyOne
				condition: #sameAs: ]
		ifFalse: [	
			self 
				definitions: aTermCollection 
				condition: #sameAs: ]