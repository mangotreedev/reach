const initModal = () => {
  const modalBtns = document.querySelectorAll("[data-open]");

  if (modalBtns.length > 0) {
    modalBtns.forEach((btn) => {
      btn.addEventListener('click', () => {
        const modalId = btn.dataset.open;
        document.getElementById(modalId).classList.add('is-visible');
      })
    })
  }
}

export default initModal;
