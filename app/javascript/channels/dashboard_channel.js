import consumer from "./consumer";

const initUserDashboardCable = () => {
  const userDashboard = document.getElementById("user-dashboard");
  if (userDashboard) {
    consumer.subscriptions.create(
      { channel: "DashboardChannel" },
      {
        connected() {
          console.log("DashboardChannel is connected! 🎉");
        },
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
