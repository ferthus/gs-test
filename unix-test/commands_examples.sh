
ls -la | sort -k 5 -n    #ascendant
ls -la | sort -k 5 -n -r #descendant
ls -la | grep "^\-.*$" | sort -k 5 -n -r | head -n 3 

find . -size +1k 
find . -size +1k -exec ls -la {} \;
find . -size +1k -exec ls -name "*.log" -la {} \;

ps | awk '{printf("%s\t%s\n", $1, $3)}' 

sed -i '' '/^\s*$/d' "file1.txt"