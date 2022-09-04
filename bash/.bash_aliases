# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'

alias neovim='nvim.appimage'
alias py310='python3.10'

#Drive variables
alias cd-c='cd /mnt/c'
alias cd-d='cd /mnt/d'
#XAMPP server. Run and stop
lampp_root=/opt/lampp
lampp_exe=$lampp_root/lampp

if test -f "$lampp_exe"; then
    alias lampp-start="sudo $lampp_exe start" 
    alias lampp-stop="sudo $lampp_exe stop" 
else
    echo "XAMPP is not yet installed.";
fi

#XAMPP htdocs
alias lampp-htdocs='cd $lampp_root/htdocs'

#cpython_dev

if [ -x ~/OpenSource/cpython/python ]; then
	py_dev=~/OpenSource/cpython/python
	export PY_DEV=$py_dev
fi
