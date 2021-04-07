import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";

export default class extends Controller {
  static targets = ["popup"];

  connect() {
    console.log("Dynamic modal has connected")
  }

  display(_event) {
    const surveyId = parseInt(
      _event.target.closest(".survey-tile").dataset.survey,
      10
    );
    this.popupTarget.classList.add("is-visible");
    this.popupTarget.dataset.tempSurvey = surveyId;
  }

  hide() {
    this.popupTarget.classList.remove("is-visible");
  }

  deleteTile() {
    const surveyId = parseInt(this.popupTarget.dataset.tempSurvey, 10);

    fetchWithToken(`/surveys/${surveyId}`, {
      method: "DELETE",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
    });

    document.querySelector(`[data-survey='${surveyId}']`).remove();

    this.hide();
  }

  overlayHide() {
    if (event.target === this.popupTarget) this.hide();
  }
}
