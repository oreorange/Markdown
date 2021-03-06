## サブクエリ

クエリの中に他のクエリを入れることができる。これをサブクエリという。
サプクエリは（）で囲むことで使用できる。（）内に；は不要
サプクエリの処理が実行された後、外側のクエリが実行される。

```sql
-- 身長 > 平均身長　の選手名と身長を取得
SELECT name as "選手名", height as "身長" --取得(表示)したいカラム
FROM players
where height > (
select avg(height)
from players
)
;
```

## AS

AS を使うことでカラム名に別名を定義することができる。

## JOIN

from テーブル名
join テーブル名
on テーブル名.外部\_id = テーブル名.id(主キー)
;

GROUP BY などを含んだ実行順序、sql は取得するテーブルを形成してから検索を行うので、from,join が先に行われる
外部キーが NULL のレコードは取得しない、 left join を使えば null を含めることができる

join を複数使用して複数のテーブルを結合することも可能、その場合でも from は一度で OK

```sql
-- 出身国が日本で身長が180cm以上の選手を、join を使って取得
SELECT *
FROM players
join countries
on players.country_id = countries.id
where countries.name = "日本" and height >= 180
;
```

```sql
-- 国ごとのゴール数の平均、 join を使って選手テープルと国テーブル結合し、国名をグループ化
SELECT countries.name as "国名", avg(goals) as "平均得点"
FROM players
join countries
on players.country_id = countries.id
group by countries.name
;
```

# 道場レッスン　 sql 1〜3 復習、忘れていたコマンド

## distinct(カラム名)

```sql
select distinct(name) -- カラムの重複を省いて表示
from items;
```

## order by(カラム名) desc(降順) / asc(昇順)

```sql
select name, price
from items
order by price desc; -- 並べ替え
```

## 書き順メモ

```sql
SELECT     -- 結果
FROM JOIN  -- テーブル選択
ON         -- カラム = カラム
WHERE      -- 条件
GROUPBY
HAVING     -- グループ化後、絞り込み
ORDERBY    -- 並び替え、昇順、降順
```

# sql4 取得以外のコマンド

## 追加　更新　削除

```sql
-- 追加  studentsテーブルにnameをKaty、courseをHTMLとしたレコードを追加してください。
insert into students (name, course)
values ("Katy", "HTML");
-- 更新  studentsテーブルのidカラムの値が6のレコードのnameをJuliet、courseをRubyに更新してください。
update students
set name = "Juliet", course = "Ruby"
where id = 6;

-- 削除  studentsテーブルのidカラムの値が2のレコードを削除してください。
delete from students where id = 2;

-- 更新後のデータ照会  下記のクエリは消さないでください。
SELECT * FROM students;
```
