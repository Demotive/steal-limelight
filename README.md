Steal Limelight
===================

A script to grab Limelight as .html and link locally. Essentially a boilerplate for fast throwaway prototyping.


Prerequisites:
--------------

- Git
- Homebrew (to install wget)
- wget


What happens?
-------------

The script will fetch all /performance files, *excluding* Transactions Explorer and Dashboard into a directory of your choosing.

It will relink locally where possible, so that the html files link to each other. A javascript (link-catcher.js) will kill any absolute links out to https://www.gov.uk and so on, and handle the few httprequest loaded links.

You also get overrides.css and overrides.js for any local hacking you want to do.


How to use it:
--------------

Clone the project to your machine somewhere: `$ git clone git@github.com:Demotive/steal-limelight.git`

Sort out a directory where you'd like all the files to be saved, for example `~/Documents/limelight-prototype`

`cd` into the directory where you have cloned the project, then run the script with your target directory as an argument: `$ ./steal_limelight.sh ~/Documents/limelight-prototype`

*If you don't specify a directory argument, all the files will be downloaded to the directory you are currently sat in.*

If you're happy, type "Y" at the prompt, and you're off. Once the script has run, use a local server of your choice - `python -m SimpleHTTPServer` - to serve the pages to the browser.


Getting Homebrew and wget if you haven't got them:
--------------------------------------------------

If `$ brew home` doesn't do anything, then go have a look at http://brew.sh/

The install command is: `$ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"`

Once you have Homebrew installed, simply `$ brew install wget`

That's it, you're set.

