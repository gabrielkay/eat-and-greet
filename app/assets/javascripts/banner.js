console.log('banner script loaded');

function hideNotice() {
  console.log('notice hidden');
  let notice = document.getElementById('notice');
  console.log(notice);
  notice.style.display = 'none';
}

function hideAlert() {
  console.log('alert hidden');
  let alert = document.getElementById('alert');
  alert.style.display = 'none';
}
