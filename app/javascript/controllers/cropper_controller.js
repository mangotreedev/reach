import Cropper from "cropperjs";
import { fetchWithToken } from "../utils/fetch_with_token";
import { Toast } from "../utils/toast_mixin";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["image"];

  connect() {
    this.cropper = new Cropper(this.imageTarget, {
      aspectRatio: 4 / 5,
      movable: false,
      zoomeOnWheel: false,
    });
  }

  async addChoice() {
    const data = this.cropper.getData({ rounded: true });

    const response = await fetchWithToken(
      `/surveys/${this.data.get("survey-id")}/choices`,
      {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ choice: data }),
      }
    );
    const responseData = await response.json();
    const choicesContainer = document.querySelector(".choices__container");
    choicesContainer.insertAdjacentHTML("beforeend", responseData.choice);
    Toast.fire({
      icon: "success",
      title: "Choice successfully added",
    });
  }
}
