import Cropper from "cropperjs";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'image' ];

  connect() {
  const cropper = new Cropper(this.imageTarget, {
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
  console.log(cropper);
  }

  addChoice() {
    console.log("Adding Choice!");
  }
}
