Class {
	#name : 'BioHaplotypeAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'haplotype'
	],
	#category : 'BioHaplotypes-Core',
	#package : 'BioHaplotypes',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioHaplotypeAnnouncement class >> haplotype: aHaplotype [

	^ self new
		  haplotype: aHaplotype;
		  yourself
]

{ #category : 'accessing' }
BioHaplotypeAnnouncement >> haplotype [

	^ haplotype
]

{ #category : 'accessing' }
BioHaplotypeAnnouncement >> haplotype: aHaplotype [

	haplotype := aHaplotype
]
