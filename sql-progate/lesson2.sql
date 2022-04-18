SELECT distinct(name) -- distinct 重複するデータを除いて取得
FROM purchase

SELECT name, price, price * 1.08 -- 消費税を計算する
FROM purchases;

select sum(カラム名), -- 合計
select avg(),        -- 平均
select count(),      -- 数を計算, 数を数える
select max(),        -- 最大　min(), 最小
select distinct(),   -- 重複を無くす

SELECT sum(price), purchased_at
FROM purchases
group by purchased_at; -- group by グループ化する select で集計関数を使用しないと取得できない
-- 複数指定も可

SELECT sum(price), purchased_at, character_name
FROM purchases
WHERE category = "食費"
GROUP BY purchased_at, character_name; -- group by の前に where で条件をつけることも可
having sum(price) > 2000; -- having でグループ化済みのデータを更に絞り込むことができる、2000円以上など
