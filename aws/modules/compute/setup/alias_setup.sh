echo ==\>setting up alias...
# define variablV
MESSAGE="# add alias"

# define function 
insertAlias() {
	sed -i "$ a # add alias" ./.bashrc 
	sed -i '$ a alias python="python3"' ./.bashrc 
	sed -i '$ a alias activate="source ~/.venv/bin/activate"' ./.bashrc
	
	sed -i '$ a alias base="cd ~/base"' ./.bashrc 
	sed -i '$ a alias cloud="cd ~/cloud"' ./.bashrc 
	sed -i '$ a alias setup="cd ~/base/setup"' ./.bashrc 
	sed -i '$ a alias sandbox="cd ~/base/sandbox"' ./.bashrc 
	sed -i '$ a alias bn="cd ~/base/bothnode"' ./.bashrc 
	sed -i '$ a alias bni="cd ~/base/bothnode-infra"' ./.bashrc 
}

setup() {
	result=$(grep "$MESSAGE" ./.bashrc)

	if [ "$result" = "" ];
	then 
		insertAlias
		echo "alias has been set up."
	else
		echo "alias already defined."
	fi
}

# main
setup

