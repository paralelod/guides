echo "🐙  \033[1;34m ATTENTION: vamo remover o tema atual se existir algum!! \033[0m"

IFS=$'\r\n' GLOBIGNORE='*' command eval  'themes=($(cat ./_scripts/sh/_themes.txt))'
IFS=$'\r\n' GLOBIGNORE='*' command eval  'themeActive=($(cat ./_scripts/sh/_theme-active.txt))'

PS3=' 🐙 Please enter your choice: '

select opt in "${themes[@]}"
do
   echo "🐙 \033[0m \033[1;34m $opt!!! \033[0m\033[1;32m Vamos instalar! \033[0m"
   break
done

theme=$opt
export theme

# 

rm  ./_scripts/sh/_theme-active.txt
rm  ./_theme/$themeActive/$themeActive.gemspec
rm  ./_scripts/gulp/theme.js
rm -rf ./_config/
rm  Gemfile
rm  Gemfile.lock

if [ $themeActive = "bootstrap" ]
then
rm  ./.bootstraprc
rm ./_config/webpack.bootstrap.config.js
rm  ./postcss.config.js
else
rm  _config/postcss.config.js 
fi

# 

sh ./_scripts/sh/create_Config-_main.sh

echo "module.exports = {theme: '$opt'}" >> ./_scripts/gulp/theme.js

sh ./_scripts/sh/create_GemSpec.sh
sh ./_scripts/sh/create_Gemfile.sh
sh ./_scripts/sh/create_Hologram.sh

if [ "$opt" = "bootstrap" ]
then
    sh ./_scripts/sh/create_BootstrapRC.sh
    sh ./_scripts/sh/create_Webpack-Bootstrap.sh
    sh ./_scripts/sh/create_Webpack-Dev-Bootstrap.sh
    sh ./_scripts/sh/create_Webpack-Dist-Bootstrap.sh
    echo "🐙 \033[0m \033[1;34m boot!!! \033[0m\033[1;32m boot baby! \033[0m"
else
    sh ./_scripts/sh/create_Webpack-Dev.sh
    sh ./_scripts/sh/create_Webpack-Dist.sh
fi
sh ./_scripts/sh/create_Postcss.sh

bundle update
bundle install


echo "$opt" >> ./_scripts/sh/_theme-active.txt
