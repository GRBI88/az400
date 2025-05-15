

#### Merge conflicts

```bash

NAME="gittest5"

mkdir $NAME
cd $NAME
git init
echo "Morten" >> morten.txt
git add morten.txt
git commit -m "Init"


git checkout -b changename
sed 's/Morten/Morten la Cour/g' morten.txt -i
git add morten.txt
git commit -m "Changed name"
git checkout master

git checkout -b addlines
echo -e "\n\nintegration-it" >> morten.txt
git add morten.txt
git commit -m "Added company"
git checkout master


git merge addlines


git checkout changename
git merge master

### Will have merge conflicts

vim +'normal ggddj4ddjdd' +wq morten.txt



git add .
git commit -m "merged"
git checkout master
git merge changename

git branch -d changename
git branch -d addlines





cd ..
rm -r --force $NAME



```