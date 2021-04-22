import Cropper from "cropperjs";
import { fetchWithToken } from "../utils/fetch_with_token";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'image' ];

  connect() {
    this.cropper = new Cropper(this.imageTarget, {
      aspectRatio: 4 / 5,
      movable: false,
      zoomeOnWheel: false
    });
  }

  addChoice() {
    const data = this.cropper.getData({rounded: true});

    fetchWithToken(`/surveys/${this.data.get("survey-id")}/choices`, {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ choice: data }),
    })
    .then((response) => response.json())
    .then((data) => {
      const choicesContainer = document.querySelector('.choices__container');
      choicesContainer.insertAdjacentHTML('beforeend', data.choice)
    });
  };
}

// REFACTOR: Make controller async
