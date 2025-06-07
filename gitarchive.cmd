@ECHO OFF
git tag archive/%1 %1
git branch -d %1 %2