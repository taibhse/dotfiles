# Function to get the current git branch
get_git_branch() {
  git branch --show-current 2> /dev/null
}

# Function to format the prompt with git branch info
git_prompt_info() {
  local branch=$(get_git_branch)
  if [ -n "$branch" ]; then
    echo " (%F{yellow}$branch%f)"
  fi
}

# Set the prompt
setopt PROMPT_SUBST
PROMPT='%n@%m:%~$(git_prompt_info) %# '

alias tt='tmux a'
