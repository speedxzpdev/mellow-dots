# Starship prompt
starship init fish | source

# Custom abbreviations
abbr --add gs 'git status'
abbr --add ga 'git add'
abbr --add gc 'git commit'
abbr --add gp 'git push'


if status is-interactive
    fastfetch
end