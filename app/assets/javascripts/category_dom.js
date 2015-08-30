$(document).ready(function() {
  var xhr = new XMLHttpRequest;
  xhr.open('get', '/categories');
  xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
  xhr.addEventListener('load', function () {
    var categories = JSON.parse(xhr.response);
    var sidemenu = document.querySelector('.sidemenu');
    categories.forEach(function (category) {
      var a = document.createElement('a');
      var p = document.createElement('div');
      a.href = '/?category='+category.id;
      a.innerHTML = category.name;
      p.appendChild(a);
      sidemenu.appendChild(p);
    })
  });
  xhr.send();
});
