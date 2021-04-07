import { Controller } from "stimulus";

export default class extends Controller {

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

  copy(_event) {
    const url = _event.target.dataset.url;
    const textTemp = document.createElement("textarea");

    this._textAreaSetup(url, textTemp);

    document.execCommand("copy");

    document.body.removeChild(textTemp);
  }



}
