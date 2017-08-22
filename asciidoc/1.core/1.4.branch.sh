#!/bin/bash
set -x
set -e
rm -rf 1.4.1
mkdir 1.4.1
cd 1.4.1
git init
echo newfile > file1
git add file1
git commit -am 'new file1'
git status
git branch newfeature                      # Create the 'newfeature' branch
git status                                 # You are still on the master branch!
git branch                                 # git branch shows the branches in your repository
echo Line_master1 >> file1                 # add Line_master1
git commit -am 'master change'             # add, commit and message
git log --decorate --graph --oneline       # graphical view of this branch
git log --decorate --graph --oneline --all # graphical view of all branches
git checkout newfeature                    # Check out the newfeature branch
cat file1                                  # This has been checked out at the 'branch point'
echo Line_feature1 >> file1                # add Line_feature1
git commit -am 'feature change'            # add, commit and message
git log --decorate --graph --oneline --all # graphical view of all branches
git checkout master                        # checkout the master branch
cat file1                                  # The feature change is not there
git status
cd -
rm -rf 1.4.1

rm -rf 1.4.2
mkdir 1.4.2
cd 1.4.2
git clone https://github.com/ianmiell/learn-git-the-hard-way.git
cd learn-git-the-hard-way
git log 
git checkout 76d43b6b66f295c0a6c8fc738a3487cd31aea136 
cd ../..
rm -rf 1.4.2
