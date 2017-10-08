# load files
IFS=$'\r\n' GLOBIGNORE='*' command eval  'themes=($(cat ./_scripts/sh/_themes.txt))'


if [ ${#themes[@]} -eq 0 ]; then
    echo "No themes to delete, all clean!!!!"
    break
else
    # select theme to delete
    echo "🐙 \033[1;34m selecione um dos temas para DELETAR? \033[0m"
    PS3='🐙  Please enter your choice: '
    select opt in "${themes[@]}"
    do
    echo "🐙 \033[0m \033[1;34m $opt!!! \033[0m\033[1;32m HEYYYY! \033[0m"
    break
    done

    # remover tema from array
    unset themes[$opt]

    # deletar themes-custom.txt
    rm ./_scripts/sh/_themes-custom.txt

    #  atualizar themes-custom.txt sem item
    printf "%s\n" "${themes[@]}" > ./_scripts/sh/_themes.txt

    # remover aruqivos do tema
    echo "Do you really wish to remove theme files?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) rm -rf ./_theme/$opt; break;;
            No ) exit;;
        esac
    done    
fi


