# README

## アプリケーション名

MediCalendar

## アプリケーション概要

病院内のスタッフが医者のスケジュールを把握することで、多忙な医者とのコミュニケーションを円滑にする。
医者のタスク管理機能を利用することで、業務負担を軽減する。  

## アプリケーションを作成した背景

病院で働いている時に、多忙な医者と連絡を取ることが難しい場面が多数あった。それにより自分の業務が進まず、患者にも迷惑をかけてしまっていた。  
この問題を解決するために、医者のスケジュールを院内スタッフが把握し、さらに、直接連絡を取らずとも双方の業務が円滑に進められるアプリが必要と考えた。

## URL

https://medicalendar-ueq1.onrender.com

## テスト用アカウント

・Basic 認証  medical  
・Basic 認証パスワード 1234  

## 利用方法

### 患者のスケジュール登録

1.患者の詳細ページのカレンダーから、登録したい予定の日付をクリックする  
2.新規予定の内容（開始日時・終了日時・予定）を選択し、「登録ボタン」をクリックする  
3.予定を編集・削除する場合は、該当の予定をカレンダーから選択し、クリックする  
4.変更する場合は内容（開始日、終了日、予定）を選択し、「更新ボタン」をクリックする。予定を削除する場合は「削除ボタン」をクリックする

### 医者のスケジュール登録

1.患者の詳細ページまたは医者の詳細ページから医者のカレンダーの時間枠をクリックする  
2.新規予定の内容（開始時間・終了時間・予定）を選択し、「登録ボタン」をクリックする

### 医者へのタスク作成

1.患者の詳細ページから 主治医のタスクの「➕ ボタン」をクリックする  
2.新規タスクリスト（タイトル・職種・名前・PHS・内容）を入力し、「作成ボタン」をクリックする  
3.作成したタスクリストを編集する場合は該当するタスクの「編集ボタン」をクリックし、内容（タイトル・職種・名前・PHS・内容）を入力し、「更新ボタン」をクリックする  
4.作成した タスクリストを削除する場合は該当するタスクの「削除ボタン」をクリックする

### 新規患者登録

1.医者の詳細ページの「新規患者登録ボタン」をクリックする  
2.患者情報(患者 ID・患者名（漢字）・患者名（フリガナ）・性別・生年月日・診療科・病棟)を入力し、「登録ボタン」をクリックする

## 洗い出した要件
https://docs.google.com/spreadsheets/d/1I5dQnzKtamS3PA6nRPgHxtIlqldaXMr1wwrfNqJT0ro/edit?usp=sharing
## 実装した機能についての画像や GIF およびその説明
### 患者一覧ページ
[![Image from Gyazo](https://i.gyazo.com/2cfa9c1adb079bcb19aca59a6db59931.gif)](https://gyazo.com/2cfa9c1adb079bcb19aca59a6db59931)

### 患者詳細ページ
[![Image from Gyazo](https://i.gyazo.com/4bf6551116fa9ee46e44d52e37bd75a2.gif)](https://gyazo.com/4bf6551116fa9ee46e44d52e37bd75a2)

### 患者予定登録ページ
[![Image from Gyazo](https://i.gyazo.com/4bd1ee539cc3333e873fd69f3316f08c.gif)](https://gyazo.com/4bd1ee539cc3333e873fd69f3316f08c)

### 医者詳細ページ
[![Image from Gyazo](https://i.gyazo.com/a875b047b2cafc31e047be55f41c01f4.gif)](https://gyazo.com/a875b047b2cafc31e047be55f41c01f4)

## 実装予定の機能

・医者のスケジュールの編集削除機能の実装。  
・患者情報の編集削除機能の実装。  
・医者一覧表示機能の実装。

## データベース設計
![MediCalendar](https://github.com/user-attachments/assets/4fda1aa4-aacc-44c2-9c0c-3ed3a185fbc2)

## テーブル設計

### Patients テーブル

#### 患者の基本情報を管理します。

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| number        | integer    | null: false                   |
| name          | string     | null: false                   |
| name_kana     | string     | null: false                   |
| gender_id     | integer    | null: false                   |
| birthday      | date       | null: false                   |
| department_id | integer    | null: false                   |
| ward_id       | integer    | null: false                   |
| doctor        | references | null:false, foreign_key: true |

#### Association

- has_many :patient_schedules
- has_many :tasks
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

#### 医者の基本情報を管理します。

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

##### 医者の予定を管理します。

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| start_at       | datetime   | null: false                   |
| end_at         | datetime   | null: false                   |
| doctor_type_id | integer    | null: false                   |
| doctor         | references | null:false, foreign_key: true |

#### Association

- belongs_to :doctor

### Tasks テーブル

#### 医師のタスクを管理します。

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
- belongs_to :patient

## 画面遷移図
![image](https://github.com/user-attachments/assets/a9611dbf-30b6-489f-b32c-14c285141ebc)

## 開発環境

・フロントエンド  
HTML/CSS,JavaScript  
・バックエンド  
Rails7

## ローカルでの動作方法

以下のコマンドを順に実行  
% git clone https://github.com/youri0416/MediCalendar  
% cd MediCalendar  
% bundle install  
% rails db:create  
% rails db:migrate  
% rails db:seed

## 工夫したポイント

・患者の予定を表示することで院内スタッフがその予定に合わせて業務を進められるようにした。  
・患者一覧から病棟ごと、診療科ごとのソート機能を追加し、薬剤師だけでなく、様々な職種で使用できるようにした。  
・医者のカレンダーを 1 日ごとの表示形式にし、医者の隙間時間を確認できるようにした。
