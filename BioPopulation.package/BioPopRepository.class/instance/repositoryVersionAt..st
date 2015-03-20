accessing
repositoryVersionAt: aRepoVersionName

	^ self repositoryVersions detect:[: repoVersions | 
		repoVersions name = aRepoVersionName ]