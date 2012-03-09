accessing
guessAlphabetFrom: aString
	" Answer a class with the guessed alphabet from analyzing aString "
	
	| normalizedString atgcCount total |
	
	normalizedString := aString asLowercase copyWithoutAll: self ambiguityCodes.
	atgcCount := 'atgcn' inject: 0 into: [: sum : each | sum + ( normalizedString occurrencesOf: each ) ].
	( total := aString size ) = 0
		ifTrue: [ self signalInvalidObject: 'Empty sequence, cannot guess alphabet' translated ].
	
	^ ( atgcCount / total ) > self guessAlphabetThreshold
		ifTrue: [ 
			( BioIUPACAmbiguousDNA hasAmbiguousBases: aString )
				ifTrue: [ BioIUPACAmbiguousDNA ]
				ifFalse: [ BioIUPACUnambiguousDNA ] ]
		ifFalse: [ 
			| uCount |
			uCount := normalizedString occurrencesOf: $u.
			( atgcCount + uCount ) / total > self guessAlphabetThreshold
				ifTrue: [ 
					( BioIUPACUnambiguousRNA hasAmbiguousBases: aString )
						ifTrue: [ BioIUPACAmbiguousRNA ]
						ifFalse: [ BioIUPACUnambiguousRNA ] ]
				ifFalse: [ BioIUPACProtein ] ]
			
"
sub _guess_alphabet {
   my ($self) = @_;
   my ($str,$str2,$total,$atgc,$u,$type);

   $str = $self->seq();
   $str =~ s/\-\.\?//g;

   $total = CORE::length($str);
   if( $total == 0 ) {
       $self->throw(" "Got a sequence with no letters in - " " .
		    " "cannot guess alphabet [$str]" " );
   }
   
   $u = ($str =~ tr/Uu//);
   $atgc = ($str =~ tr/ATGCNatgcn//);
   
   if( ($atgc / $total) > 0.85 ) {
       $type = 'dna';
   } elsif( (($atgc + $u) / $total) > 0.85 ) {
       $type = 'rna';
   } else {
       $type = 'protein';
   }

   $self->alphabet($type);
   return $type;
}
"
