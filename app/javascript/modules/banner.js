export default class Banner {
  constructor(el) {
    this.el = el;
    this.setVars();
    this.bindEvents();

    setTimeout(this.hideBanner, 15000);
  }

  setVars() {
    this.button = this.el.querySelector('.banner__close', this.el);
  }

  bindEvents() {
    this.button.addEventListener('click', this.hideBanner);
  }

  hideBanner = () => {
    this.el.style.opacity = '0';
  };
}
