 cd /c/lab7_Osadko/lab7_start_git
 touch time.html
touch readme.txt
git config --global user.name "YuraOsadko"
git config --global user.email "yurii.osadko.23@pnu.edu.ua"
 git config --list
git init
git status
echo *.txt >> .gitignore
git add *.*
git commit -m "17:48 27/11/2023 Create first commit"
git remote add origin https:/gitlab.com/yurii.osadko.23/lab7_start_git2
 ssh-keygen
git push -u origin master
git commit -a -m "18:34 27/11/2023: add time 2"
git push -u origin master
git clone git@gitlab.com:yurii.osadko.23/lab7_start_git2.git