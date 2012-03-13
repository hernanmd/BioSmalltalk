private
sectionSpecs
	" Answer a Collection with raw data related with the Arlequin input format "
	
	^ { ( BioA31Spec 
				newTitle: self haplotypeListNameId
				isMandatory: true 
				defaultValue: String new
				format: $" ) .
		( BioA31Spec new
				title: self haplotypeListId;
				isMandatory: true;
				defaultValue: nil; 
				range: HaplListValues;
				format: $" ) }