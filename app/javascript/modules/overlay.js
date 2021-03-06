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
    this.body = document.querySelector('body');
  }

  bindEvents() {
    this.buttonOpen.addEventListener('click', this.openOverlay);
    this.buttonClose.addEventListener('click', this.closeOverlay);
  }

  openOverlay = () => {
    this.overlay.classList.add('open');
    this.body.style.overflow = 'hidden';
  };

  closeOverlay = () => {
    this.overlay.classList.remove('open');
    this.body.style.overflow = 'visible';
  };
}
