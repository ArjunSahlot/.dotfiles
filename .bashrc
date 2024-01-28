source ~/.bash/default.sh

for f in ~/.bash/*; do
    if [ "$f" != "$HOME/.bash/default.sh" ]; then
        source $f
    fi
done

