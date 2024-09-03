let map;
let marker;
let geocoder;
let addressSet = false;  // 住所検索で位置が設定されたかどうかを示すフラグ



function initMap() {
  geocoder = new google.maps.Geocoder();

  // 投稿の緯度と経度が存在する場合はその位置を使用、存在しない場合は東京をデフォルトにする
  let initialLat = parseFloat(document.getElementById('latitude').value) || 35.6803997;
  let initialLng = parseFloat(document.getElementById('longitude').value) || 139.7690174;

  map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: initialLat, lng: initialLng },
    zoom: 18,
  });

  // マーカーの初期設定
  marker = new google.maps.Marker({
    map: map,
    draggable: true,
    position: { lat: initialLat, lng: initialLng }
  });

  // マーカーのドラッグ終了時のイベント
  google.maps.event.addListener(marker, 'dragend', function(ev) {
    document.getElementById('latitude').value = ev.latLng.lat();
    document.getElementById('longitude').value = ev.latLng.lng();
    addressSet = false; // ドラッグで位置が設定されたので、住所検索での位置設定を無効化
  });
}

// 住所から地図を更新する関数
function updateMapFromAddress(address) {
  geocoder.geocode({'address': address}, function(results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
      marker.setPosition(results[0].geometry.location);
      if (!addressSet) {  // 住所検索での位置設定が行われていない場合のみ
        document.getElementById('latitude').value = results[0].geometry.location.lat();
        document.getElementById('longitude').value = results[0].geometry.location.lng();
      }
      addressSet = true; // 住所検索で位置が設定された
    } else {
      alert('該当する結果がありませんでした：' + status);
    }
  });
}


  // 住所が変更された時にマップを更新
  $('#address').on('change', function() {
    updateMapFromAddress(this.value);
  });


// DOMの読み込みが完了したら初期化
$(document).on("turbolinks:load", function() {
  if (typeof google !== 'undefined') {
    initMap();


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

