# load files
IFS=$'\r\n' GLOBIGNORE='*' command eval  'themes=($(cat ./_scripts/sh/_themes.txt))'

# new theme name
echo "🐙 \033[1;34m qual o nome do seu novo tema? \033[0m"
read newTheme
echo "🐙 \033[0m \033[1;34m $newTheme !!! \033[0m\033[1;32m vamo com tudo braço!! \033[0m"

theme=$newTheme
export theme

# select theme
echo "🐙 \033[1;34m selecione um dos temas para clonar? \033[0m"

PS3='🐙  Please enter your choice: '
select opt in "${themes[@]}"
do
   echo "🐙 \033[0m \033[1;34m $opt!!! \033[0m\033[1;32m HEYYYY! \033[0m"
   break
done

# copiar tema selecionado
cp -R ./_theme/$opt/ ./_theme/$newTheme

# remover .gemspec
rm ./_theme/$newTheme/*.gemspec

# criar novo .gemspec
sh ./_scripts/sh/create_GemSpec.sh

# atualizar array $themes
themes+=($newTheme)
echo "🐙 \033[0m \033[1;34m ${themes[@]}!!! \033[0m\033[1;32m HEYYYY! \033[0m"

# deletar themes-custom.txt
rm ./_scripts/sh/_themes-custom.txt

#  salvar $themes como themes-custom.txt
printf "%s\n" "${themes[@]}" > ./_scripts/sh/_themes.txt

