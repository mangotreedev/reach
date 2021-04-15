const initNavbarScroll = () => {
  const navbar = document.querySelector(".js-nav-scroll");
  if (navbar) {
    function debounce(func, wait = 10, immediate = true) {
      var timeout;
      return function () {
        var context = this,
          args = arguments;
        var later = function () {
          timeout = null;
          if (!immediate) func.apply(context, args);
        };
        var callNow = immediate && !timeout;
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
        if (callNow) func.apply(context, args);
      };
    }

    const navbarCheck = () => {
      const banner = document.querySelector('.banner');
      if (window.scrollY >= banner.clientHeight) {
        navbar.classList.remove("bg-transparent");
      } else {
        navbar.classList.add("bg-transparent");
      }
    }

    window.addEventListener("scroll", debounce(navbarCheck));
  }
};

export default initNavbarScroll;
