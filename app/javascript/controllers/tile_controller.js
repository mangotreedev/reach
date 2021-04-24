import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";
import { Toast } from "../utils/toast_mixin";

export default class extends Controller {
  static targets = [ "popup", "status" ];

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

    Toast.fire({
      icon: "success",
      title: "Photo added to circulation",
    });
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

    this.statusTarget.innerHTML = `
      <span class="text-xs font-semibold inline-block py-1 px-2 uppercase rounded text-yellow-600 bg-yellow-200 uppercase last:mr-0 mr-1">
        NOT PUBLISHED
      </span>
    `;

    Toast.fire({
      icon: "warning",
      title: "Photo removed from circulation",
    });
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

    Toast.fire({
      icon: "error",
      title: "Photo permanently deleted",
    });
  }
}
