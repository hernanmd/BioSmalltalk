Class {
	#name : #BioEntrezParserTest,
	#superclass : #BioAbstractTest,
	#category : 'BioEntrezTests-Core'
}

{ #category : #accessing }
BioEntrezParserTest >> eResults01 [
	" Private - Sample ESearch Output 01 "
	^ '<?xml version="1.0" ?>
<!DOCTYPE eSearchResult PUBLIC "-//NLM//DTD eSearchResult, 11 May 2002//EN" "http://www.ncbi.nlm.nih.gov/entrez/query/DTD/eSearch_020511.dtd">
<eSearchResult><Count>1</Count><RetMax>1</RetMax><RetStart>0</RetStart><QueryKey>1</QueryKey><WebEnv>NCID_1_55968937_130.14.18.46_9001_1286909754_2028035256</WebEnv><IdList>
		<Id>115304323</Id>
	</IdList><TranslationSet/><QueryTranslation>AF288373.2</QueryTranslation></eSearchResult>'
]

{ #category : #accessing }
BioEntrezParserTest >> eResults02 [
	" Private - Sample ESearch Output 02 "
	^ '<?xml version="1.0" ?>
<!DOCTYPE eSearchResult PUBLIC "-//NLM//DTD eSearchResult, 11 May 2002//EN"
 "http://www.ncbi.nlm.nih.gov/entrez/query/DTD/eSearch_020511.dtd">
<eSearchResult>
<Count>255147</Count>
<RetMax>20</RetMax>
<RetStart>0</RetStart>
<QueryKey>1</QueryKey>
<WebEnv>0l93yIkBjmM60UBXuvBvPfBIq8-9nIsldXuMP0hhuMH-8GjCz7F_Dz1XL6z@397033B29A81FB01_0038SID</WebEnv>
<IdList>
<Id>229486465</Id>
<Id>229486321</Id>
<Id>229485738</Id>
<Id>229470359</Id>
<Id>229463047</Id>
<Id>229463037</Id>
<Id>229463022</Id>
<Id>229463019</Id>
<Id>229463007</Id>
<Id>229463002</Id>
<Id>229463000</Id>
<Id>229462974</Id>
<Id>229462961</Id>
<Id>229462956</Id>
<Id>229462921</Id>
<Id>229462905</Id>
<Id>229462899</Id>
<Id>229462873</Id>
<Id>229462863</Id>
<Id>229462862</Id>
</IdList>
<TranslationSet>
    <Translation>
     <From>mouse[orgn]</From>
     <To>"Mus musculus"[Organism]</To>
    </Translation>
</TranslationSet>
<TranslationStack>
   <TermSet>
    <Term>"Mus musculus"[Organism]</Term>
    <Field>Organism</Field>
    <Count>255147</Count>
    <Explode>Y</Explode>
   </TermSet>
   <OP>GROUP</OP>
</TranslationStack>
<QueryTranslation>"Mus musculus"[Organism]</QueryTranslation>
</eSearchResult>'
]

{ #category : #accessing }
BioEntrezParserTest >> testKeys01 [

	| keys |
	
	keys := BioParser tokenizeNcbiXmlEntrezResultKeys: self eResults01.
	self assert: ( keys bioHasEqualElements:  #('eSearchResult' 'Count' 'RetMax' 'RetStart' 'QueryKey' 'WebEnv' 'IdList' 'Id' 'TranslationSet' 'QueryTranslation') )
]

{ #category : #accessing }
BioEntrezParserTest >> testKeys02 [

	| keys |
	
	keys := BioParser tokenizeNcbiXmlEntrezResultKeys: self eResults02.
	self assert: ( keys bioHasEqualElements:  #('TranslationSet' 'TermSet' 'Term' 'From' 'QueryKey' 'Id' 'Explode' 'RetMax' 'IdList' 'WebEnv' 'To' 'TranslationStack' 'Field' 'Translation' 'RetStart' 'eSearchResult' 'OP' 'Count' 'QueryTranslation') )
]
