import Masonry from 'masonry-layout/dist/masonry.pkgd.min';

const initMasonry = () => {
  var elem = document.querySelector(".surveys-masonry");
  var msnry = new Masonry(elem, {
    itemSelector: ".survey-tile",
    columnWidth: 300,
    fitWidth: true,
    gutter: 16,
  });
}

export default initMasonry;
