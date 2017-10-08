var fs = require('fs');
var path = require( 'path' );
var gm = require('gm').subClass({imageMagick: true});

  
  
// gm('img.jpeg')
// .identify(function (err, geometry) {
//   if (!err); //console.log(geometry);
//   var hello = JSON.stringify(geometry);
//   fs.writeFile('helloworld.json', hello, function (err) {
//   if (err) return console.log(err);
//     return hello;
//   });
// });

var src = './';
var metadata = [];
fs.readdir( src,function( err, files ) {

        if( err ) {
            console.error( "Could not list the directory.", err );
            process.exit( 1 );
        } 

        
        files.forEach( function( file, index ) {
          var toPath = path.join( src, file );

              fs.stat( toPath, function( error, stat ) {

                if( path.extname(file) == '.jpeg')
                  //console.log( "'%s' is a file.", toPath );
                  gm(file)
                  .identify(function (err, data) {
                    metadata.push(data);
                    

                    var jsonMeta = JSON.stringify(metadata);
                    //console.log(metadata[0].Properties);
                    todasProp=JSON.stringify(metadata[0].Properties);
                    //console.log(todasProp);
                    
                    // todasProp.forEach( function( util, index ) {
                    //   console.log(util);
                    // });

                    fs.writeFile('helloword.json', todasProp, function (err) {
                    if (err) return console.log(err);
                      return metadata;
                    });

                    
                    
                  });
            } );
          } );
        } );

var contents = fs.readFileSync("helloword.json");
var forte = JSON.parse(contents);
var mundo = 'exif:Artist';
 console.log(forte[mundo]);


 for(var exKey in forte) {
      //console.log("key:"+exKey+", value:"+forte[exKey]);
      //console.log(exKey);
 }

