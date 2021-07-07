# Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
    print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

zinit ice lucid
zinit snippet OMZL::history.zsh

zinit ice wait lucid
zinit snippet OMZL::key-bindings.zsh

zinit ice wait lucid
zinit snippet OMZL::completion.zsh

zinit ice wait lucid
zinit snippet OMZP::sudo

zinit ice wait lucid
zinit snippet OMZP::extract

zinit ice wait lucid
zinit snippet OMZP::command-not-found

zinit ice depth"1" wait blockf lucid atpull"zinit creinstall -q ."
zinit light zsh-users/zsh-completions

zinit ice depth"1" wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"
zinit light zdharma/fast-syntax-highlighting

zinit ice depth"1" wait lucid compile"{src/*.zsh,src/strategies/*.zsh}" atinit"bindkey '^f' forward-word" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice depth"1" wait lucid atload"zicdreplay"
zinit light skywind3000/z.lua

zinit ice depth"1" wait lucid pick"manydots-magic" compile"manydots-magic"
zinit light knu/zsh-manydots-magic

zinit ice depth"1" wait lucid atinit"zstyle ':history-search-multi-word' page-size '20'"
zinit light zdharma/history-search-multi-word

zinit ice depth"1" wait lucid
zinit light hlissner/zsh-autopair

zinit ice depth"1" wait lucid
zinit light MichaelAquilina/zsh-you-should-use

zinit ice depth"1" wait blockf lucid
zinit light "dominik-schwabe/zsh-fnm"

zinit ice depth"1" wait lucid from"gh-r" as"program" mv"nvim* -> nvim" pick"nvim/bin/nvim" bpick"*mac*"
zinit light neovim/neovim

zinit ice depth"1" wait lucid from"gh-r" as"program" mv"lf* -> lf" pick"lf" atinit"bindkey -s '^o' 'lfcd\n'"
zinit light gokcehan/lf

zinit ice depth"1" wait lucid from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zinit light BurntSushi/ripgrep

zinit ice depth"1" wait lucid from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat" atload"export BAT_THEME='gruvbox'"
zinit light sharkdp/bat

zinit ice depth"1" wait lucid from"gh-r" as"program" mv"bin/exa*->exa" pick"exa" atload"alias l='exa -lha --color=always --group-directories-first'"
zinit light ogham/exa

zinit ice depth"1" wait lucid from"gh-r" as"program" mv"delta* -> delta" pick"delta/delta"
zinit light dandavison/delta

zinit ice depth"1" wait lucid from"gh-r" as"program" mv"lazygit* -> lazygit" pick"lazygit"
zinit light 'jesseduffield/lazygit'

zinit ice depth"1" wait lucid from"gh-r" as"command" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd


# Lazt git
lg() {
  export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
  lazygit "$@"
  if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
    cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
    rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
  fi
}

# Lf
if [ -f "$LFCD" ]; then
  source "$LFCD"
fi

# Iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# Turn off proxies
alias disproxy='unset http_proxy https_proxy'

# SSH
alias bastion='ssh -p 60022 liyingjie@bastion.sidri.com'
alias zion='ssh 42@10.190.44.202'

