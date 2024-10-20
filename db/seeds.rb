# Clear existing data (optional)
Doctor.destroy_all
Patient.destroy_all

# Create fixed doctors and ensure creation with create!
doctors = Doctor.create!([
  { name: '山田 太郎', department_id: 2, phone_number: rand(1000..9999).to_s },
  { name: '佐藤 花子', department_id: 3, phone_number: rand(1000..9999).to_s },
  { name: '鈴木 一郎', department_id: 4, phone_number: rand(1000..9999).to_s },
  { name: '田中 次郎', department_id: 5, phone_number: rand(1000..9999).to_s },
  { name: '持田 みなみ', department_id: 6, phone_number: rand(1000..9999).to_s },
  { name: '鈴木 美穂', department_id: 7, phone_number: rand(1000..9999).to_s },
  { name: '高橋 大輔', department_id: 8, phone_number: rand(1000..9999).to_s },
  { name: '田中 由美子', department_id: 9, phone_number: rand(1000..9999).to_s },
  { name: '伊藤 翔太', department_id: 10, phone_number: rand(1000..9999).to_s },
  { name: '渡辺 奈々', department_id: 11, phone_number: rand(1000..9999).to_s },
  { name: '山本 拓也', department_id: 12, phone_number: rand(1000..9999).to_s },
  { name: '中村 真理子', department_id: 13, phone_number: rand(1000..9999).to_s },
  { name: '小林 一郎', department_id: 14, phone_number: rand(1000..9999).to_s },
  { name: '加藤 和也', department_id: 15, phone_number: rand(1000..9999).to_s },
  { name: '吉田 美香', department_id: 16, phone_number: rand(1000..9999).to_s },
  { name: '斎藤 亮', department_id: 17, phone_number: rand(1000..9999).to_s },
  { name: '松本 志穂', department_id: 18, phone_number: rand(1000..9999).to_s },
  { name: '岡田 英樹', department_id: 19, phone_number: rand(1000..9999).to_s },
  { name: '木村 友美', department_id: 20, phone_number: rand(1000..9999).to_s },
  { name: '清水 敦子', department_id: 21, phone_number: rand(1000..9999).to_s },
  { name: '内田 恭平', department_id: 22, phone_number: rand(1000..9999).to_s },
  { name: '森 亜美', department_id: 23, phone_number: rand(1000..9999).to_s },
  { name: '石井 拓', department_id: 24, phone_number: rand(1000..9999).to_s }
])
# Confirm that doctors array is correctly populated

# Create fixed patients and ensure creation with create!
patients = Patient.create!([
  { number: 1001, name: '川口 結衣', name_kana: 'カワグチ ユイ', gender_id: 3, birthday: '2014-08-12', department_id: 9, ward_id: 3, doctor_id: doctors[7].id },
  { number: 1002, name: '橋本 優斗', name_kana: 'ハシモト ユウト', gender_id: 2, birthday: '2015-03-24', department_id: 9, ward_id: 3, doctor_id: doctors[7].id },
  { number: 1003, name: '大島 翔', name_kana: 'オオシマ ショウ', gender_id: 2, birthday: '2013-11-05', department_id: 9, ward_id: 3, doctor_id: doctors[7].id },
  { number: 1004, name: '福田 咲良', name_kana: 'フクダ サクラ', gender_id: 3, birthday: '2016-06-18', department_id: 9, ward_id: 3, doctor_id: doctors[7].id },
  { number: 1005, name: '小野 陸斗', name_kana: 'オノ リクト', gender_id: 2, birthday: '2014-01-27', department_id: 9, ward_id: 3, doctor_id: doctors[7].id },
  { number: 1006, name: '原田 光', name_kana: 'ハラダ ヒカル', gender_id: 2, birthday: '1985-09-10', department_id: 2, ward_id: 4, doctor_id: doctors[0].id },
  { number: 1007, name: '石川 美奈子', name_kana: 'イシカワ ミナコ', gender_id: 3, birthday: '1990-12-04', department_id: 3, ward_id: 15, doctor_id: doctors[1].id },
  { number: 1008, name: '藤本 隆二', name_kana: 'フジモト リュウジ', gender_id: 2, birthday: '1982-05-16', department_id: 4, ward_id: 10, doctor_id: doctors[2].id },
  { number: 1009, name: '青木 真由美', name_kana: 'アオキ マユミ', gender_id: 3, birthday: '1988-02-21', department_id: 5, ward_id: 13, doctor_id: doctors[3].id },
  { number: 1010, name: '上田 拓海', name_kana: 'ウエダ タクミ', gender_id: 2, birthday: '1993-07-09', department_id: 6, ward_id: 18, doctor_id: doctors[4].id },
  { number: 1011, name: '宮本 彩香', name_kana: 'ミヤモト アヤカ', gender_id: 3, birthday: '1986-04-14', department_id: 7, ward_id: 6, doctor_id: doctors[5].id },
  { number: 1012, name: '竹内 祐介', name_kana: 'タケウチ ユウスケ', gender_id: 2, birthday: '1981-10-29', department_id: 8, ward_id: 9, doctor_id: doctors[6].id },
  { number: 1013, name: '忍野 あい', name_kana: 'オシノ アイ', gender_id: 3, birthday: '2020-03-03', department_id: 9, ward_id: 3, doctor_id: doctors[7].id },
  { number: 1014, name: '北村 翔太', name_kana: 'キタムラ ショウタ', gender_id: 2, birthday: '1984-01-19', department_id: 10, ward_id: 2, doctor_id: doctors[8].id },
  { number: 1015, name: '谷口 亜希子', name_kana: 'タニグチ アキコ', gender_id: 3, birthday: '1991-06-23', department_id: 11, ward_id: 5, doctor_id: doctors[9].id },
  { number: 1016, name: '前田 亮介', name_kana: 'マエダ リョウスケ', gender_id: 2, birthday: '1987-08-15', department_id: 12, ward_id: 8, doctor_id: doctors[10].id },
  { number: 1017, name: '黒田 奈々', name_kana: 'クロダ ナナ', gender_id: 3, birthday: '1995-11-01', department_id: 13, ward_id: 4, doctor_id: doctors[11].id },
  { number: 1018, name: '西村 幸子', name_kana: 'ニシムラ サチコ', gender_id: 3, birthday: '1983-05-08', department_id: 14, ward_id: 19, doctor_id: doctors[12].id },
  { number: 1019, name: '田辺 悠斗', name_kana: 'タナベ ユウト', gender_id: 2, birthday: '1990-09-30', department_id: 15, ward_id: 7, doctor_id: doctors[13].id },
  { number: 1020, name: '南 圭介', name_kana: 'ミナミ ケイスケ', gender_id: 2, birthday: '1989-07-17', department_id: 16, ward_id: 17, doctor_id: doctors[14].id },
  { number: 1021, name: '長谷川 理恵', name_kana: 'ハセガワ リエ', gender_id: 3, birthday: '1994-12-28', department_id: 17, ward_id: 17, doctor_id: doctors[15].id },
  { number: 1022, name: '中川 俊介', name_kana: 'ナカガワ シュンスケ', gender_id: 2, birthday: '1986-11-10', department_id: 18, ward_id: 16, doctor_id: doctors[16].id },
  { number: 1023, name: '小泉 美紀', name_kana: 'コイズミ ミキ', gender_id: 3, birthday: '1991-03-22', department_id: 19, ward_id: 5, doctor_id: doctors[17].id },
  { number: 1024, name: '木下 大輔', name_kana: 'キノシタ ダイスケ', gender_id: 2, birthday: '1985-04-03', department_id: 20, ward_id: 11, doctor_id: doctors[18].id },
  { number: 1025, name: '岩崎 真琴', name_kana: 'イワサキ マコト', gender_id: 3, birthday: '1993-10-18', department_id: 21, ward_id: 12, doctor_id: doctors[19].id },
  { number: 1026, name: '佐々木 一郎', name_kana: 'ササキ イチロウ', gender_id: 2, birthday: '1946-02-08', department_id: 22, ward_id: 17, doctor_id: doctors[20].id },
  { number: 1027, name: '藤田 久美子', name_kana: 'フジタ クミコ', gender_id: 3, birthday: '1950-09-25', department_id: 23, ward_id: 2, doctor_id: doctors[21].id },
  { number: 1028, name: '大西 進', name_kana: 'オオニシ ススム', gender_id: 2, birthday: '1942-01-14', department_id: 2, ward_id: 4, doctor_id: doctors[0].id },
  { number: 1029, name: '中井 和子', name_kana: 'ナカイ カズコ', gender_id: 3, birthday: '1948-05-19', department_id: 21, ward_id: 12, doctor_id: doctors[19].id },
  { number: 1030, name: '三浦 敬一', name_kana: 'ミウラ ケイイチ', gender_id: 2, birthday: '1945-06-30', department_id: 14, ward_id: 14, doctor_id: doctors[12].id },
])
  # Confirm that patients were created
