import Masonry from 'masonry-layout';
import imagesLoaded from 'imagesloaded';

const initMasonry = () => {
  let grid = document.querySelector(".surveys-masonry");

  if (grid) {
    imagesLoaded(grid, function() {
      let msnry = new Masonry(grid, {
        itemSelector: ".survey-tile",
        columnWidth: 300,
        fitWidth: true,
        gutter: 16,
      });
    });
  }

}

export default initMasonry;
