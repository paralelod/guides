echo "🐙 \033[1;34m Criando Post Css para $theme \033[0m"

content = "module.exports = {
//   parser: 'sugarss',
//   plugins: {
//     'postcss-import': {},
//     'cssnext': {},
//     'autoprefixer': {},
//     'cssnano': {}
//   }
}"

# export check for boostrap
#bootstrap 4 loader needs post css config on root 

if [ "$theme" = "bootstrap" ]
then
echo  $content >> ./postcss.config.js
file -I  ./postcss.config.js
echo "encoding " ./postcss.config.js" ("us-ascii") to utf-8"
echo "🐙 \033[1;34m Bootstrap PostCSS done!!! \033[0m" 
else
echo  $content >> _config/postcss.config.js
file -I  _config/postcss.config.js
echo "encoding "_config/postcss.config.js" ("us-ascii") to utf-8"
echo "🐙 \033[1;34m BootstrapRC done!!! \033[0m"   
fi

echo "🐙 \033[1;34m PostCSS done!!! \033[0m"