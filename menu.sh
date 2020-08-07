#/bin/sh
while true; do
  header='What do you wish to do: '
  menu=("[BASH]Check files in folder ./testFolder/Folder one/Folder Two" "[BASH]Reset files in folder ./testFolder/Folder one/Folder Two" "[BASH]Read passwd[default]" "[BASH]Read passwd[expected]" "[BASH]Read passwd[default] - debug mode" "[BASH]Read passwd[expected] - debug mode" "[Perl]Check files in folder ./testFolder/Folder one/Folder Two" "[Perl]Read passwd[default]" "[Perl]Read passwd[expected]" "[Perl]Read passwd[default] - debug mode" "[Perl]Read passwd[expected] - debug mode" "Exit")
  
  select option in "${menu[@]}"; do
    case $option in
      "[BASH]Check files in folder ./testFolder/Folder one/Folder Two")
        echo "Checking files in ./testFolder/Folder one/Folder Two folder"
        cd ./testFolder
        ./renameFiles.sh
        cd ..
        break
        ;;
      "[BASH]Reset files in folder ./testFolder/Folder one/Folder Two")
        echo "Resetting files in ./testFolder/Folder one/Folder Two"
        cd ./testFolder
        ./resetFiles.sh
        cd ..
        break
        ;;
      "[BASH]Read passwd[default]")
        echo "Reading passwd with the data provided in the task"
        cd ./testFolder
        ./readPasswd.sh
        cd ..
        break
        ;;
      "[BASH]Read passwd[expected]")
        echo "Reading passwd with the expected output"
        cd ./testFolder
        ./readPasswd.sh -f"passwdexpected"
        cd ..
        break
        ;;
      "[BASH]Read passwd[default] - debug mode")
        echo "Reading passwd with the data provided in the task"
        cd ./testFolder
        ./readPasswd.sh -d
        cd ..
        break
        ;;
      "[BASH]Read passwd[expected] - debug mode")
        echo "Reading passwd with the expected output"
        cd ./testFolder
        ./readPasswd.sh -f"passwdexpected" -d
        cd ..
        break
        ;;
       "[Perl]Check files in folder ./testFolder/Folder one/Folder Two")
        echo "Checking files in ./testFolder/Folder one/Folder Two folder using Perl"
        perl ./testFolder/renameFiles.pl
        break
        ;;
       "[Perl]Read passwd[default]")
        echo "Reading passwd with the data provided in the task"
        perl ./testFolder/readPasswd.pl
        break
        ;;
      "[Perl]Read passwd[expected]")
        echo "Reading passwd with the expected output using Perl"
        perl ./testFolder/readPasswd.pl -filename="passwdexpected"
        break
        ;;
      "[Perl]Read passwd[default] - debug mode")
        echo "Reading passwd with the data provided in the task using Perl"
        perl ./testFolder/readPasswd.pl -debug
        break
        ;;
      "[Perl]Read passwd[expected] - debug mode")
        echo "Reading passwd with the expected output using Perl" 
        perl ./testFolder/readPasswd.pl -filename="passwdexpected" -debug
        break
        ;;
      "Exit")
         break 2
         ;;
      *) echo "Selected option is invalid";;
    esac
  done
done
