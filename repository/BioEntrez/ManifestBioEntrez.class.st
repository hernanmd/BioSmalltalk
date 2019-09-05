"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBioEntrez,
	#superclass : #PackageManifest,
	#category : 'BioEntrez'
}

{ #category : #'code-critics' }
ManifestBioEntrez class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#BioEntrezClient)) #'2017-04-19T09:12:59.341-03:00') )
]
