// turbo:loadイベントリスナーを使用
window.addEventListener('turbo:load', function() {
  const checkboxes = document.querySelectorAll('.task-checkbox');

  checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', function() {
      const taskId = this.getAttribute('data-task-id');
      const doctorId = this.getAttribute('data-doctor-id'); // doctor_idを取得
      const patientId = this.getAttribute('data-patient-id'); // patient_idを取得
      const isCompleted = this.checked;

      fetch(`/doctors/${doctorId}/patients/${patientId}/tasks/${taskId}/toggle_complete`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ completed: isCompleted })
      })
      .then(response => {
        if (!response.ok) {
          throw new Error('タスクの更新に失敗しました');
        }
        return response.json();
      })
      .then(data => {
        console.log('タスクの完了状態が更新されました', data);
      })
      .catch(error => {
        console.error('エラーが発生しました:', error);
      });
    });
  });
});

// turbo:renderイベントリスナーは通常必要ないが、特別な処理がある場合に追加可能
window.addEventListener("turbo:render", function() {
  // 必要に応じて処理を追加
});
