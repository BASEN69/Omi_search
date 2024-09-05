

let map;
let marker;
let geocoder;
let addressSet = false;

// Google Maps APIのスクリプトがすでに存在するかをチェック
//if (!document.querySelector('script[src*="maps.googleapis.com"]')) {
//  const script = document.createElement('script');
//  script.src = `https://maps.googleapis.com/maps/api/js?key=${process.env.Maps_API_key}`;
  //script.async = true;
  //script.defer = true;
//  document.head.appendChild(script);
//}

// 地図の初期化
function initMap() {
  geocoder = new google.maps.Geocoder();
  let initialLat = parseFloat(document.getElementById('latitude').value) || 35.6803997;
  let initialLng = parseFloat(document.getElementById('longitude').value) || 139.7690174;//東京

  map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: initialLat, lng: initialLng },
    zoom: 18,
  });

  marker = new google.maps.Marker({
    map: map,
    draggable: true,
    position: { lat: initialLat, lng: initialLng }
  });

  google.maps.event.addListener(marker, 'dragend', function(ev) {
    document.getElementById('latitude').value = ev.latLng.lat();
    document.getElementById('longitude').value = ev.latLng.lng();
    addressSet = false;
  });
}

// 住所から地図を更新する関数
function updateMapFromAddress(address) {
  geocoder.geocode({'address': address}, function(results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
      marker.setPosition(results[0].geometry.location);
      if (!addressSet) {
        document.getElementById('latitude').value = results[0].geometry.location.lat();
        document.getElementById('longitude').value = results[0].geometry.location.lng();
      }
      addressSet = true;
    } else {
      alert('該当する結果がありませんでした：' + status);
    }
  });
}

// DOMの読み込みが完了したら初期化
$(document).on("DOMContentLoaded", function() {
  if (typeof google !== 'undefined' && typeof google.maps !== 'undefined') {
    initMap();

    $('#address').on('change', function() {
      updateMapFromAddress(this.value);
    });

    document.getElementById('searchButton').addEventListener('click', function() {
      const address = document.getElementById('address').value;
      if (address) {
        updateMapFromAddress(address);
      } else {
        alert('住所を入力してください');
      }
    });
  }
});

