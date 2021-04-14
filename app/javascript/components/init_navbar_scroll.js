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
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add("bg-white");
      } else {
        navbar.classList.remove("bg-white");
      }
    }

    window.addEventListener("scroll", debounce(navbarCheck));
  }
};

export default initNavbarScroll;
