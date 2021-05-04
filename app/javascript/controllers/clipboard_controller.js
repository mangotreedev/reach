import { Controller } from "stimulus";
import { Toast } from "../utils/toast_mixin";

export default class extends Controller {
  static targets = ["btn"];

  _textAreaSetup(url, textTemp) {
    textTemp.style.position = "fixed";
    textTemp.style.top = 0;
    textTemp.style.left = 0;
    textTemp.style.width = "2em";
    textTemp.style.height = "2em";
    textTemp.style.padding = 0;
    textTemp.style.border = "none";
    textTemp.style.outline = "none";
    textTemp.style.boxShadow = "none";
    textTemp.style.background = "transparent";
    textTemp.value = url;
    document.body.appendChild(textTemp);
    textTemp.focus();
    textTemp.select();
  }

  copy() {
    const url = this.btnTarget.dataset.url;
    const textTemp = document.createElement("textarea");

    this._textAreaSetup(url, textTemp);

    document.execCommand("copy");

    document.body.removeChild(textTemp);

    Toast.fire({
      icon: "success",
      title: "Share with your friends, URL copied to clipboard",
    });
  }

  connect() {
    const trigger = document.querySelector(".js-fire-clipboard-copy-trigger");
    if (trigger) {
      this.copy(this.btnTarget);
    }
  }
}
