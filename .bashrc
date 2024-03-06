source ~/.bash/default.sh

for f in ~/.bash/*; do
    if [ ! -f $f ]; then
        continue
    fi
    if [ "$f" != "$HOME/.bash/default.sh" ]; then
        source $f
    fi
done

for f in ~/.bash/completions/*; do
    if [ ! -f $f ]; then
        continue
    fi
    source $f
done

