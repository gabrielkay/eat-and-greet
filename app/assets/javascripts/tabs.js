function switchTabs(evt, tabName) {
  // Declare all variables
  let i, tabcontent, tablinks;

  // Get all elements with class="tab__content" and hide them
  tabcontent = document.querySelectorAll('.tab__content');
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = 'none';
  }

  // Get all elements with class="tab__links" and remove the class "active"
  tablinks = document.querySelectorAll('.tab__links');
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(' active', '');
  }

  // Show the current tab, and add an "active" class to the button that opened the tab
  document.getElementById(tabName).style.display = 'block';
  evt.currentTarget.className += ' active';
}
