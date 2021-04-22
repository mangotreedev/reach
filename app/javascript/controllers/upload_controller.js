import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'label', 'input' ];
  static values = { defaultLabel: String };

  initialize() {
    this.defaultLabelValue = this.labelTarget.innerHTML;
  }

  _clear() {
    this.labelTarget.innerHTML = this.defaultLabelValue;
  }

  dragIn() {
    event.preventDefault();
    this.labelTarget.classList.add("bg-white", "bg-opacity-25");
  }

  dragOut() {
    event.preventDefault();
    this.labelTarget.classList.remove("bg-white", "bg-opacity-25");
    this._clear();
  }

  _updateInputLabel() {
    let fileNames = Array.from(this.inputTarget.files).map(file => file.name).join(', ');
    this.labelTarget.classList.remove(
      "border-dashed",
      "bg-white",
      "bg-opacity-25"
    );
    this.labelTarget.innerHTML = fileNames ? fileNames : this.defaultLabelValue;
  };

  dropFile() {
    event.preventDefault();
    this.inputTarget.files = event.dataTransfer.files;
    this._updateInputLabel();
  }

  changeInput() {
    this._updateInputLabel();
  }

}
