# Search through commands history
# Type the first part of the command, then use arrow keys
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Show active GIT branch
# Source: http://jasonseifer.com/2010/05/05/osx-post-install-guide-4
#         https://github.com/blog/297-dirty-git-state-in-your-prompt
pgb() {
  git branch --no-color 2> /dev/null | \
    sed -e '/^[^*]/d' -e "s/* \(.*\)/ →\ \1$(parse_git_dirty)/"
}

function parse_git_dirty {
  gs=$(git status 2> /dev/null | tail -n1)
  [[ $gs != "nothing to commit, working directory clean" ]] && echo " *"
}

export GIT_PS1_SHOWDIRTYSTATE=true

# Colours
cr='\e[0m'    # Colour Reset

# Bold
cg='\e[1;32m' # Green
cy='\e[1;33m' # Yellow
cb='\e[1;34m' # Blue
cp='\e[1;35m' # Purple
cc='\e[1;36m' # Cyan
cw='\e[1;37m' # White

export PS1="\[${cw}\][\[${cp}\]\u\[${cw}\]@\[${cg}\]\h\[${cw}\]:\[${cc}\]\w\[${cy}\]$(pgb)\[${cw}\]]\n$ \[${cr}\]"

# Internationalization Environment Variables
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
