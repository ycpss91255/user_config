if status is-interactive
    # WSL
    # if not pgrep -x "sshd" > /dev/null
       # sudo service ssh --full-restart > /dev/null
    # end

    # Commands to run in interactive sessions can go here
end

function ll; ls -alhF;end
function la; ls -A; end
function l; ls -CF; end

function ehk; vim ~/.config/fish/functions/fish_user_key_bindings.fish; end
function ec; vim ~/.config/fish/config.fish; end
function sc
    source ~/.config/fish/config.fish
    echo "source user config.fish"
end
