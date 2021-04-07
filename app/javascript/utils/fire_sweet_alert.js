import { Toast } from "./toast_mixin";

export const fireSweetAlert = () => {
  const sweetAlertFlash = document.querySelector(
    ".js-fire-sweet-alert-trigger"
  );
  if (sweetAlertFlash) {
    Toast.fire({
      icon: "info",
      position: "bottom-end",
      title: sweetAlertFlash.dataset.message,
      timer: 4000,
    });
  }
};
