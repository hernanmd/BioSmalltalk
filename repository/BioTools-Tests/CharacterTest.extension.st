Extension { #name : #CharacterTest }

{ #category : #'*BioTools-Tests' }
CharacterTest >> testAsAminoacidName [

	self assert: $A asAminoacidName equals: 'Alanine'.
	self assert: $R asAminoacidName equals: 'Arginine'.
	self assert: $N asAminoacidName equals: 'Asparagine'.
	self assert: $D asAminoacidName equals: 'Aspartic Acid'.
	self assert: $C asAminoacidName equals: 'Cysteine'.
	self assert: $E asAminoacidName equals: 'Glutamic Acid'.
	self assert: $Q asAminoacidName equals: 'Glutamine'.
	self assert: $G asAminoacidName equals: 'Glycine'.
	self assert: $H asAminoacidName equals: 'Histidine'.
	self assert: $I asAminoacidName equals: 'Isoleucine'.
	self assert: $L asAminoacidName equals: 'Leucine'.
	self assert: $K asAminoacidName equals: 'Lysine'.
	self assert: $M asAminoacidName equals: 'Methionine'.
	self assert: $F asAminoacidName equals: 'Phenylalanine'.
	self assert: $P asAminoacidName equals: 'Proline'.
	self assert: $S asAminoacidName equals: 'Serine'.
	self assert: $T asAminoacidName equals: 'Threonine'.
	self assert: $W asAminoacidName equals: 'Tryptophan'.
	self assert: $Y asAminoacidName equals: 'Tyrosine'.
	self assert: $V asAminoacidName equals: 'Valine'.
	
	self assert: $a asAminoacidName equals: 'Alanine'.
	self assert: $r asAminoacidName equals: 'Arginine'.
	self assert: $n asAminoacidName equals: 'Asparagine'.
	self assert: $d asAminoacidName equals: 'Aspartic Acid'.
	self assert: $c asAminoacidName equals: 'Cysteine'.
	self assert: $e asAminoacidName equals: 'Glutamic Acid'.
	self assert: $q asAminoacidName equals: 'Glutamine'.
	self assert: $g asAminoacidName equals: 'Glycine'.
	self assert: $h asAminoacidName equals: 'Histidine'.
	self assert: $i asAminoacidName equals: 'Isoleucine'.
	self assert: $l asAminoacidName equals: 'Leucine'.
	self assert: $k asAminoacidName equals: 'Lysine'.
	self assert: $m asAminoacidName equals: 'Methionine'.
	self assert: $f asAminoacidName equals: 'Phenylalanine'.
	self assert: $p asAminoacidName equals: 'Proline'.
	self assert: $s asAminoacidName equals: 'Serine'.
	self assert: $t asAminoacidName equals: 'Threonine'.
	self assert: $w asAminoacidName equals: 'Tryptophan'.
	self assert: $y asAminoacidName equals: 'Tyrosine'.
	self assert: $v asAminoacidName equals: 'Valine'.

]

{ #category : #'*BioTools-Tests' }
CharacterTest >> testAsDisambiguatedDNAFormatted [

	self assert: $a asDisambiguatedDNAFormatted equals: 'a'.
	self assert: $A asDisambiguatedDNAFormatted equals: 'A'.
	self assert: $M asDisambiguatedDNAFormatted equals: '[C/A]'.
	self assert: $N asDisambiguatedDNAFormatted equals: '[A/C/G/T]'.
	self assert: $J asDisambiguatedDNAFormatted equals: 'J'
]
