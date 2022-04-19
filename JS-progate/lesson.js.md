# ES2015 (ES6)

## 変数 定数

```javascript
let name = "john"; // let で変数を宣言
const language = "フランス語"; // const で定数を宣言
```

## テンプレートリテラル : 連結方法 ｀＄{hoge}｀

```javascript
const name = "にんじゃわんこ";
let age = 14;

// `${定数or変数}`  バッククォーテーションで囲み、${} で + を使わず連結できる
console.log(`ぼくの名前は${name}です`);
console.log(`今は${age}歳です`);
```

## 厳密等価演算子 : ===

```javascript
const number = 12;
console.log(number == 12); //true
console.log(number == "12"); //true

console.log(number === 12); // true 厳密に等しいので
console.log(number === "12"); // false 文字列と数値の比較で厳密には異なるので
```

## switch 文 : case break default

```javascript
const n = 4;

switch (n) {
  case 1:
    console.log("大吉です");
    break;
  case 2:
    console.log("吉です");
    break;
  case 3:
    console.log("小吉です");
    break;
  // どのcaseにも合致しなかったときの処理 default
  default:
    console.log("凶です");
    break;
}
```

## オブジェクト : {プロパティ 1: 値 1, プロパティ 2: 値 2}

```javascript
// プロパティと値を：でつなぎ、コンマで区切る
const character = { name: "にんじゃわんこ", age: 14 };

console.log(character.name); // にんじゃわんこ

character.age = 20; // characterのageの値を「20」に更新

console.log(character); // { name: 'にんじゃわんこ', age: 20 }
```

## オブジェクトを要素に持つ配列 : undefined

```javascript
const characters = [
  { name: "にんじゃわんこ", age: 14 },
  { name: "ひつじ仙人", age: 100 },
  { name: "ベイビーわんこ", age: 5 },
];

for (let i = 0; i < characters.length; i++) {
  const character = characters[i]; // 定数characterを定義

  console.log("名前は" + character.name + "です"); // 名前を出力
  console.log(`年は${character.age}歳です`); // 年齢を出力 テンプレートリテラル
  // console.log(`${characters[i].age}`) でも可
  console.log(`${character.email}`); // 存在しないプロパティや番号を取得した場合、undefined が出力される
}
```

## オブジェクトの中にオブジェクト : オブジェクトの中に配列

```javascript
const cafe = {
  name: "Progateカフェ",
  businessHours: {
    // 値にオプジェクト、書き方は同じ {プロパティ1：値1, プロパティ2：値2}
    opening: "10:00(AM)",
    closing: "8:00(PM)",
  },
  // menusプロパティに配列を代入してください
  menus: ["コーヒー", "紅茶", "チョコレートケーキ"],
};

console.log(`店名: ${cafe.name}`);
// 定数.プロパティ.プロパティ で呼び出す
console.log(
  `営業時間:${cafe.businessHours.opening}から${cafe.businessHours.closing}`
);
console.log(`----------------------------`);
console.log("おすすめメニューはこちら");

// for文を用いて配列menusの中身を表示
for (let i = 0; i < cafe.menus.length; i++) {
  console.log(cafe.menus[i]);
}
```
