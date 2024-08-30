// 画像をクリックしてモーダルを表示するため
function openModal(image) {
  const modal = document.getElementById('imageModal');
  const modalImage = document.getElementById('modalImage');
  modal.style.display = 'block';
  modalImage.src = image.src;
}

// モーダルを閉じる動作
function closeModal() {
  const modal = document.getElementById('imageModal');
  modal.style.display = 'none';
}

// グローバルに関数を公開するため
window.openModal = openModal;
window.closeModal = closeModal;
