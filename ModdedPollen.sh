#!/bin/bash
if [ $(id -u) -ne 0 ]; then
    echo "Run this script as root (sudo su)"
    exit
fi
clear
cd /tmp

# Colors
    # Reset
    Color_Off='\033[0m'       # Text Reset

    # Regular Colors
    Black='\033[0;30m'        # Black
    Red='\033[0;31m'          # Red
    Green='\033[0;32m'        # Green
    Yellow='\033[0;33m'       # Yellow
    Blue='\033[0;34m'         # Blue
    Purple='\033[0;35m'       # Purple
    Cyan='\033[0;36m'         # Cyan
    White='\033[0;37m'        # White
# Variables

file1='check1.txt'

file2='check2.txt'

file3='check3.txt'

file4='check4.txt'

file5='check5.txt'

var1=''

var2=''

var3=''

var4=''

var5=''

# Checking and Setting File1

if [[ -f $file1 ]]; then
    echo "Found File1"
else
    echo 'Did NOT find File1 Creating...'
    touch check1.txt
    echo 'Created File1'
    echo 'false' > check1.txt
fi
var1=$(cat check1.txt)

# Checking and Settings File2

if [[ -f $file2 ]]; then
    echo "Found File2"
else
    echo 'Did NOT find File2 Creating...'
    touch check2.txt
    echo 'Created File2'
    echo 'false' > check2.txt
fi
var2=$(cat check2.txt)

# Checking And Setting File3

if [[ -f $file3 ]]; then
    echo "Found File3"
else
    echo 'Did NOT find File3 Creating...'
    touch check3.txt
    echo 'Created File3'
    echo 'false' > check3.txt
fi
var3=$(cat check3.txt)

# Checking And Setting File4

if [[ -f $file4 ]]; then
    echo "Found File4"
else
    echo 'Did NOT find File4 Creating...'
    touch check4.txt
    echo 'Created File4'
    echo 'false' > check4.txt
fi
var4=$(cat check4.txt)

# Checking And Settings File5

if [[ -f $file5 ]]; then
    echo "Found File5"
else
    echo 'Did NOT find File5 Creating...'
    touch check5.txt
    echo 'Created File5'
    echo 'false' > check5.txt
fi
var5=$(cat check5.txt)

#Clean-Up 1

echo
echo "Clearing..."
sleep 1
clear

# Showing Options

mainrun() {
    echo
    echo
    echo
    echo
    echo
    echo -e "\033[1;95mMade By Wave Demure\033[1;93m"
    echo     '==================================================='
    echo -e '1) \033[0;34mBookmarklets:\033[1;93m' $var1
    echo -e '2) \033[0;34mInspect:\033[1;93m' $var2
    echo -e '3) \033[0;34mWeb Store Block:\033[1;93m' $var3
    echo -e '4) \033[0;34mClear Browser History\033[1;93m' $var4
    echo -e '6) \033[0;34mReset All\033[1;93m'
    echo     '==================================================='
    echo -e '\033[1;96m'

    # Prompt
    # test extra "SecondaryGoogleAccountSigninAllowed": true
    
    read -p "Pick from above (Number)> " poli
    echo
    if [[ $poli == "1" ]]; then
        if [[ $var1 == "true" ]]; then
            echo -e '\033[1;91mBlocking:\033[1;93m Bookmarklets'
        fi

        if [[ $var1 == "false" ]]; then
            echo -e '\033[1;92mUnblocking:\033[1;93m Bookmarklets '
        fi
    elif [[ $poli == "2" ]]; then
        if [[ $var2 == "true" ]]; then
            echo -e '\033[1;91mBlocking:\033[1;93m Inspect'
        fi

        if [[ $var2 == "false" ]]; then
            echo -e '\033[1;92mUnblocking:\033[1;93m Inspect'
        fi
    elif [[ $poli == "3" ]]; then
        if [[ $var3 == "true" ]]; then
            echo -e '\033[1;92mBlocking:\033[1;93m Web Store Block'
        fi

        if [[ $var3 == "false" ]]; then
            echo -e '\033[1;92mUnblocking:\033[1;93m Web Store Block'
        fi

    elif [[ $poli == "4" ]]; then
        if [[ $var4 == "true" ]]; then
            echo -e '\033[1;92mBlocking:\033[1;93m Clear Browser History'
        fi

        if [[ $var4 == "false" ]]; then
            echo -e '\033[1;92mUnblocking:\033[1;93m Clear Browser History'
        fi
    elif [[ $poli == "5" ]]; then
        if [[ $var5 == "true" ]]; then
            echo -e '\033[1;92mBlocking:\033[1;93m Secondary Account Signin'
        fi

        if [[ $var5 == "false" ]]; then
            echo -e '\033[1;92mUnblocking:\033[1;93m Secondary Account Signin'
        fi
    fi

    # Running Script

    if [[ $poli == "3" ]]; then
        if [[ $var3 == "true" ]]; then # Webstore false
            mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
            echo '{"ExtensionInstallBlocklist": ["*"]}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
            cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
            mount --bind /tmp/overlay/etc /etc
            echo 'false' > check3.txt
            var3='false'
        elif [[ $var3 == "false" ]]; then # Webstore true
            mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
            echo '{"ExtensionInstallBlocklist": null}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
            cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
            mount --bind /tmp/overlay/etc /etc
            echo 'true' > check3.txt
            var3="true"
        fi
    fi

    if [[ $poli == "4" ]]; then 
        if [[ $var4 == "true" ]]; then # History False
            mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
            echo '{"AllowDeletingBrowserHistory": false}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
            cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
            mount --bind /tmp/overlay/etc /etc
            echo 'false' > check4.txt
            var4="false"
        elif [[ $var4 == "false" ]]; then # History True
            mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
            echo '{"AllowDeletingBrowserHistory": true}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
            cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
            mount --bind /tmp/overlay/etc /etc
            echo 'true' > check4.txt
            var4="true"
        fi
    fi

    if [[ $poli == "1" ]]; then
        if [[ $var1 == "false" ]]; then # Bookmarklets true
            mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
            echo '{"URLBlocklist": ["zoom.us"]}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
            cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
            mount --bind /tmp/overlay/etc /etc
            echo 'true' > check1.txt
            var1="true"  
        elif [[ $var1 == "true" ]]; then #Bookmarklets false
            mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
            echo '{"URLBlocklist": ["https://accounts.google.com/AccountChooser", "chrome://flags", "chrome://inspect", "*/html/crosh.html", "mail.yahoo.com", "zoom.us", "javascript://*"]}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
            cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
            mount --bind /tmp/overlay/etc /etc
            echo 'false' > check1.txt
            var1="false" 
        fi
    fi

    if [[ $poli == "2" ]]; then
        if [[ $var2 == "false" ]]; then # Inspect true
        mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
            echo '{"DeveloperToolsAvailability": 1}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
            cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
            mount --bind /tmp/overlay/etc /etc
            echo 'true' > check2.txt
            var2="true"   
        elif [[ $var2 == "true" ]]; then #Inspect false
            mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
            echo '{"DeveloperToolsAvailability": 2}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
            cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
            mount --bind /tmp/overlay/etc /etc
            echo 'false' > check2.txt
            var2="false"  
        fi
    fi

    if [[ $poli == "6" ]]; then
        mkdir -p /tmp/overlay/etc/opt/chrome/policies/managed
        echo '{"DeveloperToolsAvailability": 2, "URLBlocklist": ["https://accounts.google.com/AccountChooser", "chrome://flags", "chrome://inspect", "*/html/crosh.html", "mail.yahoo.com", "zoom.us", "javascript://*"], "AllowDeletingBrowserHistory": false, "ExtensionInstallBlocklist": ["*"]}' > /tmp/overlay/etc/opt/chrome/policies/managed/policy.json
        cp -a -L /etc/* /tmp/overlay/etc 2> /dev/null
        mount --bind /tmp/overlay/etc /etc
        var1='false' && var2='false' && var3='false' && var4='false' var5='false'
        rm check1.txt && rm check2.txt && rm check3.txt && rm check4.txt && rm check5.txt
    fi

    clear
    echo
    echo
    echo
    echo
    echo
    echo -e "\033[1;95mMade By Wave Demure\033[1;96m"
    echo     '==================================================='
    echo -e '1) \033[0;34mBookmarklets:\033[1;93m' $var1
    echo -e '2) \033[0;34mInspect:\033[1;93m' $var2
    echo -e '3) \033[0;34mWeb Store Block:\033[1;93m' $var3
    echo -e '4) \033[0;34mClear Browser History\033[1;93m' $var4
    echo -e '6) \033[0;34mReset All\033[1;93m'
    echo     '==================================================='
    echo -e '\033[1;96m'

    # Create Function Rerun

    rerun_check() {
        # Ask to Go Back To Menu
        echo -e "\033[1;92mReturn to Menu?\033[1;97m "
        select rerun in Yes No 
        do
            echo $rerun
            break
        done

        # Running Back Or Skip

        if [[ $rerun == "Yes" ]]; then
            clear
            mainrun
        fi
    }
    echo
    if [[ $poli != "Exit" ]]; then
        rerun_check
    fi    
}
mainrun

# End of script

sleep 1
clear
echo
echo
echo
echo
 echo     '==================================================='
    echo -e '1) \033[0;34mBookmarklets:\033[1;93m' $var1
    echo -e '2) \033[0;34mInspect:\033[1;93m' $var2
    echo -e '3) \033[0;34mWeb Store Block:\033[1;93m' $var3
    echo -e '4) \033[0;34mClear Browser History\033[1;93m' $var4
    echo -e '5) \033[0;34mSecondary Account Signin\033[1;93m' $var5
    echo     '==================================================='
    echo -e '\033[1;96m'
echo

# Credits

echo
echo -e '\033[1;93m=================================================='
echo "Pollen - https://github.com/mercuryworkshop/pollen"
echo "Modified By Wave Demure"
echo -e '\033[1;93m=================================================='
cd /
