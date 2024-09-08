document.addEventListener('DOMContentLoaded', function () {
  const maxFileCount = 3; // 最大ファイル選択数
  const fileInput = document.querySelector('#images');

  if (fileInput) {  // 要素が存在するか確認
    fileInput.addEventListener('change', function () {
      if (fileInput.files.length > maxFileCount) {
        alert(`最大で ${maxFileCount} 枚までしか選択できません。`);
        // ファイルをリセットする
        fileInput.value = '';
      }
    });
  } else {
    console.error('Element with ID #images not found');
  }
});

