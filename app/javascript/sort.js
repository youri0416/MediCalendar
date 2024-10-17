document.addEventListener('DOMContentLoaded', function() {
  // 病棟選択のドロップダウンを表示/非表示にする関数
  function toggleWardDropdown() {
    const dropdown = document.getElementById('ward-dropdown');
    dropdown.style.display = (dropdown.style.display === 'none') ? 'block' : 'none';
  }

  // 診療科選択のドロップダウンを表示/非表示にする関数
  function toggleDepartmentDropdown() {
    const dropdown = document.getElementById('department-dropdown');
    dropdown.style.display = (dropdown.style.display === 'none') ? 'block' : 'none';
  }

  // 病棟を選択した際に、その病棟に属する患者を表示する関数
  function filterByWard(wardId) {
    const url = new URL(window.location.href);
    url.searchParams.set('ward_id', wardId); // クエリパラメータにward_idを追加
    window.location.href = url.toString();   // 新しいURLにリダイレクト
  }

  // 診療科を選択した際に、その診療科に属する患者を表示する関数
  function filterByDepartment(departmentId) {
    const url = new URL(window.location.href);
    url.searchParams.set('department_id', departmentId); // クエリパラメータにdepartment_idを追加
    window.location.href = url.toString();   // 新しいURLにリダイレクト
  }

  // ドロップダウンを非表示にする関数
  function hideDropdowns() {
    const wardDropdown = document.getElementById('ward-dropdown');
    const departmentDropdown = document.getElementById('department-dropdown');
    wardDropdown.style.display = 'none';
    departmentDropdown.style.display = 'none';
  }

  // 初期表示設定
  window.addEventListener('turbo:load', hideDropdowns);
  window.addEventListener('turbo:render', hideDropdowns);

  // 関数をグローバルにするために、ウィンドウオブジェクトに追加
  window.toggleWardDropdown = toggleWardDropdown;
  window.toggleDepartmentDropdown = toggleDepartmentDropdown;
  window.filterByWard = filterByWard;
  window.filterByDepartment = filterByDepartment;
});
