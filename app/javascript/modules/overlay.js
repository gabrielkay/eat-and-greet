export default class Overlay {
  constructor(el) {
    this.el = el;
    this.setVars();
    this.bindEvents();
  }

  setVars() {
    this.buttonOpen = this.el.querySelector('.splash__sign-in-btn', this.el);
    this.overlay = this.el.querySelector('.overlay', this.el);
    this.overlayContent = this.el.querySelector('.overlay-content', this.el);
    this.buttonClose = this.el.querySelector('.overlay-close', this.el);
  }

  bindEvents() {
    this.buttonOpen.addEventListener('click', this.openOverlay);
    this.buttonClose.addEventListener('click', this.closeOverlay);
  }

  openOverlay = () => {
    this.overlay.style.height = '100%';
    this.overlayContent.display = 'block';
  };

  closeOverlay = () => {
    this.overlay.style.height = '0%';
    this.overlayContent.display = 'none';
  };
}
