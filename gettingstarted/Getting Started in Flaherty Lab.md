Title:			Getting Started in Flaherty Lab
Subtitle:		Handbook for New Members
Author:			Yifan Zhao (2014), Tete Zhang (2014), Yuting He, Fan Zhang, Tim DeFreitas, Spencer Keilich, Hachem Saddiki, Patrick Flaherty  
Affiliation:	Worcester Polytechnic Institute
Date:				May 14, 2014  
Copyright:		
Keywords:		

TODO: Write sction on starcluster

TODO: Write section on MPI

Last update: May 14, 2014


# Your First Day #
Congratulations, and welcome! This guide is written by people who've been where you are and want to help you to have a productive and successful experience here.

***You should first read through this document and configure your computer with necessary software. Understanding the contents in this document will help you establish a good habit on conducting reproducible experiments.***

There are a few things you need to do to get started.

1. [Request your account on our server `redwood.wpi.edu` from Sia Najafi.](#serversetup)
2. Request to be added to our mailing list `flahertylab@wpi.edu`. The list is at [http://www.wpi.edu/+mailinglist](http://www.wpi.edu/+mailinglist). Scroll all the  "change list" option and enter `flahertylab`
3. Clone the `common` repository using git into the Research folder in your home directory on `redwood.wpi.edu`.
4. Set up your environment on `redwood.wpi.edu`

Once you've set up your environment on redwood, then you'll need to start learning about the software, systems and culture for the lab. Read on...

## <a name = "serversetup">Requesting access to `redwood.wpi.edu` </a> ##
`redwood.wpi.edu` is our primary linux server for computation. It's a 64 core machine with 256Gb RAM. In addition to onboard storage, we have a 9Tb high speed drive +1Tb solid-state drive attached to redwood via NFS for storing our data. 

1. Ask Prof. Flaherty to add you to the flahertylab group through CCC. The webpage to do that is [here](http://www.wpi.edu/+gred).


2. Send the following email to **Sia Najafi** and cc Prof. Flaherty for an account on redwood. It is _very important_ that he adds your account under the `flahertylab` unix group. 

	Your email should read as follows

	> Dear Mr. Najafi
	>
	> I'm writing to request an account on Prof. Flaherty's compute server redwood.wpi.edu. Prof. Flaherty would like my default group to be flahertylab. We would like access to research.wpi.edu for a Mac and Windows machine as well.
	>
	> I have already added myself to the flahertylab group through the CCC website.
	>
	> If there is anything I can do to help, please let me know.
	>
	> Thank you,
	> Your name

3. Once you have your account name and password, change your password using `yppasswd`.

4. Check that you are in the flahertylab group using the command `groups` at the command prompt on redwood. If you don't see `flahertylab` as the first group, you need to speak with Prof. Flaherty to get that fixed.

4. Use `ypchsh` to change your default shell to `/bin/bash`.

## Cloning the `common` repository ##

We have a special repository called `common` that contains all of the files you need to set up your environment on `redwood` and get you started in the lab.

This procedure will create a `Research` folder and clone the common repository into it.

Just after you log in enter the following at the command prompt ($):

	$ mkdir Research
	$ cd Research
	$ git clone ssh://redwood.wpi.edu/research/pjflaherty/flahertylab/git/common.git common

You will be asked to enter your password to log into redwood again. This is just so that you can pull the code. `git` will logout when done.

Type `ls` to list the directory. You should now see a folder called `common`. Navigate into that folder using `cd common`. Now with `ls` you should see several folder. One of which is `gettingstarted`. That folder contains this document.

## Set up your environment on redwood ##
Navigate to `~/Research/common/dotfiles` and enter the following command at the command prompt `$source link_dotfiles.sh`.

This will place links to the environment setup dotfiles in your home directory. Next time you login you will have the default lab setup.

# Setting Up Your Personal Computer #
Start by updating your personal computer, so that your environment matches or plays nice with Flaherty Lab infrastructure. Here is a list of topics to be covered in this step:

- [Text Editor](#te)
- [Printer](#p)
- [Server Map](#sm)
- [Redwood Connection](#rc)
- [Linux Command](#lc)
- [git](#gg)
- [Default Path](#dp)
- [Matlab, Python, and C](#MPC)
- [Gurobi](#Gurobi)


##<a name = "te"></a> Text Editor##

The text editor is not only used for contributing to this document, but more importantly can be used for recording your lab work. It is also not a common sense text editor like Microsoft Word, but more like a website designer where your file can be output as files of multiple formats. 

**Windows:**

Download [MarkdownPad](http://markdownpad.com/), [NotePad++](http://notepad-plus-plus.org/), or [Sublime text](http://www.sublimetext.com/2).

**Mac:**

Download the program [Textmate](http://macromates.com). 

## Terminal Application ##

**Windows**

X-win32 can be download from campus. Detailed instructions for installing and configuring X-win32 can be found on the [CCC website] (http://www.wpi.edu/Academics/CCC/Help/Software/xwin.html).
Instructions for X-win32 configuration can be found at <http://www.wpi.edu/Academics/CCC/Help/Software/xwin.html>. However, there are some minor changes in both installation procedures and configuration procedures. 

For installation, most steps lists on ccc website stay the same, but the folder "*X-Win32 9.2*" doesn't exist. Instead of looking for this folder, directly double click on the shortcut "*Install X-Win32 2012 (1178)*". 

This is how you configure it:

1. Click on X-win32 and the configuration window will pop-up.
2. On the right hand side, click on Wizard, select "ssh" and name it "redwood".
3. Type in the host name: redwood.wpi.edu.
4. ONLY type in your login and then click next. This is for security reasons: you always want X-win to prompt you for your password .
5. Choose linux, click finish, your redwood connection will appear in the initial configuration window.
6. Now, drag your redwood connection under Autostart folder, click OK.
7. Click again on X-win32 to get connected to redwood.

**Mac:**

Terminal is the Mac equivalence of PuTTY. After opening up the Terminal application, type in command `ssh yourusername@redwood.wpi.edu` and hit enter key. Then enter your password under instruction. Now you should be able to access redwood successfully and you may change your password using command "yppasswd".

## Mapping research.wpi.edu ##
Drive mapping is how Microsoft Windows and OS/2 associate a local drive letter (A through Z) with a shared storage area to another computer over a network.

**Windows:** 

Computer->map network drive->Drive: select a drive that's not usually used, for example S:  Folder: `\\research.wpi.edu\flahertylab`

Please enter your WPI usersname and password. Then, check the two checkboxes: Reconnect at logon and connect using different credentials.

**Mac:**

Finder -> Go -> Connect to Server -> smb://research.wpi.edu/flahertylab

Please enter your WPI username and password.


You should see a folder with your username. That is the same folder you enter when you log into redwood.wpi.edu. Anything you change in the windows drive will also change in the redwood.wpi.edu environment.

## Git GUI ##
Having a GUI for git can make your life much easier in the beginning.
Git for windows: <http://msysgit.github.com/>. After downloading it, install all as default.

## <a name = "p"></a> Printer ##
Connect to the printer in the lab.

**Windows:** 

In order to connect your Windows machine to the printer, click on the start button, then on the search field type: `\\printers.wpi.edu` and hit enter. Then a window will pop up and ask for your WPI username and password. Remember to change the domain to "ADMIN" by typing `ADMIN\username` or `username@wpi.edu` in the username column.
A window with all the available printers will pop-up. Look for "p60_biomed3". Double click on it to connect. It will take a few minutes to set up. Before you are allowed to print, however, you must add a user ID in the print settings.

Go to the control panel and right click on the printer, then select "Printing Preferences". Go to job setup, and enter in the user ID, and click OK. It is also a good idea to go into the edit menu and enable 2-sided printing.

**Mac:**

[Here](https://www.wpi.edu/Academics/CCC/Help/Software/Macintosh/macprinting.html) is the guideline on how to add a printer on campus generally. The address of the printer is `p60-biomed3.wpi.edu`.

## <a name = "lc"></a>Linux Commands ##

GENERAL

`cd`: change directory

`cd ../`: get to the directory immediately above the current one

`cd ../..`: get to the one level further above in the directory

`cd ./`: the current directory the command prompt is in

`pwd`: Shows where you are in the file system

`ls`: Prints out what files are available in the present working directory

`ls -l`: list in long format and provide more information about all files

`ls -a`: list hidden files as well as the hided files

`history`: shows commands history

`who`: shows who is online

`--help`: Prints the synopsis and a list of the most commonly used commands

More detailed Linux terminal commands: <http://www.cs.utsa.edu/~whaley/teach/intromat/pdf/linux_intro.pdf>

We've collected some useful unix tips and tricks here.
The following is retrieved from <http://mmb.pcb.ub.es/~carlesfe/unix/tricks.txt>.

I have marked with a * those which I think are absolutely essential
Items for each section are sorted by oldest to newest. Come back soon for more!

BASH

* In bash, 'ctrl-r' searches your command history as you type
- Add "set -o vi" in your ~/.bashrc to make use the vi keybindings instead
  of the Emacs ones. Takes some time to get used to, but it's fantastic!
- Input from the commandline as if it were a file by replacing 
  'command < file.in' with 'command <<< "some input text"'
- '^' is a sed-like operator to replace chars from last command 
  'ls docs; ^docs^web^' is equal to 'ls web'. The second argument can be empty.
* '!!:n' selects the nth argument of the last command, and '!$' the last arg
  'ls file1 file2 file3; cat !!:1-2' shows all files and cats only 1 and 2
- More in-line substitutions: http://tiny.cc/ecv0cw
- 'nohup ./long_script &' to leave stuff in background even if you logout
- 'cd -' change to the previous directory you were working on
- 'ctrl-x ctrl-e' opens an editor to work with long or complex command lines
* Use traps for cleaning up bash scripts on exit http://tiny.cc/traps
* 'shopt -s cdspell' automatically fixes your 'cd folder' spelling mistakes


PSEUDO ALIASES FOR COMMONLY USED LONG COMMANDS

- function lt() { ls -ltrsa "$@" | tail; }
- function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
- function fname() { find . -iname "*$@*"; }


VIM

- ':set spell' activates vim spellchecker. Use ']s' and '[s' to move between
  mistakes, 'zg' adds to the dictionary, 'z=' suggests correctly spelled words
- check my .vimrc http://tiny.cc/qxzktw and here http://tiny.cc/kzzktw for more


TOOLS

* 'htop' instead of 'top'
- 'ranger' is a nice console file manager for vi fans
- Use 'apt-file' to see which package provides that file you're missing
- 'dict' is a commandline dictionary
- Learn to use 'find' and 'locate' to look for files
- 'find . -type d -exec chmod g+x {} \;' let people in your group access
  folders without messing up file permissions (never do 'chmod g+x * -R'!)
- Compile your own version of 'screen' from the git sources. Most versions
  have a slow scrolling on a vertical split or even no vertical split at all
* 'trash-cli' sends files to the trash instead of deleting them forever. 
  Be very careful with 'rm' or maybe make a wrapper to avoid deleting '*' by
  accident (e.g. you want to type 'rm tmp*' but type 'rm tmp *')
- 'file' gives information about a file, as image dimensions or text encoding
- 'awk '!x[$0]++'' to check for duplicate lines
- 'echo start_backup.sh | at midnight' starts a command at the specified time
- Pipe any command over 'column -t' to nicely align the columns
* Google 'magic sysrq' and learn how to bring you machine back from the dead
- 'diff --side-by-side fileA.txt fileB.txt | pager' to see a nice diff
* 'j.py' http://tiny.cc/62qjow remembers your most used folders and is an 
  incredible substitute to browse directories by name instead of 'cd' 
- 'dropbox_uploader.sh' http://tiny.cc/o2qjow is a fantastic solution to 
  upload by commandline via Dropbox's API if you can't use the official client
- learn to use 'pushd' to save time navigating folders (j.py is better though)
- if you liked the 'psgrep' alias, check 'pgrep' as it is far more powerful


NETWORKING

- SMB is better than NFS. Use 'sshfs_mount' as a last resort, 
  any network failure will be trouble
- 'python -m SimpleHTTPServer 8080' shares all the files in the current 
  folder over HTTP, port 8080
- 'ssh -R 12345:localhost:22 server.com "sleep 1000; exit"' forwards 
  server.com's port 12345 to your local ssh port, even if you machine 
  is not externally visible on the net. 
  Now you can 'ssh localhost -p 12345' from server.com and you will 
  log into your machine. 
  'sleep' avoids getting kicked out from server.com for inactivity
* Read on 'ssh-keygen' to avoid typing passwords every time you ssh
- 'socat TCP4-LISTEN:1234,fork TCP4:192.168.1.1:22' forwards your port
  1234 to another machine's port 22. Very useful for quick NAT redirection.
* Configure postfix to use your personal Gmail account as SMTP:
  http://tiny.cc/n5k0cw. Now you can send emails from the command line.
  'echo "Hello, User!" | mail user@domain.com'
- Some tools to monitor network connections and bandwith:
  'lsof -i' monitors network connections in real time
  'iftop' shows bandwith usage per *connection*
  'nethogs' shows the bandwith usage per *process*
* Use this trick on .ssh/config to directly access 'host2' which is on a private 
  network, and must be accessed by ssh-ing into 'host1' first
  Host host2
      ProxyCommand ssh -T host1 'nc %h %p'
  	  HostName host2
* Pipe a compressed file over ssh to avoid creating large temporary .tgz files
  'tar cz folder/ | ssh server "tar xz"'

Writing good bash scripts can be challenging. Use this [guide](http://www.tldp.org/LDP/abs/html/) to get the basics. And use this [guide](http://www.davidpashley.com/articles/writing-robust-shell-scripts.html) to make your code more robust.

# <a name = "gg"></a> Git: Version Control #

Whenever you have made a reasonable amount of contributions to the lab, you should update your work to the main directory. The GIT Graphic User Interface (GUI) is very useful for version control purposes in the lab. You will be able to "pull" data from the repository and "push" your updates to it as well using the GIT GUI. The detailed instructions of "pull" and "push" will be introduced in later parts of this document. 

**Windows:** 

You can either download [Git for Windows](http://msysgit.github.com/) or [SourceTree for Windows](http://www.sourcetreeapp.com). 

The configuration steps below are for SourceTree. After downloading it, install all as default.

Click Clone/New -> clone repository ->Source: `ssh://username@redwood.wpi.edu/home/pjflaherty/git/gettingstarted.git`

Target: should be somewhere safe.

Clone Type: Standard.

**Mac:** 

<http://www.sourcetreeapp.com>.

Run Source Tree -> Clone Repository ->
Source Path: /Volumes/flahertylab
Destination Path: should be somewhere safe. 

**Linux:**

We use a version control system called [git](http://git-scm.com) extensively. A good intro is available [here](http://pcottle.github.io/learnGitBranching/).


We primarily use [MATLAB](http://www.mathworks.com), [Python](http://www.python.org) and C. Occasionally, you'll need to use another language such as bash shell, but only for very simple tasks that you could probably also do with one of those three. Knowing MATLAB will help you in most engineering jobs and academia. Google considers Python and C two of their core languages.

Some tutorials to learn MATLAB are available [here](http://www.mathworks.com/academia/student_center/tutorials/launchpad.html). Don't buy any books or pay for anything. There are plenty of free resources to learn matlab out there.

Go through the [Software Carpentry](http://software-carpentry.org) lectures on version control, the shell, python, testing and MATLAB. 


## Commonly Used GIT Commands ##

git status: Show the working tree status.
git pull: Fetch from and merge with another repository or a local branch.
git push: Update remote refs along with associated objects.
git commit: Record changes to the repository.
git add: Add file contents to the index.

## Checking what branches are available ##

* `$ git ls-remote` shows all of the branches that are available remotes regardless of whether you're tracking them locally or not.
* `$ git branch` shows all of the _local_ branches 
* `$ git branch -r` shows all of the _remote_ branches being tracked

## Switching branches ##

Often we want to switch to a different branch that's available on the server.  

1. `$ git remote` Shows the names of the remote server nicknames that you can pull from. Call this `<repository>`.
	
2. `$ git ls-remote <repository>` Shows the branches that are available on that repository that you can pull from. It's best to pull a branch that is also a head. You can isolate those using `$ git ls-remote --heads <repository>`.  
	
3. `git pull <repository> <branch>` Pulls a current branch from the repository. Make sure you don't have any uncommitted changes; if so use the stash. 

## Initializing a shared remote repository ##

Set up a new _remote_ repository that a group can read/write on the server [Reference](http://kovshenin.com/2011/howto-remote-shared-git-repository/)

You must have write permissions to the directory you want to put the repository in.

First `cd` to `flahertylab/git` or wherever you want to put the repository to create `project.git` remote repository. The common group is `flahertylab`.

	$ newgrp flahertylab
	$ mkdir -p project.git
	$ cd project.git
	$ git init --bare --shared=group
	$ sudo chgrp -R flahertylab .

Then set up a hook to change the file permissions in
Create the following file: project.git/hooks/post-update

	#!/bin/sh
	chmod -R g+rwX . 2>/dev/null
	chgrp -R flahertylab . 2>/dev/null


## Linking a local git repository to a remote repository ##

1. `$ git init` within the local directory to put it under control
2. `$ git remote add shortname path_to_remote` where shortname is `research` or `origin` or whatever you want to call it. And `path_to_remote` is a full path to the remote repo.
3. `$ git push origin master` where origin is the shortname for the remote repo and master is the branch you are on.


## Git References ##
* [Git in 5 Minutes](http://scottr.org/presentations/git-in-5-minutes/)

## Some Common Git Problems & Solutions ##

Sometimes a user will be denied access to a shared repository on redwood. When cloning the repository, include your username in the ssh link as shown below:
'$ git clone ssh://yourusername@redwood.wpi.edu/research/pjflaherty/flahertylab/git/gettingstarted.git gettingstarted


Great git Manual Page:
http://www.kernel.org/pub/software/scm/git/docs/

# Reproducible Experiments #

The lab is multi-disciplinary and we all have some background in genetics, computer science and statistics. Everyone has one area they're best at, one they're mediocre at and one they just survive. To be successful, find people in the lab who complement your weakness while you work to get better at all three.

The **three most important concepts in software engineering are: DRY, test, and document**. **DRY** stands for "don't repeat yourself". If you find yourself cutting and pasting code, figure out a way to make it a reusable function. **Testing** is critical to all good software development and often is ignored because it's hard to do. As a corollary, if you're good at developing boundary and unit tests, it's very easy to find a high paying job. Try to write the tests before the code or at least think of what tests you need before you write the code. Lastly, **documentation** is the key to good research and software. Comment your code. More importantly, keep a paper or electronic lab notebook. For each experiment, write down (1) the purpose of the experiment, (2) what you expect to happen as a result and (3) what you actually observed. This becomes the raw material for presentations, papers and patents. If you don't document it, it never happened.


After following this step, you are expected to be familiar with the following topics:

- [Data Management](#dh)
- [Structure of a Project Folder](#spf)
- [Standard File Formats](#sff)
- [Programming Style](#ps)

-----

## <a name = "dh"></a> Data Management ##


Please follow this procedure when downloading big or important data sets.

1. Download the data and store it in the freezer folder.
2. Change the permissions for the data to read-only.
3. Verify or create and verify the MD5 checksum.
4. Write a README file that contains: who downloaded the data, where they downloaded it from, when the downloaded it, any verison information for the data, the MD5 checksum information.

If the data set comes with the MD5 checksum, copy and paste the checksum into a file named `md5.sum` in the top level of the data directory. Otherwise, you'll need to create your own checksum after downloading the data. A good tutorial for creating and verifying checksums is [here](http://klassenresearch.orbs.com/Checksums). Once you have downloaded the data

The MD5 algorithm has some vulnerabilities that you can read about on wikipedia. The current standard seems to be SHA2. However, MD5 is implemented on most systems including mac and linux and seems to be good enough for non-critical work.


In the Flaherty Lab we have three levels of data, freezer data, fridge data and bench data. 

In a common wet lab, the bench data is the immediate data you collected on the bench, which is temporary but reflects the current status of your study objects. The fridge data are collected from study objects preserved in a fridge, which lasts longer than the bench data, and should be able to tell a longer story about the study objects. The freezer data is collect in an extremely cold environment where the study objects last the longest. 

In a bioinformatics lab these three levels of data meant differently but kept the same concept. 

### Freezer ###

The freezer folder, located one level above your personal directory, keeps the primary data you collected or downloaded. They should be kept in the folder once added. Since a little amount of data lost or corruption might influence the future analysis, we need to do a checksum algorithm on the freezer every time new data is added to the folder. 

Follow the following steps when you have primary data to add to the freezer. 

1. Download the data and store it in the freezer folder.
2. Change the permissions for the data to read-only.
3. Verify or create and verify the MD5 checksum.
4. Write a README file that contains: who downloaded the data, where they downloaded it from, when they downloaded it, any version information for the data, the MD5 checksum information.

If the data set comes with the MD5 checksum, copy and paste the checksum into a file named `md5.sum` in the top level of the data directory. Otherwise, you'll need to create your own checksum after downloading the data. A good tutorial for creating and verifying checksums is [here](http://klassenresearch.orbs.com/Checksums).

The MD5 algorithm has some vulnerabilities that you can read about on wikipedia. The current standard seems to be SHA2. However, MD5 is implemented on most systems including mac and linux and seems to be good enough for non-critical work.

### Fridge ###

The fridge contains the secondary data, which you have modified for the purpose of your project. It is not the primary data but can be considered primary for your project. To reproduce your data for the project, the algorithm you used to create the fridge data should be contained in the fridge. The detailed information of what to put in the fridge will be elaborated in the [project storage structure section](#fridge). 

### Bench ###

The bench data should be the result you get after running the data in the program you wrote. However here in the repository we only record the code you wrote to run the fridge data and the collective result you get (figures, tables, etc) since the data itself would be too big to store. However with the code that is stored here, your data result would be reproducible. 

##<a name = "spf"></a> Structure of a Project Folder ##

In the lab we have a standard way of organizing the experiment notes, data and resources so that your work is clear to everyone in the lab and helpful when compositing a research paper. 

First of all, you need to go inside your personal folder named with your WPI usename. Inside of that folder, create another new folder named "Research". Inside of the "Research" folder, you can create folders for all the different projects of yours. 

For each project, there are several folders you need to keep various forms of data. 

### <a name = "fridge"> </a> data (Fridge)

The fridge keeps the secondary data, which is the modified primary data specific to your project. It can be normalized, statistically analyzed, or In order to make each branch of yours smaller, we are not keeping Gigabytes of modified data in the fridge. Instead you should MakeFile the code you wrote to analyze the primary data so that the program can always run by others, and the branch is smaller in the mean time. 

### docs

The Docs folder keeps the documents needed to construct the final paper. The first subfolder is "Notes", where you keep all the experiment notes that is useful to your final paper. The rest subfolders keeps all the tables, figures and other visual aids you plan to use. They should be separated by papers/reports since various journals may ask the scholar to arrange their tables and figures differently and separating them would be the easiest when the time comes to composite the final research paper. 

### results

The results folder is the most detailed and important one of all folders (although every one of them is quintessential). All the subfolders in the "Results" folder are experiments you did for this project. They should be named precisely as *YYYY-MM-DD_Project Name* so that the computer may sort the experiments according to their start date. Inside of each experiment folder, you should keep a notebook, which is a markdown file containing the purpose, the materials and methods, the results and the conclusion of the experiment. The markdown file should be written using your text editor installed above and it will be the primary source of your research paper. Also, all the Matlab, python, R and any other assisting code files should be saved alongside the notes as well.

#### src (source)

The source folder contains all the combined code you write for the experiment. Inside of the result might be pieces of small functions you write to run one specific step of the experiment, while in the source folder you should keep versions of the complete program.

#### bin

The bin folder contains all the executable files. They might be programs you find online that are helpful to the experiment, or they are compiled programs that you can execute with one command when programming. The folder is important for reproducible programming. 



##<a name = "sff"></a> Standard File Formats
You will often be reading and writing data and results files. In order to standardize the interface between apps that we write we use some standard file formats for data management.

**Use HDF5 or CSV formats for data and models.** MATLAB *.mat files are HDF5 format. Python has libraries (pytables, h5py) to read/write HDF5.

**Use markdown for documentation and notebook files.**  There is a [syntax guide](http://daringfireball.net/projects/markdown/) and a [cheat sheet](http://warpedvisions.org/projects/markdown-cheat-sheet/) to help you.

**Use eps for figures**

**Use docx or tex for manuscripts.**

-----

# Software #

We primarily use [MATLAB](http://www.mathworks.com), [Python](http://www.python.org) and C. Occasionally, you'll need to use another language such as bash shell, but only for very simple tasks that you could probably also do with one of those three. Knowing MATLAB will help you in most engineering jobs and academia. Google considers Python and C two of their core languages.

## Matlab ##

Some tutorials to learn MATLAB are available [here](http://www.mathworks.com/academia/student_center/tutorials/launchpad.html). Don't buy any books or pay for anything. There are plenty of free resources to learn matlab out there.

Go through the [Software Carpentry](http://software-carpentry.org) lectures on version control, the shell, python, testing and MATLAB.

## Python ##
Learn about testing using the [nose](http://nbviewer.ipython.org/github/swcarpentry/2012-11-scripps/blob/master/python/testing-with-nose.ipynb) framework.  Learn about sharing results using [ipython](http://ipython.org) notebooks. Learn about virtual environments

### Essential Python Toolboxes ###

A good book to get started in data analysis with python is "Python for Data Analysis" by O'Reilly. You can read it through Safari Ebook at the Gordon Library.

These are core modules and should always be available.

- [scikits.learn](http://scikit-learn.org/0.6/index.html) - machine learning and data mining
- [ipython](http://ipython.org) - interactive shell similar to MATLAB
- [pandas](http://pandas.pydata.org) - data frame object similar to R
- [scipy](http://www.scipy.org) - fundamental scientific module
- [numpy](http://numpy.scipy.org) - fundamental numerics module
- [matplotlib](http://matplotlib.org) - fundamental plotting module
- [pep8](http://pypi.python.org/pypi/pep8) - code style checking
- [cloud](http://www.picloud.com) - access to PiCloud's cloud-computing platform
- [unittest](http://docs.python.org/2/library/unittest.html) - unit testing framework

The CrossCompute Amazon Machine Image (AMI) has an ipython notebook server with: numpy, scipy, h5py, pytables, matplotlib, pyramid, scikit-learn, pandas, statsmodels, networkx, theano, gdal, pysal, shapely. You need to launch a High-CPU Medium Instance to use it. The on-demand price is $0.145 per worker per hour and the spot instance price is $0.018 per worker per hour.

### Machine-Learning & Statistics Modules ###
- [scikits.image]
- [scikits.timeseries]
- [statsmodels]
- [MDP]
- [Pycluster]
- [pytables]
- [PIL]

### Development Utilities Modules ###
- [coverage]
- [nose]

- [distribute]
- [scons] - substitute for make
- [codetools] - code analysis and execution tools
- [docutils]
- [Cython]

### Data Input/Output Modules ###
- [configobj]
- [h5py]
- [hdf5]
- [curl]
- [xlrd]
- [xlwt]

### Bioinformatics Modules ###
- [biopython]

### Plotting Modules ###
- [libjpeg]
- [libpng]
- [enable] - low-level drawing and interaction
- [chaco] - interactive 2D plotting
- [nodebox](http://nodebox.net)- visualization tools similar to Processing.js

### Internet Interface Modules ###
- [tornado]
- [Twisted]

## <a name = "Gurobi"> </a> Gurobi ##

Gurobi is an optimizer we use in the lab for mathematical programming. It is compatible with multiple programming interface including python.

When installing gurobipy for python on MacOSX 10.8 you need to make the following changes.
 
https://groups.google.com/forum/#!msg/gurobi/ArCkf4a40uU/R9U1XFuMJEkJ

When trying to use Gurobi with Enthought's latest Canopy (formerly EPD), you'll probably get something like

    $ ipython 

    In [1]: import gurobipy
    Fatal Python error: PyThreadState_Get: no current thread
    Abort trap: 6 


or some Library not found error.

Here's what you need to do to get this fixed on Mac OS 10.8 (with Xcode installed):

    $ python setup.py install (skip this line if you already installed Gurobi in Canopy's site-packages)
    In your ~/.profile, append the following after Canopy's call to source the activation file:
    export DYLD_LIBRARY_PATH=/Library/gurobi550/mac64/lib:$DYLD_LIBRARY_PATH
    export DYLD_FRAMEWORK_PATH=/Library/gurobi550/mac64/lib:$DYLD_FRAMEWORK_PATH 
    Fix the shared library (change USERNAME to your user name!)
    $ install_name_tool -change /System/Library/Frameworks/Python.framework/Versions/2.7/Python /Users/USERNAME/Library/Enthought/Canopy_64bit/User/Python /Users/USERNAME/Library/Enthought/Canopy_64bit/User/lib/python2.7/site-packages/gurobipy/gurobipy.so

Step 3 needs to be repeated every time Gurobi is updated to a new version (until the issue is fixed of course).

## <a name = "ps"></a> Programming Style ##
We use functional programming for the majority of projects in the lab and we use object-oriented programming only where it really makes sense.

Pure functions have meet two criteria:

1. *Referential Transparency* - They always return the _same result_ given the _same arguments_.
2. *No side-effects* - They don't change the external world by changing external objects or interacting with i/o channels.

Most of your code will fall into the pure function category and you can keep things orderly by following a few guidelines for the exceptions.

- If your function does interact with some i/o channel make sure that is the only thing your function does. Don't write a function that does some computation then writes the output to a file. Refactor to separate functions; one that computes and one that saves. Think of the "print" function here.'
- Do your best to avoid global variables. This is not always possible, but should be absolutely minimized.
- GOTO is ok. Have a look at Don Knuth's [Structured Programming with go to statements](http://cs.sjsu.edu/~mak/CS185C/KnuthStructuredProgrammingGoTo.pdf). There are really good examples of how it massively clarifies initialization of very common algorithm paradigms. "break", "return" and "continue" commands in C and python accomplishes a goto-like behavior. "exceptions" do a similar thing in higher level programs like python as well.


<a name = "app"> </a> Appendix
-------

### Recommended Reading

There are a few good background books on research, bioinformatics and machine learning that will help you become a productive member of the lab. These are organized more by topic and rating. 
(xxx) = essential
(xx) = recommended
(x) = useful

**To Be Developed**

### Courses

https://www.coursera.org/course/matrix

### Software Engineering and Programming

[The Practice of Programming by Kernighan and Pike](http://cm.bell-labs.com/cm/cs/tpop/)(xxx)

Try out a few sample bioinformatics problems to build your programming skills and thinking about bioinformatics problems. 
 * [Rosalind](http://rosalind.info)

### Passing Your Qualifying Exam

You'll be asked question throughout your exam. A good way to answer a question you don't immediately know the answer to is: "We’ll see. We'll do X experiment. We have to look at the data and see if X is _____. If so, we’ll do _____, if not, we’ll do _______."

#### Tips

Should be 2min maximum. Sets up ethos; speaker will handle pathos and logos.
Don't say: "As everyone knows." - they don't.

1) Say Speaker's Name (ask for phonetic pronunciation)

2) Current affiliation of Speaker
- Professor of Mathematics, University of X
- Junior partner at company X
- Director of Center of X

3) Experience and achievements
- Academic degree if appropriate
- Current and/or previous positions, possibly with dates
- publications (highlights)
- awards & prizes

4) Concerning today's talk
- Expert who has worked in the field/project for X months/years
- Will present his/her/group's research on the subject
- Will summarize project report or current project status.

 [1] Some of the ideas and structure for this document are from the Valve: Handbook for New Employees.

# Unfinished Business

We can also create our own virtual machine loaded with enthought and other stack options. Anyone want to take the initiative on this?