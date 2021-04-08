import tippy from "tippy.js";

const initTippy = () => {
  tippy(".delete-btn", {
    content: "Delete Photo",
  });
  tippy(".edit-btn", {
    content: "Add Choices & Publish",
  });
  tippy(".results-btn", {
    content: "View Results",
  });
  tippy(".approve-btn", {
    content: "Approve Photo",
  });
}

export default initTippy;
