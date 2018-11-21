# Git Cheatsheet
<br>

## Git Commands
---
### Creating Repositories
	git init	This command will initialize a new local project
	git clone	This command will clone a repository from a remote project

### Checking Status
	git status		This command checks the status of your repository
	git status -uno   	This command checks the status of your branch with its remote branch
	git status -vv		This command will check upstream status, doubly verbose
	git log ..@{u}		This command will check incoming changes

### Diff
	git diff --name-status ...other-branch		This lists the diff from the branch that would be merged
	git diff into-branch from-branch -- path/to/file/file.name	This will check diff of a file between branches
	git diff --name-only branch-name origin/branch-name		This will list files updated between branches

### Showing The Log
	git log -n 1					This will retrieve the last log for the branch
	git log --all --grep='abc123'	This will return all the commits having the specified string within the message
	git log --author="username"		This will return all the commits for a specific author

### Branching
	git branch					This command will list all the branches you've checked out
	git branch new-branch-name			This command will create a new branch
	git branch -r					This command will list all the remote branches
	git branch -D branch-name			This command will force delete a branch
	git branch -u origin/branch			This command sets origin for the currently checked out branch
	git branch -u origin/branch other-branch-name	This command sets origin for a different branch
	git branch -a <SHA commit>			This will list all the branches that contain the SHA commit
	git branch -r --contains <SHA>		This will find all the remote branches that contain the SHA commit

### Checking out a branch to the working directory
	git checkout <existing branch name>         will automatically be tracked to upstream repo
	git checkout -b <new branch name>           complete new branches are not tracked
	git checkout .                              checkout all in current directory
	git checkout -- <file>                      discard changes to a file
	git checkout <sha> -- <file1> <file2>       reset multiple files to a specific commit

### Updating your repository/branch
	git pull
	git pull origin <branch name>   use to only update specific branch
	git pull --rebase   		use if you have uncommitted changes only

### Reset to unstage
	git reset --keep ORIG_HEAD	This will "roll back" a git pull. It sets the HEAD back to its previous value
	git reset HEAD <file>
	git reset <path/filename>   unstage a file after adding it. Then re-checkout to revert its changes
	git reset --hard
	git reset --hard origin/master
    git revert <path/filename>

### Clean up your local repository with prune command
	git gc --prune=now
	git remote prune origin

### Staging your files to commit
	git add <path/filename>
	git add .

### Delete files and directories
	git clean -n    this shows what will be deleted
	git clean -f    this will force delete files
	git clean -fd   this will force delete directories and their files
	git clean -fX   this will force delete ignored files
	git clean -fx   this will force remove untracted files

### Commit to your staged files to the repository
	git commit <path/filename> -m"commit message text"
	git commit . -m"commit message text"

### Sending changes to a remote repository
	git push
	git push -d origin <branch-name>		this will delete a remote branch
	git push -u origin <branch-name>		links the branch to a remote repo "upstream"

### Check branch revision SHA numbers
	git rev-parse HEAD  # check revision number of current branch
	git rev-parse <branch name> # checks revision number of another branch

### Merging
	git branch -f <from-branch> <to-branch>		merges from branch into to branch using the "-f" flag

### Stashing
	git stash save "name of your stash"
	git stash list
	git stash show
	git stash show stash@{0}
	git stash apply
	git stash apply stash@{1}	This will apply a specific numbered stash to the current branch
	git checkout stash -- <paths...>	This will overwrite a file(s) from stash to working directory
	git stash drop stash@{1}	This will drop a specific numbered stash
	git stash clear			This will drop ALL stashes.  Use with caution!

git config --get remote.origin.url
git remote show origin


### Repo Details
	git show origin
	git remote show origin
	git config --get remote.origin.url

### Log
	git log
	git log -n 1    			get last branch commit info
	git log -n 10 --graph		shows a graph
	git log --author"username"	shows all commits from a specific user

### View Git Details in VIM using readonly mode '-R'
	git log | vim -R -		some options may not work with thisvim
	git blame <filename> | vim -R -		some options may not work with this

### Reflog
	git reflog			this will show your HEAD history. use this info to "undo a git pull" by resetting to a specific HEAD sha number.
						ex: git reset --hard HEAD@{1}

### Git Diff
	git diff myfile.txt		If you want to see what you haven't git added yet
	git diff --cached myfile.txt	or if you want to see already-added changes
	git diff --name-only branch-name			Shows the diff filenames between current and specified branch
	git diff --name-only branch-name | wc -l	Shows the count of the diff files between current and specified branch
	git diff --name-status branch-name			Shows the diff filenames and their status between current and specified branch
	
	diff status legend
	---------------------------------------------------------------------------------------------
    A: addition of a file
    C: copy of a file into a new one
    D: deletion of a file
    M: modification of the contents or mode of a file
    R: renaming of a file
    T: change in the type of the file
    U: file is unmerged (you must complete the merge before it can be committed)
    X: "unknown" change type (most probably a bug, please report it)

<br>

## Git Patch File Sharing:
There are two solutions for this. The more formal one is `git format-patch`,
and the quick-and-dirty approach is `git diff > file.patch`. 
For the latter, you can capture only staged changes with `git diff --staged > file.pat`
The diff approach will probably work fine for your use case.
You can then use `git apply <patch file>` to apply patches.

## Git Check For Deploy:
1. First Add Alias. only need to run once.
#
	git config --global alias.isdeployed '!f() { git fetch && RESULT=$(git rev-list $2 | grep $(git rev-parse $1)); if [ -z $RESULT ]; then echo false; return 1; else echo true; return 0; fi; }; f'
	git config --global alias.parent '!git branch --contains $(cat .git/ORIG_HEAD)'
	git config --global alias.lastpulldate '!git show -s --format=%ci $(git log -n 1 --pretty=format:%H)'
	git config --global alias.alias '!git config --list | grep alias | cut -d"." -f2 | cut -d"=" -f1 | sort'
	git config --global alias.alias-viewcode '!git config --list | grep alias | sort'
	git config --global alias.parent '!git show-branch | grep "\*" | grep -v `git rev-parse --abbrev-ref HEAD` | head -n1 | sed "s/.*\[\(.*\)\].*/\1/" | sed "s/[\^~].*//"'


2. Find latest SHA
#
    git log -n 1

3. Run Command
#
    git isdeployed <test hash> <PC deployed hash>

## Git Merge/Diff Tools

#### Check diff tools:
	git difftool --tool-help
	git mergetool --tool-help
	git difftool xBranch:aFile.txt yBranch:aFile.txt	compare same file from two different branches

#### vimdiff3
	Helpful URl: https://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/
	
    Project Setup:
        $ git config diff.tool vimdiff
        $ git config diff.conflictstyle diff3
        $ git config difftool.prompt false 
        $ git config merge.tool vimdiff
        $ git config merge.conflictstyle diff3
        $ git config mergetool.prompt false
        
    Global Setup:
        $ git config --global diff.tool vimdiff
        $ git config --global diff.conflictstyle diff3
        $ git config --global difftool.prompt false 
        $ git config --global merge.tool vimdiff
        $ git config --global merge.conflictstyle diff3
        $ git config --global mergetool.prompt false

    AFTER GETTING A CONFLICT RUN THE MERGE TOOL:
        $ git mergetool

    SCREENS & MERGING OPERATIONS:
        +--------------------------------+
        |  LOCAL   |   BASE   |  REMOTE  |
        +--------------------------------+
        |             MERGED             |
        +--------------------------------+

		LOCAL	– this is file from the current branch
		BASE	– common ancestor, how file looked before both changes
		REMOTE	– file you are merging into your branch
		MERGED	– merge result, this is what gets saved in the repo

		Screen Navigation:
			Ctrl w + h   # move to the split on the left 
			Ctrl w + j   # move to the split below
			Ctrl w + k   # move to the split on top
			Ctrl w + l   # move to the split on the right
        
		Merged Buffer Navigation:
			Freeform-Navigation:
				h	# move cursor left
				j	# move cursor down
				k	# move cursor up
				l	# move cursor right
			Jump-Navigation:
				]c		# jump to next diff
				[c		# jump to previous diff

		Select code from one of the buffers to keep from merge
			:diffget RE  # select from REMOTE
			:diffget BA  # select from BASE
			:diffget LO  # select from LOCAL
        
        File Saving/Closing
			:q		# exit
			:q!		# for exit
			:x		# save and exit or use "wq"
			
		Finally, run git commit


#### Git Merging Scenario
>
tig screen-shot on master...
2018-11-07 16:25 username M─┐ [master] Merge branch 'octocrow'                      │commit 4945b8ad2bb763dc869e4d574c2e7188ae81afa1
2018-11-07 16:23 username │ o [octocrow] crows like to kaa                          │Merge: 71041d0 e95e1c4
2018-11-07 16:20 username M─│─┐ Merge branch 'octoall'                              │Author:     username <username@email.com>
2018-11-06 14:53 username │ │ o [octoall] [octodog] sweet new changes               │AuthorDate: Wed Nov 7 16:20:57 2018 -0500
2018-11-06 14:33 username │ │ o if merged, octobat will replace a octocat           │Commit:     username <username@email.com>
2018-03-29 17:19 username M─│─│─┐ Merge branch 'octobird'                           │CommitDate: Wed Nov 7 16:20:57 2018 -0500
2018-03-29 17:14 username │ o─┴─┘ [octobird] making octocat                         │
2018-03-29 17:15 username o │ kittens                                               │    Merge branch 'octoall'
2018-03-29 17:06 username o─┘ changed to octobird                                   │
2018-03-29 14:35 username M─┐ Merge branch 'octodog'                                │ animals.txt | 6 ++++--
2018-03-29 14:29 username │ o Replace octopus with an octodog                       │ 1 file changed, 4 insertions(+), 2 deletions(-)
2018-03-29 14:30 username o │ Replace octopus with an octoman                       │
2018-03-29 14:28 username I─┘ Initial commit                                        │
                                                                                   │
                                                                                   │
[main] 4945b8ad2bb763dc869e4d574c2e7188ae81afa1 - commit 3 of 13               100%│[diff] 4945b8ad2bb763dc869e4d574c2e7188ae81afa1 - line 1 of 11                                            100%
>


>
username@host MINGW64 ~/path/to/repo/zoo (master|REVERTING)
$ git revert -m 4945b8ad2bb763dc869e4d574c2e7188ae81afa1
error: option `mainline' expects a number greater than zero

username@host MINGW64 ~/path/to/repo/zoo (master|REVERTING)
$ git revert -m 1 4945b8ad2bb763dc869e4d574c2e7188ae81afa1
error: could not revert 4945b8a... Merge branch 'octoall'
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' or 'git rm <paths>'
hint: and commit the result with 'git commit'

username@host MINGW64 ~/path/to/repo/zoo (master|REVERTING)
$ git status
On branch master
You are currently reverting commit 4945b8a.
  (fix conflicts and run "git revert --continue")
  (use "git revert --abort" to cancel the revert operation)

Unmerged paths:
  (use "git reset HEAD <file>..." to unstage)
  (use "git add <file>..." to mark resolution)

        both modified:   animals.txt

no changes added to commit (use "git add" and/or "git commit -a")

username@host MINGW64 ~/path/to/repo/zoo (master|REVERTING)
$ git mergetool
>


