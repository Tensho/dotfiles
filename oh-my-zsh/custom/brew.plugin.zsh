alias brew-list='brew ls --versions'
# Used function instead of alias to not fight with '' and "" escaping.
# Used optional keyword "function" because of dashed name.
function brew-deps {
  brew list | while read cask; do echo -n "\e[1;34m$cask ->\e[0m"; brew deps $cask | awk '{printf(" %s ", $0)}'; echo ""; done
}
