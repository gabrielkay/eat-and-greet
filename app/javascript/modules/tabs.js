import { selectAll } from '../scripts/utils';

export default class Tabs {
  constructor(el) {
    this.el = el;
    this.setVars();
    this.bindEvents();
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
      tabGroup.style.display = 'none';
    });

    this.tabs.forEach(tab => {
      tab.className = tab.className.replace(' active', '');
    });

    const target = e.target;
    const type = target.dataset.type;
    const content = document.getElementById(type);

    content.style.display = 'block';
    target.className += ' active';
  };
}
