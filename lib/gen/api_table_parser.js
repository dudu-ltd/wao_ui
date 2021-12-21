function toCamel(v) {
  var arr = []
  for (var i = 0; i < v.length; i++) {
      arr.push(v[i].toLowerCase().split("-").map(function(item, index) {
          return index == 0 ? item: (item.slice(0, 1).toUpperCase() + item.slice(1));
      }).join(''));
  }
  return arr
}

function props(tbody) {
  var arr = []
  tbody.querySelectorAll('tr td:first-child').forEach(item =>arr.push( item.innerText) )
  arr = toCamel(arr)
  console.info(arr.join('\n'))
  return arr;
}
