IFS=$'\r\n' GLOBIGNORE='*' command eval  'configSources=($(cat ./_scripts/sh/_config-sources.txt))'

for (( i = 0 ; i < ${#configSources[@]} ; i++))
do
    echo "Element [$i]: ${configSources[$i]}"
    echo "🐙 \033[1;34m qual default url para ${configSources[$i]}? \033[0m"
    read siteUrl
    echo "🐙 \033[1;34m qual baseUrl para ${configSources[$i]}? \033[0m"
    read baseUrl
    echo "
    #DEV
    url: '$siteUrl' # the base hostname & protocol for your site
    baseurl: '$baseUrl' # only for github, gulp baseurl set in config_${configSources[$i]}.yml
    " >> _config/_site/${configSources[$i]}.yml

    echo "🐙 \033[1;34m ${configSources[$i]} YML!!! \033[0m"
done
