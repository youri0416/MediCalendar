function renderPatientCalendar() {
    var patientCalendarEl = document.getElementById("patient-calendar");
    if (!patientCalendarEl) return false; // 患者カレンダー要素が存在しない場合は終了

    var schedules = JSON.parse(patientCalendarEl.getAttribute('data-schedules'));

    let patientCalendar = new FullCalendar.Calendar(patientCalendarEl, {
        initialView: 'dayGridMonth',
        locale: 'ja',
        timeZone: 'Asia/Tokyo',
        events: schedules,
        headerToolbar: {              // カレンダー上部のツールバーをカスタマイズ
            right: 'today prev,next',
            left: 'title',
        },
        height: 'auto',
        contentHeight: 'auto'
        
    });

    patientCalendar.render();

    // 日付をクリックしたときの処理
    patientCalendar.on('dateClick', function(info) {
        let selectedDate = info.dateStr; 
        var patientId = patientCalendarEl.getAttribute('data-patient-id'); 
        var doctorId = patientCalendarEl.getAttribute('data-doctor-id');
        window.location.href = `/doctors/${doctorId}/patients/${patientId}/patient_schedules/new?date=${selectedDate}`;
    });

    // イベントをクリックしたときの処理
    patientCalendar.on('eventClick', function(info) {
        let selectedEvent = info.event;
        const scheduleId = selectedEvent.id;
        var patientId = patientCalendarEl.getAttribute('data-patient-id');
        var doctorId = patientCalendarEl.getAttribute('data-doctor-id');
        window.location.href = `/doctors/${doctorId}/patients/${patientId}/patient_schedules/${scheduleId}/edit`;
    });
}

function renderDoctorCalendar() {
    var doctorCalendarEl = document.getElementById("doctor-calendar");
    if (!doctorCalendarEl) return false; // 医者カレンダー要素が存在しない場合は終了

    let doctorCalendar = new FullCalendar.Calendar(doctorCalendarEl, {
        initialView: 'timeGridDay',
        locale: 'ja',
        timeZone: 'Asia/Tokyo',
        events: JSON.parse(doctorCalendarEl.getAttribute('data-schedules')), // 医者のスケジュールデータを設定
        dateClick: function(info) {
            // 新規予定登録ページ (doctor_schedules#new) へ遷移
            var patientId = doctorCalendarEl.getAttribute('data-patient-id'); // 患者IDを取得
            var from = patientId ? 'patient' : 'doctor'; // 患者IDがある場合はfrom=patient、ない場合はfrom=doctor
            var url = `/doctors/${doctorCalendarEl.getAttribute('data-doctor-id')}/doctor_schedules/new?start_at=${info.dateStr}&from=${from}`;

            // 患者ページの場合はpatient_idも追加
            if (patientId) {
                url += `&patient_id=${patientId}`;
            }
            window.location.href = url;
        }
    });

    doctorCalendar.render();
}

window.addEventListener('turbo:load', function() {
    renderPatientCalendar();
    renderDoctorCalendar();
});
window.addEventListener("turbo:render", function() {
    renderPatientCalendar(); // 患者カレンダーの再描画
    renderDoctorCalendar(); // 医者カレンダーの再描画
});