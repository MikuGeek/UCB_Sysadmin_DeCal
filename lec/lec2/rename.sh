#! /bin/sh
FILE_LST=$(ls *.txt)
for FILE in $FILE_LST; do
	mv $FILE new_$FILE
done
