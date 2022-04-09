-- SQLは大文字と小文字を区別しない、クエリ(命令)の最後に ; を打つ

-- 「FROM purchases」のあとにコードを追加し、purchased_atカラムが「2017-08-01以前」のデータを取得してください

SELECT * --全てのカラム参照　selectで取得するカラムを指定
FROM purchases --fromでテーブルを指定
where purchased_at <= "2017-08-01"; --whereで比較演算子を使いレコードを指定

-- nameカラムが「プリン」を含むデータを取得してください

SELECT * -- select name, price のように複数のカラムを指定することも可
FROM purchases
where name like "%プリン%"; -- ワイルドカード「%」と like 演算子を使い完全一致や部分一致検索をすることができる

-- NOT演算子を用いてcharacter_nameカラムが「にんじゃわんこ」でないデータを取得してください

SELECT *
FROM purchases
where not character_name = "にんじゃわんこ"; not -- 演算子で条件を満たさないモノを取得

-- priceカラムがNULLであるデータを取得してください

SELECT *
FROM purchases
where price is null; -- =などは使わない、　is null, is not null でnullを取得または除外できる

-- categoryカラムが「食費」かつcharacter_nameカラムが「ひつじ仙人」であるデータを取得してください

SELECT *
FROM purchases
where category = "食費" -- and character_name = "ひつじ仙人"; のように1行で記述でも可
and character_name = "ひつじ仙人"; -- and で両者を満たす条件を取得、or でどちらか一方でも満たすモノを取得 

-- priceカラムを基準に「降順に並び替えた」データを、最大で「5件」取得してください

SELECT *
FROM purchases
order by price desc limit 5; -- order by で並び替える　descは降順、ascは昇順。 limit 数字で取得したい数を指定できる
