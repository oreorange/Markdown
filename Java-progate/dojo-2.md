# Java 4 復習
## 2. インスタンス作成、ゲッター呼び出し、インスタンスフィールド、コンストラクタ、ゲッターメソッド
```java:2
Main.java

class Main {
  public static void main(String[] args) {
    //インスタンスを変数に代入する。クラス型 変数名 = new クラス名()
    Bicycle bicycle = new Bicycle("ビアンキ");  //new Bicycle ←インスタンス
    System.out.println("【自転車の情報】");
    //インスタンスフィールドをprivateにしているから、ゲッターを使用して呼び出す
    System.out.println("名前：" + bicycle.getName());
  }
}


Bicycle.java

class Bicycle {
  private String name;  //インスタンスフィールド
  
  //コンストラクタ　インスタンス生成時、自動で呼び出されるメソッド
  Bicycle(String name) {  //クラス名を同じにして、戻り値は書かない
    this.name = name;
  }
  
  // Mainクラスからnameフィールドの値を取得するためにゲッターを定義
  public String getName() {  //ゲッター　戻り値をつけメソッドにget付けるのが一般的
    return this.name;
  }
}
```
## 3. インスタンスフィールド追加、出力内容をまとめる
```java:3
Main.java

class Main {
  public static void main(String[] args) {
    //インスタンスを変数に代入する。クラス型 変数名 = new クラス名()
    Bicycle bicycle = new Bicycle("ビアンキ", "緑");  //new Bicycle ←インスタンス
    System.out.println("【自転車の情報】");
    bicycle.printData();
    
  }
}


Bicycle.java

class Bicycle {
  private String name;  //インスタンスフィールド
  private String color;
  
  //コンストラクタ　インスタンス生成時、自動で呼び出されるメソッド
  Bicycle(String name, String color) {  //クラス名を同じにして、戻り値は書かない
    this.name = name;
    this.color = color;
  }
  
  // printDataメソッドで呼ぶので,ゲッターメソッド削除
  
  public void printData() {
    System.out.println("名前：" + this.name);  //メインクラスでゲッターで出力していたものを移動
    System.out.println("色：" + this.color);
  }
}
```
