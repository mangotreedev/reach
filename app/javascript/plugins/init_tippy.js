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
  tippy(".donation-btn", {
    content: "Love it? Support us with pizza!",
  });
  tippy(".contribute-btn", {
    content: "Hate it? Make it better!",
  });
  tippy(".issue-btn", {
    content: "Improve it? Tell us how!",
  });
  tippy(".share-btn", {
    content: "Share the url with friends",
  });
  tippy(".report-btn", {
    content: "Report this photo",
  });
  tippy(".reacher-def", {
    content: "The person outkicking their coverage",
  });
  tippy(".choices-def", {
    content: "You know, the little faces you'd vote on",
  });
}

export default initTippy;
