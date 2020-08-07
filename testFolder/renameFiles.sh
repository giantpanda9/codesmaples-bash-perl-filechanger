#/bin/sh

FOLDER="Folder one/" # Setting the level one folder name
files="$(find -L "$FOLDER" -type f)" # checking if there files somewhere and store them
i=1 # count for a new file name
echo "$files" | while read file; do # looping through files we received
  path=$(dirname "$file") # first we get the path part
  extensionfilename=$(basename -- "$file") # then filename with extension part
  extension="${extensionfilename##*.}" # get only file extension
  filename="${extensionfilename%.*}" # get the file name
  # check if filename without extension including correct characters only and whole file name not greater then 32 characters
  if [[  $filename=~/[^a-zA-Z0-9]/ && (${#extensionfilename} -lt 32) ]]; then
   echo "$filename is fine" # if so skip the file
  else # else fix it
   newfilename=`echo "$filename" | sed -e "s/[^a-zA-Z0-9]//g"`
   #trim the file name to 8 characters thus achieving
   #the 8+3 filename+extension style (DOS File name format)
   #which meet the task to reduce the filename length to be 
   #less than 32 characters(including extension) - e.g.
   # 8+3 < 32 - just small funny thing related to DOS
   newfilename=${newfilename:0:8} # cut the file name to 8 characters
   newfilename="$newfilename$i" # and attach the count value, if special symbols would be allowed then it will be ~1 - more like in DOS
   ((i=i+1)) # increase the coutn value
   newfilepath="$path/$newfilename.$extension" # build the new file path
   echo "moving $file to $newfilepath in order to rename it" # echo debug information
   $(mv "$file" "$newfilepath") # rename the file to new file name
  fi # exit if
done # exit loop
