document.addEventListener('DOMContentLoaded', function () {
  const maxFileCount = 3; // 最大ファイル選択数
  const fileInput = document.querySelector('#images');

  fileInput.addEventListener('change', function () {
    if (fileInput.files.length > maxFileCount) {
      alert(`最大で ${maxFileCount} 枚までしか選択できません。`);
      // ファイルをリセットする
      fileInput.value = '';
    }
  });
});