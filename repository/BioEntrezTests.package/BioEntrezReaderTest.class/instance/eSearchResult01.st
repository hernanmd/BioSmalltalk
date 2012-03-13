accessing
eSearchResult01
	" This is the output of #entrezClientSample02 "

	^ '<?xml version="1.0" ?>
<!DOCTYPE eSearchResult PUBLIC "-//NLM//DTD eSearchResult, 11 May 2002//EN" "http://www.ncbi.nlm.nih.gov/entrez/query/DTD/eSearch_020511.dtd">
<eSearchResult><Count>9</Count><RetMax>9</RetMax><RetStart>0</RetStart><IdList>
		<Id>57240072</Id>
		<Id>57240071</Id>
		<Id>6273287</Id>
		<Id>6273291</Id>
		<Id>6273290</Id>
		<Id>6273289</Id>
		<Id>6273286</Id>
		<Id>6273285</Id>
		<Id>6273284</Id>
	</IdList><TranslationSet><Translation>     <From>Opuntia</From>     <To>"Opuntia"[Organism] OR Opuntia[All Fields]</To>    </Translation></TranslationSet><TranslationStack>   <TermSet>    <Term>"Opuntia"[Organism]</Term>    <Field>Organism</Field>    <Count>201</Count>    <Explode>Y</Explode>   </TermSet>   <TermSet>    <Term>Opuntia[All Fields]</Term>    <Field>All Fields</Field>    <Count>413</Count>    <Explode>Y</Explode>   </TermSet>   <OP>OR</OP>   <OP>GROUP</OP>   <TermSet>    <Term>rpl16[All Fields]</Term>    <Field>All Fields</Field>    <Count>12302</Count>    <Explode>Y</Explode>   </TermSet>   <OP>AND</OP>  </TranslationStack><QueryTranslation>("Opuntia"[Organism] OR Opuntia[All Fields]) AND rpl16[All Fields]</QueryTranslation></eSearchResult>'