#/bin/sh
while true; do
  header='What do you wish to do: '
  menu=("Check files in folder ./testFolder/Folder one/Folder Two" "Reset files in folder ./testFolder/Folder one/Folder Two" "Exit")
  
  select option in "${menu[@]}"; do
    case $option in
      "Check files in folder ./testFolder/Folder one/Folder Two")
        echo "Checking files in ./testFolder/Folder one/Folder Two folder"
        cd ./testFolder
        ./renameFiles.sh
        cd ..
        break
        ;;
      "Reset files in folder ./testFolder/Folder one/Folder Two")
        echo "Resetting files in ./testFolder/Folder one/Folder Two"
        cd ./testFolder
        ./resetFiles.sh
        cd ..
        break
        ;;
      "Exit")
         break 2
         ;;
      *) echo "Selected option is invalid";;
    esac
  done
done
