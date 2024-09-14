# define variablV
MESSAGE="# export variables"
TARGETPATH="./.bashrc"

# define function 
exportVar() {
	sed -i '$ a # export variables' $TARGETPATH
	sed -i "$ a export PATH="/usr/local/go/bin:$HOME/.local/bin:$PATH"" $TARGETPATH
  
}

setup() {
	result=$(grep "$MESSAGE" $TARGETPATH)

	if [ "$result" = "" ];
	then 
		exportVar
		echo "The shell variables have been added."
	else
		echo "The shell variables already defined."
	fi
}

# main
setup
