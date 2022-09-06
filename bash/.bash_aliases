# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'

clear_history(){
    history -c
    cat /dev/null > $HISTFILE
    echo "History cleared"
}

mkcd(){

    local opt
    local path
    if [ $# -eq 0 ] || [ $1 = "-h" ] || [ $1 = "--help" ]; then
        echo "Usage: [-p/--path]... directory..."
        echo "      -p  --path directory    Create all directories in path"
        echo "      -h  --help              Show this useful information"
        echo
        return 0
    fi

    #Fetch the option after dashes
    case $1 in
        --*) opt=${1:2} ;;
        -*) opt=${1:1} ;;
    esac

    #Check if -p or --path is specified
    if [ "$opt" = "p" ] || [ "$opt" = "path" ]; then
        # Arg 2 must contain the path
        path=$2
        opt="-p"
        #No path argument
        if [ -z path ]; then
            echo "mkcd: Please specify the path";
            return 1
        fi
    #No options, continue
    elif [ -z $opt ]; then
        path=$1
    #Invalid options
    else
        echo "mkcd: Invalid option $opt, use -h for more information"
        return 0
    fi

    #Create the directory
    mkdir $opt $path
    #Log this if an error occured
    if [ $? -gt 0 ]; then
        echo "mkcd: Can\'t create $path directory in $(pwd)" 2>&1
        return 1
    fi

    #Change directory
    cd $path &> /dev/null
    #Log this if an error occured
    if [ $? -gt 0 ]; then
        echo "mkcd: Cant\'t change directory to $path" 2>&1
        return 1
    fi
}

export -f clear_history
export -f mkcd
