document.addEventListener('DOMContentLoaded', function() {
  var patientCalendarEl = document.getElementById('patient-calendar');
  var patientCalendar = new FullCalendar.Calendar(patientCalendarEl, {
      initialView: 'dayGridMonth',
      locale: 'ja',
      timeZone: 'Asia/Tokyo',
      events: []
  });
  patientCalendar.render();

  let selectedDate = null; // 選択した日付
  let selectedEvent = null; // 選択したイベントオブジェクト

  // 日付をクリックしたときの処理
  patientCalendar.on('dateClick', function(info) {
      selectedDate = info.dateStr; // クリックされた日付を保存
      document.getElementById('selectedDateDisplay').innerText = '選択した日付: ' + selectedDate;
      document.getElementById('eventModal').style.display = 'block';
      document.getElementById('eventTitle').value = ''; // フィールドをクリア
      selectedEvent = null; // 選択されたイベントをクリア
  });

  // 追加ボタンのクリックイベント
  document.getElementById('addEventBtn').addEventListener('click', function() {
      var eventTitle = document.getElementById('eventTitle').value;
      if (eventTitle && selectedDate) {
          patientCalendar.addEvent({
              title: eventTitle,
              start: selectedDate,
              allDay: true
          });
          document.getElementById('eventModal').style.display = 'none';
      }
  });

  // 削除ボタンのクリックイベント
  document.getElementById('deleteEventBtn').addEventListener('click', function() {
      if (selectedEvent) {
          selectedEvent.remove(); // 選択されたイベントを削除
          document.getElementById('eventModal').style.display = 'none';
      }
  });

  // 予定を選択した場合
  patientCalendar.on('eventClick', function(info) {
      selectedEvent = info.event; // クリックしたイベントを選択
      document.getElementById('eventTitle').value = selectedEvent.title; // タイトルを設定
      document.getElementById('selectedDateDisplay').innerText = '選択した日付: ' + selectedEvent.start.toISOString().split('T')[0]; // 日付を表示
      document.getElementById('eventModal').style.display = 'block'; // モーダルを表示
  });

  // 閉じるボタンのクリックイベント
  document.getElementById('closeModalBtn').addEventListener('click', function() {
      document.getElementById('eventModal').style.display = 'none';
  });
});

  // 医者用カレンダーの設定
  var doctorCalendarEl = document.getElementById('doctor-calendar'); // 医者カレンダーの要素を取得
  var doctorCalendar = new FullCalendar.Calendar(doctorCalendarEl, {
    initialView: 'timeGridDay', // 1日表示で時間表示
    locale: 'ja', // カレンダーの言語設定（日本語）
    timeZone: 'Asia/Tokyo', // タイムゾーン設定（日本時間）
    events: [
      {
        title: '診察',
        start: '2024-10-07T09:00:00',
        end: '2024-10-07T12:00:00'
      },
      {
        title: '手術',
        start: '2024-10-10T14:00:00',
        end: '2024-10-10T16:00:00'
      }
    ]
  });
  doctorCalendar.render(); // 医者カレンダーを描画
