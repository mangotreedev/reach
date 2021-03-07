import Cropper from "cropperjs";
import { fetchWithToken } from "../utils/fetch_with_token";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'image' ];

  connect() {
    this.cropper = new Cropper(this.imageTarget, {
      initialAspectRatio: 4 / 5,
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

  addChoice() {
    this.cropper.getCroppedCanvas().toBlob((blob) => {
      const formData = new FormData();
      formData.append('croppedImage', blob/*, 'temp.png' */);
      fetchWithToken(`/surveys/${this.data.get("survey-id")}/choices`, {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ choice: { photo: formData } }),
      })
        .then((response) => response.json())
        .then((data) => {
          console.log(data);
        });
    });

  }
}
