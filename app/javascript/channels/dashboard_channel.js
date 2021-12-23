import consumer from "./consumer";

const initUserDashboardCable = () => {
  const userDashboard = document.getElementById("user-dashboard");
  if (userDashboard) {
    const id = userDashboard.dataset.userId;

    consumer.subscriptions.create(
      { channel: "DashboardChannel", id: id },
      {
        received(data) {
          const surveyElement = document.getElementById(Object.keys(data)[0]);
          surveyElement.querySelector('.vote-count').innerText = Object.values(data)[0];
        },
      }
    );
  }
};

document.addEventListener("turbolinks:load", () => {
  initUserDashboardCable();
});
