const initAlerts = () => {
  const alerts = document.querySelectorAll('[role="alert"]');

  const hideAlert = (event) => { event.currentTarget.closest('[role="alert"]').classList.add('hidden')};

  if (alerts.length > 0) {
    alerts.forEach(alert => alert.querySelector('[role="button"]').addEventListener('click', hideAlert));
  }
};

export default initAlerts;
