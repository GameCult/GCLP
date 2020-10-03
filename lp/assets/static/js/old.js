//__________________ https://gamecult.games/user/plugins/backtotop/assets/js/return-to-top.js
// ===== Scroll to Top ====
$(window).scroll(function () {
    if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
        $('#return-to-top').fadeIn(200);    // Fade in the arrow
    } else {
        $('#return-to-top').fadeOut(200);   // Else fade out the arrow
    }
});
$('#return-to-top').click(function () {      // When arrow is clicked
    $('body,html').animate({
        scrollTop: 0                       // Scroll to top of body
    }, 500);
});
// __________________ https://gamecult.games/user/plugins/simplesearch/js/simplesearch.js
((function(){
    if (!Element.prototype.matches) {
        Element.prototype.matches = Element.prototype.msMatchesSelector || Element.prototype.webkitMatchesSelector;
    }
    var findAncestor = function(el, selector) {
        while ((el = el.parentElement) && !((el.matches || el.matchesSelector).call(el, selector))) {}
        return el;
    };

    var fields = document.querySelectorAll('input[name="searchfield"][data-search-input]');
    Array.prototype.forEach.call(fields, function(field) {
        var form = findAncestor(field, 'form[data-simplesearch-form]'),
            min = field.getAttribute('data-min') || false,
            location = field.getAttribute('data-search-input'),
            separator = field.getAttribute('data-search-separator');

        if (min) {
            var invalid = field.getAttribute('data-search-invalid');
            field.addEventListener('keydown', function() {
                field.setCustomValidity(field.value.length >= min ? '' : invalid);
            });
        }

        form.addEventListener('submit', function(event) {
            event.preventDefault();

            if (field.checkValidity()) {
                window.location.href = location + separator + field.value;
            }
        });
    });
})());

//_______________ https://gamecult.games/user/themes/klb4/js/jquery.treemenu.js
/*
 treeMenu - jQuery plugin
 version: 0.6

 Copyright 2014 Stepan Krapivin

*/
(function($){
    $.fn.treemenu = function(options) {
        options = options || {};
        options.delay = options.delay || 0;
        options.openActive = options.openActive || false;
        options.closeOther = options.closeOther || false;
        options.activeSelector = options.activeSelector || ".active";

        this.addClass("treemenu");

        if (!options.nonroot) {
            this.addClass("treemenu-root");
        }

        options.nonroot = true;

        this.find("> li").each(function() {
            e = $(this);
            var subtree = e.find('> ul');
            var button = e.find('.toggler').eq(0);

            if(button.length == 0) {
                // create toggler
                var button = $('<span>');
                button.addClass('toggler');
                e.prepend(button);
            }

            if(subtree.length > 0) {
                subtree.hide();

                e.addClass('tree-closed');

                e.find(button).click(function() {
                    var li = $(this).parent('li');

                    if (options.closeOther && li.hasClass('tree-closed')) {
                        var siblings = li.parent('ul').find("li:not(.tree-empty)");
                        siblings.removeClass("tree-opened");
                        siblings.addClass("tree-closed");
                        siblings.removeClass(options.activeSelector);
                        siblings.find('> ul').slideUp(options.delay);
                    }

                    li.find('> ul').slideToggle(options.delay);
                    li.toggleClass('tree-opened');
                    li.toggleClass('tree-closed');
                    li.toggleClass(options.activeSelector);
                });

                $(this).find('> ul').treemenu(options);
            } else {
                $(this).addClass('tree-empty');
            }
        });

        if (options.openActive) {
            var cls = this.attr("class");

            this.find(options.activeSelector).each(function(){
                var el = $(this).parent();

                while (el.attr("class") !== cls) {
                    el.find('> ul').show();
                    if(el.prop("tagName") === 'UL') {
                        el.show();
                    } else if (el.prop("tagName") === 'LI') {
                        el.removeClass('tree-closed');
                        el.addClass("tree-opened");
                        el.show();
                    }

                    el = el.parent();
                }
            });
        }

        return this;
    }
})(jQuery);

//____________________________ https://gamecult.games/user/themes/klb4/js/site.js
var isTouch = window.DocumentTouch && document instanceof DocumentTouch;

function scrollHeader() {
    // Has scrolled class on header
    var zvalue = $(document).scrollTop();
    if ( zvalue > 75 )
        $("#header").addClass("scrolled");
    else
        $("#header").removeClass("scrolled");
}

function parallaxBackground() {
    $('.parallax').css('background-positionY', ($(window).scrollTop() * 0.3) + 'px');
}

jQuery(document).ready(function($){

    scrollHeader();

    // Scroll Events
    if (!isTouch){
        $(document).scroll(function() {
            scrollHeader();
            parallaxBackground();
        });
    };

    // Touch scroll
    $(document).on({
        'touchmove': function(e) {
            scrollHeader(); // Replace this with your code.
        }
    });

    //Smooth scroll to start
    $('#to-start').click(function(){
        var start_y = $('#start').position().top;
        var header_offset = 45;
        window.scroll({ top: start_y - header_offset, left: 0, behavior: 'smooth' });
        return false;
    });

    //Smooth scroll to top
    $('#to-top').click(function(){
        window.scroll({ top: 0, left: 0, behavior: 'smooth' });
        return false;
    });

    // Responsive Menu
    $('#toggle').click(function () {
        $(this).toggleClass('active');
        $('#overlay').toggleClass('open');
        $('body').toggleClass('mobile-nav-open');
    });

    // Tree Menu
    $(".tree").treemenu({delay:300});

});