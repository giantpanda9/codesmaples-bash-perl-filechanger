#/bin/sh

debug=0 # debug need to display uid to check if only less 500 uid are included
filename="passwd" # default filename provided does not include all the users mentioned in sample output

while getopts df: params # get the parameters using getopts
do
    case "${params}" in
        d) debug=1;; # -d will be just a flag if -d set then debug mode actiavated   
        f) filename=${OPTARG};; # filename or -f just a string to specify filename
    esac
done

path="./testPasswd/$filename" # concatenat password

if [[  $debug == 0 ]]; then # check if we are in debug mode
  echo "$(awk -F':' '$3 > 500 { print $1 }' "$path" )" # normal output
else
  echo "$(awk -F':' '$3 > 500 { print $1 " " $3 }' "$path" )" # and display the additional uid
fi

