

menu=~/.config/hypr/scripts/execWofi.sh

function parse(){
    cat ~/.ssh/known_hosts | awk '{print $1}' | awk '!seen[$0]++'
}

choice=$(parse | $menu -i -dmenu | tr -d 'wofi\n')

echo $choice

alacritty -e ssh root@$choice



