# check https://github.com/zdharma-continuum/zinit/discussions/651#discussioncomment-11442498
_fix-omz-plugin() {
    [[ -f ./._zinit/teleid ]] || return 1
    local teleid="$(<./._zinit/teleid)"
    local pluginid
    for pluginid (${teleid#OMZ::plugins/} ${teleid#OMZP::}) {
        [[ $pluginid != $teleid ]] && break
    }
    (($?)) && return 1
    print "Fixing $teleid..."
    git clone --quiet --no-checkout --depth=1 --filter=tree:0 https://github.com/ohmyzsh/ohmyzsh ./.ohmyzsh
    cd ./.ohmyzsh
    git sparse-checkout set --no-cone /plugins/$pluginid
    git checkout --quiet
    cd ..
    local file
    for file (./.ohmyzsh/plugins/$pluginid/*~(.gitignore|*.plugin.zsh)(D)) {
        print "Copying ${file:t}..."
        cp -R $file ./${file:t}
    }
    rm -rf ./.ohmyzsh 2>&1 >/dev/null
}

# load essential completion
zinit lucid light-mode for \
  as'completion' zsh-users/zsh-completions

# install oh my zsh plugins as snippets
zinit wait'2' lucid light-mode for \
  pick'alias-tips.plugin.zsh' djui/alias-tips \
  as'completion' pick'_curl' Valodim/zsh-curl-completion \
  atpull"%atclone" atclone"_fix-omz-plugin" OMZP::{git,mvn,sudo,extract,command-not-found} \
  zdharma/fast-syntax-highlighting
