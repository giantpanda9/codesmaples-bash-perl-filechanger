#/bin/sh

FOLDER="Folder one/"
files="$(find -L "$FOLDER" -type f)"
i=1
echo "$files" | while read file; do
  path=$(dirname "$file")
  extensionfilename=$(basename -- "$file")
  extension="${extensionfilename##*.}"
  filename="${extensionfilename%.*}"

  if [[  $filename=~/[^a-zA-Z0-9]/ && (${#extensionfilename} -lt 32) ]]; then
   echo "$filename is fine"
  else
   newfilename=`echo "$filename" | sed -e "s/[^a-zA-Z0-9]//g"`
   #trim the file name to 8 characters thus achieving
   #the 8+3 filename+extension style (DOS File name format)
   #which meet the task to reduce the filename length to be 
   #less than 32 characters(including extension) - e.g.
   # 8+3 < 32
   newfilename=${newfilename:0:8} 
   newfilename="$newfilename$i"
   ((i=i+1))
   newfilepath="$path/$newfilename.$extension"
   echo "moving $file to $newfilepath in order to rename it"
   $(mv "$file" "$newfilepath")
  fi
done
