$('body').css('padding-top', $('.navbar').outerHeight() + 'px')

const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    var last_scroll_top = 0;
    $(window).on('scroll', function() {
        var scroll_top = window.scrollY;
        console.log(scroll_top);
        if(scroll_top > last_scroll_top && scroll_top > 80) {
            navbar.classList.add('scrolled-down');
            navbar.classList.remove('scrolled-up');
        }
        else {
            navbar.classList.add('scrolled-up');
            navbar.classList.remove('scrolled-down');
        }
        last_scroll_top = scroll_top;
    });
  }
}
// conviene ver si podemos sacar el jquery porque adapté el código de otro
// lado. SI NO LES GUSTA HAGAN UN SCRIPT Y GANEN LAS ELECCIONES
export { initUpdateNavbarOnScroll };
