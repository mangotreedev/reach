import Cropper from "cropperjs";

export const initCropper = () => {
  const image = document.getElementById("js-crop-image");
  console.log(image);
  const cropper = new Cropper(image, {
    crop(event) {
      console.log(event.detail.x);
      console.log(event.detail.y);
      console.log(event.detail.width);
      console.log(event.detail.height);
      console.log(event.detail.rotate);
      console.log(event.detail.scaleX);
      console.log(event.detail.scaleY);
    },
  });
}

