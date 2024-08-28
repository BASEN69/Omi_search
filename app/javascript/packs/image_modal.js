// 画像をクリックしてモーダルを表示
function openModal(image) {
  const modal = document.getElementById('imageModal');
  const modalImage = document.getElementById('modalImage');
  modal.style.display = 'block';
  modalImage.src = image.src;
}

// モーダルを閉じる
function closeModal() {
  const modal = document.getElementById('imageModal');
  modal.style.display = 'none';
}

// グローバルに関数を公開
window.openModal = openModal;
window.closeModal = closeModal;
