import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";

export default class extends Controller {
  static targets = [];

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

    console.log("And then some dom manipulation")
  }
}
