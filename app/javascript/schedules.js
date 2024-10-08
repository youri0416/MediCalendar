let patientCalendar; // グローバルスコープで定義

document.addEventListener('turbo:load', function() {
    var patientCalendarEl = document.getElementById('patient-calendar');
    var schedules = JSON.parse(patientCalendarEl.getAttribute('data-schedules'));

    // patientCalendarを初期化
    patientCalendar = new FullCalendar.Calendar(patientCalendarEl, {
        initialView: 'dayGridMonth',
        locale: 'ja',
        timeZone: 'Asia/Tokyo',
        events: schedules
    });

    patientCalendar.render();

    let selectedDate = null; // 選択した日付
    let selectedEvent = null; // 選択したイベントオブジェクト

    // 日付をクリックしたときの処理
    patientCalendar.on('dateClick', function(info) {
        selectedDate = info.dateStr; // クリックされた日付を保存
    
        // 患者のIDをデータ属性から取得
        var patientId = document.getElementById('patient-calendar').getAttribute('data-patient-id'); 
    
        // 選択した日付と患者IDをパラメータとしてnewアクションにリダイレクト
        window.location.href = `/patients/${patientId}/patient_schedules/new?date=${selectedDate}`;
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
});
