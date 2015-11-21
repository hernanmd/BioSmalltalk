accessing
disambiguate
    " Answer a <Collection> of receiver's with resolved ambiguity codes for the receiver's alphabet "

    | allSeqs |
   
    allSeqs := self allocateSequences.           
    seq do: [ : letter | self disambiguate: letter in: allSeqs].
    ^ allSeqs

