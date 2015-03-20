filtering-blast-definitions
definitionsBeginWith: aTermCollection
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	<userComment: 'Select hits with definition lines (for the database sequence) matching at the beggining of the definition string. A definition string is a mandatory description of the origin and function of a sequence, and is typically found in FASTA descriptions. Although the string line is structured, it doesn''t use a controlled vocabulary, which means you can''t be sure which words will or won''t appear. In the BlastOutput XML file it matches with the Hit_def node. Examples:
	
	''H.sapiens CDK2 mRNA.'' beginsWith: ''H.sapiens CDK2''. ==> true
	''H.sapiens CDK2 mRNA.'' beginsWith: ''H.sapiens'' ==> true'>

	^ aTermCollection size = 1
		ifTrue: [ 
			self 
				definition: aTermCollection anyOne
				condition: #beginsWith: ]
		ifFalse: [
			self 
				definitions: aTermCollection 
				condition: #beginsWith: ]