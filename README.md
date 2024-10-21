# README

## アプリケーション名

MediCalendar

## アプリケーション概要

医者のスケジュールを多職種が把握することで、多忙な医者とのコミュニケーションを円滑にする。
タスク管理機能を利用することで、医者の業務負担を軽減する。

## URL

https://medicalendar-ueq1.onrender.com

## テスト用アカウント

・Basic 認証  
・Basic 認証パスワード

## 利用方法

### 患者のスケジュール登録

1.患者の詳細ページのカレンダーから、登録したい予定の日付をクリックする  
2.新規予定の内容（開始日時・終了日時・予定）を選択し、「登録ボタン」をクリックする  
3.予定を編集・削除する場合は、該当する予定をカレンダーから選択し、クリックする  
4.変更する場合は内容（開始日、終了日、予定）を選択し、「更新ボタン」をクリックする。予定を削除する場合は「削除ボタン」をクリックする

### 医者のスケジュール登録

1.患者の詳細ページまたは医者の詳細ページから医者のカレンダーの時間枠をクリックする  
2.新規予定の内容（開始時間・終了時間・予定）を選択し、「登録ボタン」をクリックする

### 医者へのタスク作成

1.患者の詳細ページから タスクリストの「➕ ボタン」をクリックする  
2.新規タスクリスト（タイトル・職種・名前・PHS・内容）を入力し、「作成ボタン」をクリックする  
3.作成したタスクリストを編集する場合は該当するタスクの「編集ボタン」をクリックし、内容（タイトル・職種・名前・PHS・内容）を入力し、「更新ボタン」をクリックする  
4.作成した タスクリストを削除する場合は該当するタスクの「削除ボタン」をクリックする

### 新規患者登録

1.医者の詳細ページの「新規患者登録ボタン」をクリックする  
2.患者情報(患者 ID・患者名（漢字）・患者名（フリガナ）・性別・生年月日・診療科・病棟)を入力し、「登録ボタン」をクリックする

## アプリケーションを作成した背景

病院で働いている時に、多忙な医者と連絡を取ることが難しく、それにより自分の業務が進まず、患者にも迷惑をかける場面が多かった。  
問題を解決するために、医者のスケジュールを他職種が把握でき、さらに、直接連絡を取らずとも業務が進められるアプリが必要と考えた。

## 洗い出した要件

https://docs.google.com/spreadsheets/d/1xCxYnH6A0ihKC5wDyb0qUVyyOf0ivAnZZhEvDY34mfw/edit?gid=982722306#gid=982722306

## 実装した機能についての画像や GIF およびその説明

## 実装予定の機能

医者のスケジュールの編集削除機能の実装。  
患者情報の編集削除機能の実装。  
医者一覧表示機能の実装。

## データベース設計

ER 図入れる

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

## 画面遷移図

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

患者の予定を表示することで医療者がその予定に合わせて業務を進められるようにした。  
患者一覧から病棟ごと、診療科ごとにソート機能を追加し、薬剤師だけでなく、様々な職種で使用できるようにした。  
医者のカレンダーを 1 日ごとの表示形式にし、医者の隙間時間を確認できるようにした。
