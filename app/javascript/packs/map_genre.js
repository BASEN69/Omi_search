// Google Maps APIの初期化
function initGenreMap() {
  // データ属性から地図の初期位置を取得
  let mapCenter = { lat: parseFloat(document.getElementById('latitude').value), lng: parseFloat(document.getElementById('longitude').value) };
  let map = new google.maps.Map(document.getElementById('map'), {
    center: mapCenter,
    zoom: 9,
    styles: [
      {
        stylers: [
          { "saturation": 0 },
          { "lightness": 0 }
        ]
      }
    ]
  });

  // JSONデータから投稿のマーカーを取得
  const postsDataElement = document.getElementById('posts-data');
  const posts = JSON.parse(postsDataElement.textContent);

  // 各投稿にマーカーを追加
  posts.forEach(function(post) {
    const markerLatLng = { lat: post.latitude, lng: post.longitude };
    const marker = new google.maps.Marker({
      position: markerLatLng,
      map: map
    });

    // マーカークリック時の情報ウィンドウ
    const infoWindow = new google.maps.InfoWindow({
      content: `
        <div style="width: 150px; height:100px;">
          <h4>${post.name}</h4>
          <p>${post.introduction.substring(0, 50)}...</p>
          <a href="/posts/${post.id}">詳細を見る</a>
        </div>
      `
    });

    // マーカークリック時のイベント
    marker.addListener('click', function() {
      infoWindow.open(map, marker);
    });
  });
}

document.addEventListener('DOMContentLoaded', initGenreMap);
