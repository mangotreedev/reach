import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["popup"];

  display() {
    this.popupTarget.classList.add("is-visible");
  }
}
