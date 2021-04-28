import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["popup", "agree", "disagree"];

  _getCookie(name) {
    let result = document.cookie.match(
      "(^|[^;]+)\\s*" + name + "\\s*=\\s*([^;]+)"
    );
    return result ? result.pop() : "";
  }

  _setCookie(name, value) {
    document.cookie = `${name}=${value}`;
  }

  _hide() {
    this.popupTarget.classList.remove("is-visible");
  }

  agree() {
    if (event.target === this.agreeTarget) {
      this._setCookie("reach_cookie_monster", "me_love_cookie");
      this._setCookie("reach_shown_policy", "true");
      this._hide();
    }
  }

  disagree() {
    if (event.target === this.disagreeTarget) {
      this._setCookie("reach_shown_policy", "true");
      this._hide();
    }
  }
}
