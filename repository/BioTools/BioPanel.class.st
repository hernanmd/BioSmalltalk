"
Implements an abstract class of recommended panels of markers.

The primary authoritative source for FAO/ISAG-recommended microsatellite (STR) marker panels is the 2011 FAO guidelines ""Molecular Genetic Characterization of Animal Genetic Resources"" (FAO Animal Production and Health Guidelines No. 9).
These include standardized panels of ~30 microsatellite markers each (recommended for genetic diversity/characterization studies) for nine major livestock species, developed in collaboration with the ISAG–FAO Advisory Group on Animal Genetic Diversity. The full lists (with primer sequences, chromosomal locations, etc.) are in Appendix 7 of the document.

There is no single universal list of species, but the most common domestic/livestock species by global population and agricultural importance generally include cattle, pigs, chickens, sheep, goats, horses, water buffalo, donkeys, camels (dromedary/Bactrian), and sometimes dogs (for companion/ working animals) or turkeys/ducks. The FAO/ISAG panels cover the top nine livestock species above; a dedicated standardized FAO/ISAG microsatellite panel for a clear 10th (e.g., dog or turkey) is not part of the core set. ISAG has species-specific committees and parentage panels (often SNP-based now) for additional species.

- These panels prioritize neutral, highly polymorphic, easy-to-genotype loci for cross-study comparability and diversity assessment (not primarily for parentage, though some overlap exists). Many legacy datasets use them, aiding meta-analyses
- Modern shift: Microsatellites have largely been supplemented or replaced by SNP arrays for cost, throughput, and standardization, but the FAO/ISAG microsatellite panels remain valuable references (especially in lower-resource settings or for historical comparisons).
- For the latest parentage panels (often SNP-focused), check ISAG proceedings or species-specific resources.

```
BioPanel availablePanels.
```
"
Class {
	#name : 'BioPanel',
	#superclass : 'BioNamedObject',
	#classInstVars : [
		'table'
	],
	#category : 'BioTools-Panels',
	#package : 'BioTools',
	#tag : 'Panels'
}

{ #category : 'accessing' }
BioPanel class >> availablePanels [
	" Answer a <Collection> of <String> of available panels "

	^ self subclasses collect: #panelName
]

{ #category : 'accessing' }
BioPanel class >> availableSpecies [
	" Answer a <Collection> of <String> of available species in the receiver "

	^ self markersForSpecies keys
]

{ #category : 'accessing' }
BioPanel class >> markersForSpecies [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
BioPanel class >> markersForSpeciesAt: speciesName [
	" Answer a <Collection> of <BioLocus> for the receiver's panel "

	^ self markersForSpecies at: speciesName
]

{ #category : 'accessing' }
BioPanel class >> panelName [
	" Private - Answer a <String> with the panel name "
	
	^ self subclassResponsibility
]

{ #category : 'accessing' }
BioPanel class >> supportedMarkerTypes [
	" Answer a <Collection> of supported types of markers "
	
	self subclassResponsibility
]

{ #category : 'accessing' }
BioPanel class >> supportedSpecies [
	" Answer a <Collection> of <String> with species supported by the receiver "
	
	^ self markersForSpecies keys
]

{ #category : 'accessing' }
BioPanel class >> table [
	^ table
		ifNil: [ table := Dictionary new ]
]

{ #category : 'accessing' }
BioPanel class >> table: anObject [
	table := anObject
]
