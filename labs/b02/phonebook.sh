# !/bin/sh

file_path="phonebook.txt"

define_file() {
	if [ -e "$file_path" ]; then
		return 1
	else
		return 0
	fi
}

if ! define_file; then
	touch "$file_path"
fi

if [ "$1" = "new" ]; then
	if [ "$#" -eq 3 ]; then
		echo "$2 $3" >>"$file_path"
	else
		echo "Usage: $0 new <name> <xxx-xxx-xxxx>"
	fi
elif [ "$1" = "list" ]; then
	if [ "$#" -eq 1 ]; then
		cat "$file_path"
	else
		echo "Usage: $0 list"
	fi
elif [ "$1" = "lookup" ]; then
	if [ "$#" -eq 2 ]; then
		grep "^$2" $file_path
	else
		echo "Usage: $0 lookup <name> | <number>"
	fi
elif [ "$1" = "remove" ]; then
	if [ "$#" -eq 3 ]; then
		sed -i "/$2 $3/d" $file_path
	else
		echo "Usage: $0 remove <name> <number>"
	fi
elif [ "$1" = "clear" ]; then
	if [ "$#" -eq 1 ]; then
		echo >$file_path
	else
		echo "Usage: $0 clear"
	fi
fi
