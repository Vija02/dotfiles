# My Dotfiles

All of the conf files can be found in `symlinks`. There are some installer here and there but it probably won't work like you expect it to be.

Currently I'm using Manjaro(Arch) so most of the stuff is tailored for that.  
I used Ubuntu & Fedora before so there might be some traces of those, but don't count on any of those working.

## Quick Setup
`bash <(curl -fsSL https://raw.github.com/vija02/dotfiles/master/bootstrap.sh)`  
Well, that probably won't work cause no curl -w-. Here's wget:  
`bash <(wget -qO- https://raw.github.com/vija02/dotfiles/master/bootstrap.sh)`

After running that, you should be able to access all the scripts through `make`. That is, if you're using Arch or the likes.  
Otherwise, the `scripts` folder might contain some Ubuntu/Fedora stuff.
