# README

## テーブル設計

### Patients テーブル

#### 患者の基本情報を管理します。

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| number        | integer    | null: false                   |
| name          | string     | null: false                   |
| gender_id     | integer    | null: false                   |
| birthday      | date       | null: false                   |
| department_id | integer    | null: false                   |
| ward_id       | integer    | null: false                   |
| doctor        | references | null:false, foreign_key: true |

#### Association

- has_many :patient_schedules
- belongs_to :doctor

### PatientSchedules テーブル

#### 患者の予定を管理します。

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| start_at        | datetime   | null: false                   |
| end_at          | datetime   | null: false                   |
| patient_type_id | integer    | null: false                   |
| patient         | references | null:false, foreign_key: true |

#### Association

- belongs_to :patient

### Doctors テーブル

#### 医師の基本情報を管理します。

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| department_id | integer | null: false |
| phone_number  | integer | null: false |

#### Association

- has_many :patients
- has_many :doctor_schedules
- has_many :tasks

### DoctorSchedules テーブル

##### 医師の予定を管理します。

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| start_at       | datetime   | null: false                   |
| end_at         | datetime   | null: false                   |
| doctor_type_id | integer    | null: false                   |
| doctor         | references | null:false, foreign_key: true |

#### Association

- belongs_to :doctor

### Tasks テーブル

#### 医師のタスクや ToDo リストを管理します。

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| completed     | boolean    | null: false, default: false   |
| title_id      | integer    | null: false                   |
| occupation_id | integer    | null: false                   |
| name          | string     | null: false                   |
| phone_number  | string     | null: false                   |
| content       | text       | null: false                   |
| doctor        | references | null:false, foreign_key: true |

#### Association

- belongs_to :doctor
