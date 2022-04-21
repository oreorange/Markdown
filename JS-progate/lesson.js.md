# ES2015 (ES6)

# Lesson 4

## オブジェクト : 復習 値には関数も設定できる

```javascript
const animal = {
  name: "レオ", //プロパティ: 値, プロパティ: 値
  age: 3,
  greet: () => {
    console.log("こんにちは");
  },
};
console.log(animal.name); // animalのnameプロパティの値を出力
animal.greet(); // こんにちは, animalのgreetプロパティの関数を実行
```

## クラス : オブジェクトの設計図

```javascript
class Animal {} //クラス名は大文字で始める
const animal = new Animal(); //クラスから生成したオブジェクトはインスタンスと呼ぶ
// AnimalクラスのインスタンスをAnimalインスタンスと呼ぶ
```

## コンストラクタ

```javascript
// クラスはコンストラクタを設定できる
class Animal {
  constructor() {
    // コンストラクタはインスタンスが生成された直後に実行される、インスタンスごとに毎回実行される
    this.name = "レオ"; // this.プロパティ = 値;
  }
  const animal = new Animal();
  console.log(`名前:${animal.name}`)
  // インスタンスはオブジェクトなので、インスタンス.プロパティで使用できる
  // しかし、このままではインスタンスが毎回同じ値になってしまう
}
```

## コンストラクタで、関数と同じように、引数を受け取る

```javascript
class Animal {
  // 引数に「name」と「age」を追加
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
}
const animal = new Animal("モカ", 8); // インスタンス生成時引数渡す

console.log(`名前: ${animal.name}`); // 名前:モカ
console.log(`年齢: ${animal.age}`); // 年齢:8
```

## メソッド : クラスの中で定義するもので、関数と似たようなもの

```javascript
// メソッドは、そのクラスから生成したインスタンスに対して呼び出す
// インスタンス名.メソッド名（）とすることで処理を実行
class Animal {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
  // メソッドはコンストラクタの外に記述する
  greet() {
    console.log("こんにちは");
  }
  // infoメソッドを追加してください
  info() {
    // メソッド内で「this.メソッド名()」とすることで、同じクラスの他のメソッドを使うことができる
    this.greet(); //この場合 infoメソッドだけでgreetメソッドも実行される、thisはクラス内なのでanimalの代わり?
    console.log(`名前は${this.name}です`);
    console.log(`${this.age}歳です`);
  }
}

const animal = new Animal("レオ", 3);
animal.greet(); // こんにちは
animal.info(); // animalに対してinfoメソッドを呼び出してください
```

## 継承

```javascript
class Animal {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
  greet() {
    console.log("こんにちは");
  }

  info() {
    this.greet();
    console.log(`名前は${this.name}です`);
    console.log(`${this.age}歳です`);
  }
}

// class 子クラス名　extends 親クラス名 {} で継承をすることができる
class Dog extends Animal {
  getHumanAge() {
    return this.age * 7; // getHumanAgeメソッドを追加
  }
}

const dog = new Dog("レオ", 4);
dog.info(); // 子クラスは親クラスのメソッドを使える

// 定数humanAgeを定義し、定数dogに対してgetHumanAgeメソッドを呼び出した値を代入してください
const humanAge = dog.getHumanAge();
console.log(`人間年齢で${humanAge}歳です`); // 「人間年齢で〇〇歳です」と出力
```

## オーバーライド : 子クラスのメソッドが、親クラスのメソッドを上書きすること、コンストラクタも可

```javascript
class Animal {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  greet() {
    console.log("こんにちは");
  }

  info() {
    this.greet();
    console.log(`名前は${this.name}です`);
    console.log(`${this.age}歳です`);
  }
}

class Dog extends Animal {
  constructor(name, age, breed) {
    super(name, age); // constructor も上書きできる、super(引数);
    this.breed = breed;
  }

  // 親クラスとの同名メソッド、子クラスが優先される
  info() {
    this.greet();
    console.log(`名前は${this.name}です`);
    console.log(`犬種は${this.breed}です`); // コンストラクタ、dogクラスで追加
    console.log(`${this.age}歳です`);
    const humanAge = this.getHumanAge(); // 親クラスのメソッドに追加、上書き
    console.log(`人間年齢で${humanAge}歳です`);
  }

  getHumanAge() {
    return this.age * 7;
  }
}

const dog = new Dog("レオ", 4, "チワワ"); // インスタンスはコンストラクタに引数の数合わせる?
dog.info();
```

# Lesson 3

## アロー関数

```javascript
// const introduce = function() {
const introduce = () => {
  // ES6から導入された書き方、シンプルに書ける　アロー関数と呼ぶ
  console.log("こんにちは");
  console.log("私は忍者です");
};

introduce(); // 関数の呼び出し(使い方)
```

## 引数

```javascript
const add = (number1, number2) => {
  // ()内に引数を書く、コンマで区切ると複数渡せる
  console.log(`足し算${number1 + number2}`);
};

add(5, 7);
```

## 戻り値 : return 使い方

```javascript
const half = (number) => {
  return number / 2;
};
const result = half(130); // 関数の戻り値は、定数に代入もできる
console.log(`130の半分は${result}です`);
```

```javascript
const check = (number) => {
  return number % 3 === 0; // 3の倍数かどうかを戻り値として返す　true false
  // return は関数の処理を終了させる性質がある、return の後にある処理は実行されない
};

if (check(123)) {
  // if文の条件式で、checkを呼び出す
  console.log("3の倍数です");
} else {
  console.log("3の倍数ではありません");
}
```

# Lesson 1~2

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
