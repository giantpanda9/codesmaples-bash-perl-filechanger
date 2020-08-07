#/bin/sh
while true; do
  header='What do you wish to do: '
  menu=("Check files in folder ./testFolder/Folder one/Folder Two" "Reset files in folder ./testFolder/Folder one/Folder Two" "Read passwd[default]" "Read passwd[expected]" "Read passwd[default] - debug mode" "Read passwd[expected] - debug mode" "Exit")
  
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
      "Read passwd[default]")
        echo "Reading passwd with the data provided in the task"
        cd ./testFolder
        ./readPasswd.sh
        cd ..
        break
        ;;
      "Read passwd[expected]")
        echo "Reading passwd with the expected output"
        cd ./testFolder
        ./readPasswd.sh -f"passwdexpected"
        cd ..
        break
        ;;
        "Read passwd[default] - debug mode")
        echo "Reading passwd with the data provided in the task"
        cd ./testFolder
        ./readPasswd.sh -d
        cd ..
        break
        ;;
      "Read passwd[expected] - debug mode")
        echo "Reading passwd with the expected output"
        cd ./testFolder
        ./readPasswd.sh -f"passwdexpected" -d
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
