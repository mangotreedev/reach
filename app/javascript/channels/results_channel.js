import consumer from "./consumer";

const initResultsCable = () => {
  const resultsContainer = document.getElementById("resultsContainer");
  if (resultsContainer) {
    const id = resultsContainer.dataset.surveyId;

    consumer.subscriptions.create(
      { channel: "ResultsChannel", id: id },
      {
        connected() {
          console.log("ResultsChannel Subscribed! 🎉");
        },
        received(data) {
          console.log(data); // called when data is broadcast in the cable
        },
      }
    );
  }
};

document.addEventListener('turbolinks:load', () => {
  initResultsCable();
});
