Acts as a global repository of organisms. Holds a Collection of population repositories  (instances of BioPopRepository).  Can be used wiith BioSpeciesList to to grab names and build its Collection of population repositories.

You can add, remove or query repositories. Populated repositories are those which contains BioPopRepository which are actually populated.

BioSpecies release.
BioSpecies initialize.
BioSpecies repositories.
BioSpecies populatedRepositories.
(BioSpecies repositoryFor: 'Cattle') repositoryVersions.
(BioSpecies repositoryFor: 'Cattle') repositoryVersionAt: 'Mason'.
