python getExample.py $1

if $? -ne 0
then
	exit 1
fi

cp template.cpp solve.cpp
