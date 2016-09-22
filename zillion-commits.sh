#!/bin/bash

for Y in {2014..2019} 
do 
	mkdir $Y 
	cd $Y 
for M in {01..12} 
do 
	mkdir $M 
	cd $M 
for ((D=$(( 1 + $RANDOM % 1 ));D<=28;D++))
do
    mkdir $D
    cd $D 
for i in $(seq 1 $((1 + RANDOM % 10))) 
do 
	echo "$i on $M/$D/$Y" > commit.md 
export GIT_COMMITTER_DATE="$Y-$M-$D 12:$i:00 +0300" 
export GIT_AUTHOR_DATE="$Y-$M-$D 12:$i:00 +0300" 
git add commit.md -f 
git commit --date="$Y-$M-$D 12:0$i:00 +0300" -m "$i on $M $D $Y" 
done 
	cd ../ 
done 
	cd ../ 
done 
	cd ../ 
done 
git push origin master 
git rm -rf 20** 
git commit -am "cleanup" 
git push origin master

