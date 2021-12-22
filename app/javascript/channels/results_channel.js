import consumer from "./consumer";

const initResultsCable = () => {
  const resultsContainer = document.getElementById("resultsContainer");
  if (resultsContainer) {
    const id = resultsContainer.dataset.surveyId;

    consumer.subscriptions.create(
      { channel: "ResultsChannel", id: id },
      {
        received(data) {
          for (const choice in data) {
            const choiceElement = document.getElementById(choice);
            choiceElement.querySelector('.choice-percentage').innerHTML = Number.parseFloat(data[choice]).toFixed(2);
            choiceElement.querySelector('.js-completed-bar').style.width = `${Math.round(data[choice])}%`;
          }
        },
      }
    );
  }
};

document.addEventListener('turbolinks:load', () => {
  initResultsCable();
});
