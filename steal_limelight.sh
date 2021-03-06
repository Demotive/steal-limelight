#!/bin/sh
# Param $1 : Folder path for your download

echo
echo "Please make sure that you've specified a target directory"
echo "(i.e. './steal_limelight.sh ~/Desktop/target',"
echo "or are happy for Limelight html files to be saved in the current directory."
echo
read -p "Are you ready? [Y/N]" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then

    dir="."

    if [[ -d "$1" && ! -L "$1" ]] ; then
        echo "Using $1"
        dir="$1"
    fi

    echo
    read -p "Use grab files from www.gov.uk (press G) OR www.preview.alphagov.co.uk (press P)? [G/P]" -n 1 -r
    echo

    # 
    # wget essentially says:
    # "Get me everything in and next to /performance/services"
    # "... but IGNORE the Dashboard and Transactions Explorer"
    # 
    # What you should end up with from the wget is a set of .html files which link locally to each other
    # Most or all of css / js / images etc will come from https://gov.uk, so you will STILL NEED a web connection
    # 

    if [[ $REPLY =~ ^[Gg]$ ]]
    # Use live www.gov.uk
    then
        wget \
            --directory-prefix=$dir \
            --mirror \
            --adjust-extension \
            --no-parent \
            --no-host-directories \
            --cut-dirs=1 \
            --convert-links \
            --exclude-directories=/performance/transactions-explorer/,/performance/dashboard/ \
            --reject=dashboard,transactions-explorer \
            https://www.gov.uk/performance/services
    else
    # Use preview
        wget \
            --directory-prefix=$dir \
            --user=betademo
            --ask-password
            --mirror \
            --adjust-extension \
            --no-parent \
            --no-host-directories \
            --cut-dirs=1 \
            --convert-links \
            --exclude-directories=/performance/transactions-explorer/,/performance/dashboard/ \
            --reject=dashboard,transactions-explorer \
            https://www.preview.alphagov.co.uk/performance/services
    fi

    echo "Limelight has been stolen!"

    if [ ! -d "$dir/overrides" ]; then
        echo "Creating local override files, copying link catcher script"
        # create the overrides directory
        mkdir $dir/overrides
        # create two empty files for overrides
        touch $dir/overrides/override.css
        touch $dir/overrides/override.js
        # get the js click-catcher script from the original repo folder
        cp -a -v link-catcher.js $dir/overrides/
    fi

    # write into each .html file
    echo "Adding overrides to html files"
    find $dir -name "*.html" | while read file
    do
       #echo "$block" >> $file
       sed -i "" -e '/<\/head>/i\'$'\n''<link rel="stylesheet" href="/overrides/override.css" />' $file
       sed -i "" -e '/<\/body>/i\'$'\n''<script src="/overrides/override.js" type="text/javascript"></script><script src="/overrides/link-catcher.js" type="text/javascript"></script>' $file
    done

    echo "Done!"

else
    echo
    echo "Bailed it! Fair enough..."
    echo
fi