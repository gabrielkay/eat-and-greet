import { selectAll } from '../scripts/utils';

export default class Tabs {
  constructor(el) {
    this.el = el;
    this.setVars();
    this.bindEvents();
    this.tabs[0].classList.add('active');
    this.tabGroups[0].classList.add('active');
  }

  setVars() {
    this.tabs = selectAll('.tab__links', this.el);
    this.tabGroups = selectAll('.tab__content', this.el);
  }

  bindEvents() {
    this.tabs.forEach(tab => {
      tab.addEventListener('click', this.switchTabs);
    });
  }

  switchTabs = e => {
    this.tabGroups.forEach(tabGroup => {
      tabGroup.classList.remove('active');
    });

    this.tabs.forEach(tab => {
      tab.classList.remove('active');
    });

    const target = e.target;
    const type = target.dataset.type;
    const content = document.getElementById(type);

    target.classList.add('active');
    content.classList.add('active');
  };
}
