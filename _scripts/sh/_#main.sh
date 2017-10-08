# todo

echo "🐙 \033[0m \033[1;34m Heyyyy!!! \033[0m\033[1;32m O que vc deseja fazer???? \033[0m"

# load tasks
IFS=$'\r\n' GLOBIGNORE='*' command eval  'tasks=($(cat ./_scripts/sh/_main-commands.txt))'

# remover aruqivos do tema
PS3='🐙  Please enter your choice: '

select opt in "${tasks[@]}"
do
   echo "🐙 \033[0m \033[1;34m $opt!!! \033[0m\033[1;32m HEYYYY! \033[0m"
    sh ./_scripts/sh/$opt.sh
    sh ./_scripts/sh/_#main.sh
   break
done