import consumer from "./consumer";

const initUserDashboardCable = () => {
  const userDashboard = document.getElementById("user-dashboard");
  if (userDashboard) {
    const id = userDashboard.dataset.userId;

    consumer.subscriptions.create(
      { channel: "DashboardChannel", id: id },
      {
        received(data) {
          console.log(data);
        },
      }
    );
  }
};

document.addEventListener("turbolinks:load", () => {
  initUserDashboardCable();
});
