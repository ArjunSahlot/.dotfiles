source ".bash/default.sh"

for f in ~/.bash/*; do
    if [ "$f" != ".bash/default.sh" ]; then
        source $f
    fi
done

