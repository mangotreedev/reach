import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";

export default class extends Controller {
  static targets = [ "popup" ];

  approve() {
    const surveyId = parseInt(this.element.dataset.survey, 10);
    fetchWithToken(`/surveys/${surveyId}/approval`, {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
    });
    this.element.remove();
    // TODO: Add sweet alert here to show photo is now approved
  }

  unpublish() {
    const surveyId = parseInt(this.element.dataset.survey, 10);
    fetchWithToken(`/surveys/${surveyId}/publication`, {
      method: "DELETE",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
    });
    // TODO: Add sweet alert here to show photo is no longer published
  }

  delete() {
    const surveyId = parseInt(this.element.dataset.survey, 10);
    fetchWithToken(`/surveys/${surveyId}`, {
      method: "DELETE",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
    });

    this.element.remove();
    // TODO: Add sweet alert here to show photo has been deleted
  }
}
