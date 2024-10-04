document.addEventListener('DOMContentLoaded', function() {
  // 患者用カレンダーの設定
  var patientCalendarEl = document.getElementById('patient-calendar'); // 患者カレンダーの要素を取得
  var patientCalendar = new FullCalendar.Calendar(patientCalendarEl, {
    initialView: 'dayGridMonth', // 月表示
    locale: 'ja', // カレンダーの言語設定（日本語）
    timeZone: 'Asia/Tokyo', // タイムゾーン設定（日本時間）
    events: [
      {
        title: '患者の予定1',
        start: '2024-10-07'
      },
      {
        title: '患者の予定2',
        start: '2024-10-10'
      }
    ]
  });
  patientCalendar.render(); // 患者カレンダーを描画

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
});
