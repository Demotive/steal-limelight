Steal Limelight
===================

A script to grab Limelight as .html and link locally. Designed to be run from within htdocs in MAMP (or similar).

Prerequisites:
--------------

- Git
- MAMP
- Homebrew (to install wget)
- wget

MAMP based instructions:
------------------------

1. cd into MAMP's htdocs folder: `$ cd /Applications/MAMP/htdocs`
2. Clone steal-limelight: `$ git clone git@github.com:Demotive/steal-limelight.git`
3. Run the script: `$ ./steal_limelight.sh`

What happens?
-------------

The script will fetch all /performance files, *excluding* Transactions Explorer and Dashboard. So essentially just Limelight.

It will relink where possible, so that the html files link locally to each other.


Getting Homebrew and wget if you haven't got them:
--------------------------------------------------

If `$ brew home` doesn't do anything, then look at http://brew.sh/

The install command is: `$ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"`

Once you have Homebrew installed, simply `$ brew install wget`

That's it, you're set.