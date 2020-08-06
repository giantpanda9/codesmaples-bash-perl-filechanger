#/bin/sh

FOLDER="Folder one/"
if [ -d "$FOLDER" ]; then rm -R -f "$FOLDER"; fi
cp -r FileSourceForReset/* ./
echo "Files reset"
