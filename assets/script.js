jQuery(document).ready(function ($) {

    var $container = $(".grid-isotope");

    // Filter isotope
    $container.isotope({
        // options
        itemSelector: ".item",
        transitionDuration: 0,
        layoutMode: "masonry",
        masonry: {
          columnWidth: '.item'
        }
    });

      // layout Isotope again after all images have loaded
      $container.imagesLoaded( function() {
          $container.isotope('layout');
      });

          $('.filters a').click(function(){
        var selector = $(this).attr('data-filter');
        $container.isotope({ filter: selector });
        return false;
      });
            
    });
