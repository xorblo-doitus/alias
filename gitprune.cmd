@ECHO OFF

IF /I NOT "%1"=="--yes" (
	@ECHO ON
	git fetch --prune
	@ECHO OFF
	
	echo Running with --yes will archive:
)


@FOR /F %%B IN ('git branch --merged main --no-color --format=%%(refname:short^)') DO (
	@IF /I NOT "%%B"=="main" (
		IF /I "%1"=="--yes" (
			echo Archiving %%B
			gitarchive %%B
		) ELSE (
			echo 	%%B
		)
	)
)