# _site/build/config.yml

echo "
# Build settings - PRODUCTION
markdown: kramdown
# gems: [jekyll-paginate,jekyll-sitemap]
exclude: [/gulp, /node_modules,gulpfile.js,_assets,bower.json,Gemfile ,Gemfile.lock,package.json,.publish,]
# theme: bootstrap
theme: $theme
" >> _config/_site/build/config.yml

echo "🐙 \033[1;34m ${configSources[$i]} YML!!! \033[0m"

# _site/ custom...

IFS=$'\r\n' GLOBIGNORE='*' command eval  'configSources=($(cat ./_scripts/sh/_config-build-sources.txt))'

for (( i = 0 ; i < ${#configSources[@]} ; i++))
do
    echo "
    #insert content for site ${configSources[$i]} / company ...
    " >> _config/_site/build/${configSources[$i]}.yml

    echo "🐙 \033[1;34m ${configSources[$i]} YML!!! \033[0m"
done
