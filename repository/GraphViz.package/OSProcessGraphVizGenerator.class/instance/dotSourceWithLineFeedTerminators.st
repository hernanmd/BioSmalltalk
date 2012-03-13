generating
dotSourceWithLineFeedTerminators
	"The external programs expect <lf> line terminators on Unix systems"

	^ self graph dot copyReplaceAll: String cr with: String lf