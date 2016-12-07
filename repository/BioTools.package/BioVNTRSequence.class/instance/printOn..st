printing
printOn: aStream
    " Private - See superimplementor's comment "
   
    super printOn: aStream.
"    self locus notNil
        ifTrue: [
            aStream
                nextPutAll: ' - ';
                nextPutAll: self locus asString; space ].
    self genotype notNil
        ifTrue: [ aStream
                        nextPutAll: ' - ';
                        nextPutAll: self genotype asString; space ].
    (self alleleRangeStart notNil and: [ self alleleRangeEnd notNil  ])
        ifTrue: [
            aStream
                space;
                nextPutAll: self alleleRangeStart asString;
                nextPutAll: ' - ';
                nextPutAll: self alleleRangeEnd asString ]"
