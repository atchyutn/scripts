
while true;
do
echo "enter branch name"
read branchName
git checkout $branchName
git pull origin $branchName
done
