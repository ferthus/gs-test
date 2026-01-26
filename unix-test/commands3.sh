#1. Commands used in day-day work
 - pwd
 - cd
 - mkdir
 - | #pipes
 - cat 
 - less
 - #link I don't remember
 - chmod
 - source
 - whoami
 - touch
 - su, sudo
 - cp
 - vi, echo, pi, exit, clear, ls, rm, mv, ENV, export

#2. Using ‘find’ cmd,find the files>1G and remove it
find ./ -type f -size +1G -delete

#2.1 Sort  the results of find command in descending order by size of each file
find -type -f -exec du -h {} \; | sort -rh

#2.2 Show hidden files of current directory
ls -la

#2.3 Show files greater than 3 GB on current directory

find ./ -type f -size +3G

#2.4 There is a file with fruit values duplicated, create a file with unique values.

cat fruits.txt | sort | uniq > result.txt

#2.5 egrep
"This command works like grep -E but errors messages are different, this command is a grep version to use extended regular expressions."

#2.6 Difference between cmp and diff
"cmp
-Byte by byte comparision performed for two files comparision and displays the first mismatch byte.
-cmp returns the 1st byte and the line no of the fileone to make the changes to make the fileone identical to filetwo.
-Directory names can not be used.

diff
-Indicates the changes that are to be done to make the files identical.
-returns the text of filetwo that is different from filetwo.
-Directory names can be used"

#2.7 how can you know if a system was rebooted?
"uptime" command

#2.8 Drop empty lines from a file using sed
sed -i '' '/^\s*$/d' "file1.txt"

#2.8.1 Delete 7th line from a file
sed -i '' '5d' file.txt

#2.8.2 Delete the last line from a file
sed -i '' '$d' "fruits.txt"

#2..8.3 Replace text
sed -i '/text_to_be_replaced/c\new_text' fruits.txt

#2.9 How to check the os and kernel version
uname -r
cat /etc/os-release
hostnamectl

#2.10 Count the number of lines in a file
grep -c . $file_path
wc -l $file_path

#2.11 Count the number of "system" word in /etc/group file
#grep -c "system" /etc/group
#cat /etc/group | grep -c "system"
grep -o "system" /etc/group | wc -l

#2.12 Show the number of lines using less command
less -N $file_path

#3. Have you written any script, if yes,describe a sample

#count the number of words on 

#4. Field separator in awk – to find/extract 12th row and 4th column from a file
awk 'FNR==7{print $2}' fruits2.txt

#6. Write a script to find first 20 fibonacci series(1 1 2 3 5 8 13...until 20th series)

#7. Write a unix script to query a table, store the output in a file and mail it

#8. How to find the open files for a process id
ps -aef | grep $process_name

#9. How to find top consuming memory processes
top -o MEM

#14. Print the last ten records by the second field in ascending order.
tail -n 10 file1.txt | sort -k 2 -r

#16. how to find largest file /directories and also inline directory upto 3 level ?
find $dir_path -maxdepth 3 -exec du -h {} \; | sort -rh | head -n 1

#19. how to execute bash script in debug mode?
bash -x script.sh

#20. How do you handle file transfer to a remote host?
scp file.txt user@x.x.x.x:/path/to/save/file-name.txt -i key

#18. what is inode?
"inode is a map table between numbers and files references, each number corresponds to a file,
each register in inode tables contains a metadata for a file"
"To print inode number for a file you can use ls -i"
"To check the inodes max number you can use df -i"

#17. what if a daily job is taking much time than usual, how do we solve the issue?

#13. What steps will you take if an issue arises indicating that the host is unavailable?

#11. Difference between the tar and gzip commands.
"Tar is a way to creates one file from various files, by other hand gzip is a tool to compress information,
So common, this two tools are applied to create software distributions"

#10. What will you do if a job that takes 1 min daily for its completion
#    but its running yet in unix server(its connecting to db too)
#    - What will be the approach to check

#5. Cut command


# dmesg | grep eth0