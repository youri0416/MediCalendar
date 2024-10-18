# Clear existing data (optional)
Doctor.destroy_all
Patient.destroy_all

# Create fixed doctors and ensure creation with create!
doctors = Doctor.create!([
  { name: '山田 太郎', department_id: 3, phone_number: 1234 },
  { name: '佐藤 花子', department_id: 6, phone_number: 2345 },
  { name: '鈴木 一郎', department_id: 10, phone_number: 3456 },
  { name: '田中 次郎', department_id: 2, phone_number: 4567 },
  { name: '持田 みなみ ', department_id: 7, phone_number: 5555 }
])

# Confirm that doctors array is correctly populated

# Create fixed patients and ensure creation with create!
patients = Patient.create!([
  { number: 1001, name: '高橋 健', name_kana: 'タカハシ ケン', gender_id: 2, birthday: '1985-05-15', department_id: 3, ward_id: 4, doctor_id: doctors[0].id },
  { number: 1002, name: '田村 美咲', name_kana: 'タムラ ミサキ', gender_id: 3, birthday: '1990-08-20', department_id: 6, ward_id: 9, doctor_id: doctors[1].id },
  { number: 1003, name: '山本 修', name_kana: 'ヤマモト オサム', gender_id: 2, birthday: '1978-12-30', department_id: 10, ward_id: 5, doctor_id: doctors[2].id },
  { number: 1004, name: '中村 あかり', name_kana: 'ナカムラ アカリ', gender_id: 3, birthday: '2000-03-10', department_id: 2, ward_id: 8, doctor_id: doctors[3].id },
  { number: 1005, name: '小池 百合子', name_kana: 'コイケ ユリコ', gender_id: 3, birthday: '1952-07-15', department_id: 7, ward_id: 11, doctor_id: doctors[4].id }
])

# Confirm that patients were created
