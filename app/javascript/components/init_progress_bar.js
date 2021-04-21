const initProgressBar = () => {
  const progressBars = document.querySelectorAll(".js-completed-bar");
  if (progressBars.length > 0) {
    progressBars.forEach((progress) => {
      progress.style.width = progress.getAttribute("data-complete") + "%";
      progress.style.opacity = 1;
    })
  }
};

export { initProgressBar };
