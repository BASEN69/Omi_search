
function initShowMap() {
  // マップの初期設定
  let mapCenter = { lat: parseFloat(document.getElementById('latitude').value), lng: parseFloat(document.getElementById('longitude').value) };
  let map = new google.maps.Map(document.getElementById('map'), {
    center: mapCenter,
    zoom: 17,
    styles: [
      {
        stylers: [
          { "saturation": 0 },
          { "lightness": 0 }
        ]
      }
    ]
  });

  // 現在の投稿のマーカーを表示
  new google.maps.Marker({
    position: mapCenter,
    map: map
  });
}

document.addEventListener('DOMContentLoaded', initShowMap);
