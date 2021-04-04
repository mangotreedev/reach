import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["popup"];

  display() {
    this.popupTarget.classList.add("is-visible");
  }

  hide() {
    this.popupTarget.classList.remove("is-visible");
  }

  overlayHide() {
    if (event.target === this.popupTarget ) {
      this.hide();
    }
  }
}
