// site
var siteName = ''; // incluir "/" antes do nome 
var siteTheme = require('./theme').theme;


//design
var designSrc = './_design/layout.sketch';

// yaml  site config
var configYamlSrc = './_config/_site/';
var configYamlBuild = configYamlSrc + '/build';

//dev
var devSrc = './_content';
var devBuild = './_build'
var dataSrc = devSrc + '/_data';


//theme
var themeSrc = './_theme/'+ siteTheme;
var themeAssets = themeSrc + '/assets';
var imgsSrc = themeSrc + '/_img';



// site dist
var distSrc = '../dist'+ siteName;
var distJekyll = distSrc +'/jekyll';
var distHtml = distSrc + '/html';
var tempHtml = '/_temp-html'
var dockerVolume = distSrc +'/docker-volume';



module.exports = {
    //--------- for webpack config----------//

    site:{
        siteName: siteName,
        siteTheme: siteTheme
    },
    //--------- deploy ----------//

    deploy: {
        ghPages: {
            branch: 'gh-pages',
            src: distJekyll + '/**/*.*'
        },
        html: {
            branch: 'html',
            src: distHtml + '/**/*.*'
        },
        dockerVolume: {
            branch: 'docker-volume',
            src: dockerVolume + '/**/*.*',
            files: [
                './**',
                '!./{node_modules,node_modules/**}',
                '!./{_build,_build/**}'
            ],
            dest: dockerVolume
        }

    },

    //--------- theme ----------//

    theme: {
        includes: themeSrc + '/_includes/**/*.*',
        layouts: themeSrc + '/style.json'
    },

    //--------- manifest ----------//

    manifest: {
        manifestDest: dataSrc + '/manifest.json',
        styleBundle: 'style',
        styleDest: dataSrc + '/style.json',
        scriptBundle: 'script',
        scriptDest: dataSrc + '/script.json',
        imagesBundle: 'images',
        imagesDest: dataSrc + '/image.json',
        jekyllBundle: 'jekyll',
        jekyllDest: dataSrc + '/jekyll.json'
    },

    //--------- sketch app ----------//

    sketch: {
        sketchSrc: designSrc,
        sketchImgDest: imgsSrc
    },

    //--------- images ----------//

    images: {
        // responsive resize

        imgSrc: imgsSrc,
        imgSrcResp: imgsSrc + '/responsive/',
        imgDest: themeAssets + '/img/',

        imgBreakpoints: {
            sizes: [480, 791, 1042, 1482, 1920]
        },

        //dist

        imgDistSrc: [
            themeAssets + '/imgs/**/*.*',
            themeAssets + '/fonts/**/*.*'
        ],
        imgDistDest: distSrc + '/lib/imgs',
        fontsDistDest: distSrc + '/lib/fonts'
    },

    //--------- yaml ----------//

    yaml: {
        yamlDevSrc: [
            configYamlSrc + '/dev.yml',
            configYamlBuild + '/*.yml'
        ],
        yamlDistGhPagesSrc: [
            configYamlSrc + '/dist-gh-pages.yml',
            configYamlBuild + '/*.yml'
        ],
        yamlDistHtmlSrc: [
            configYamlSrc + '/dist-html.yml',
            configYamlBuild + '/*.yml'
        ],

        pathBuild: devSrc,
        yamlBuild: '_config.yml',
        yamlClean: configYamlSrc + '_config.yml'
    },

    
    //--------- jekyll ----------//

    jekyll: {

        build: 'jekyll build --source ' + devSrc + ' --destination '+ devBuild,
        buildWatch: 'jekyll build --watch --source ' + devSrc + ' --destination '+ devBuild,

        jekyllSrcDist: [
            '!'+ devBuild+'/**/*.*',
            devSrc + '/**/*.*',
            '!' + themeSrc + '/.git',
            '!' + themeSrc + '/*.gemspec',
            '!' + themeSrc + '/.gitignore',
            '!' + themeSrc + '/*.md',
            themeSrc + '/**/**/*.*',
            themeAssets
        ],

        jekyllPathDist: distJekyll,
        jekyllBuildDist: 'jekyll build --config '+ distJekyll + '/_config.yml --source ' + distJekyll + ' --destination '+ distJekyll + '/_site',
        
        htmlPathDist: distSrc+ tempHtml,
        htmlBuildDist: 'jekyll build --config '+ distSrc +  tempHtml + '/_config.yml --source ' + distSrc + tempHtml+ ' --destination '+ distSrc+'/html',
    },

    //--------- browser sync ----------//

    browsersync: {
        baseDir: devBuild,
        watchPath: devBuild + '/**',
        port: 1818,
        baseDirDist: distSrc + '/_site/',
        portDist: 8383
    },

    //--------- watch ----------//

    watch: {
        jekyll: devSrc + '/**',
        yml: [
                configYamlSrc + '/**',
                configYamlBuild + '/**'
            ],
        imgs: imgsSrc + '/**',
        assets: [
            themeSrc + '/*.js',
            themeSrc + '/_sass/**',
            themeSrc + '/_scripts/**',
            themeSrc + '/_imgs/**',
        ],
        theme: [
            themeSrc + '/_includes/**',
            themeSrc + '/_layouts/**',
            themeAssets+'/**'
        ],
    }

};