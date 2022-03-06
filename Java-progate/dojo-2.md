# Java 4 復習
## 2. インスタンス作成、ゲッター呼び出し、インスタンスフィールド、コンストラクタ、ゲッターメソッド
```java:2.java
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
```3.java
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

## 10. 道場まとめ
```Main.java
Main.java

import java.util.Scanner; //ライブラリインポート

class Main {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in); //Scanner初期化
    //インスタンスを変数に代入する。クラス型 変数名 = new クラス名()
    Bicycle bicycle = new Bicycle("ビアンキ", "緑");  //new Bicycle ←インスタンス
    System.out.println("【自転車の情報】");
    bicycle.printData();
    System.out.println("-----------------");
    System.out.print("走る距離を入力してください：");
    int bicycleDistance = scanner.nextInt();
    bicycle.run(bicycleDistance);
    
    System.out.println("=================");
    Car car = new Car("フェラーリ", "赤");
    System.out.println("【車の情報】");
    car.printData();
    System.out.println("-----------------");
    System.out.print("走る距離を入力してください：");
    int carDistance = scanner.nextInt();
    car.run(carDistance);
    
    System.out.println("-----------------");
    System.out.print("給油する量を入力してください：");
    int addFuel = scanner.nextInt();
    car.charge(addFuel);
  }
}
```

```Car.java
Car.java

class Car {
  private String name;
  private String color;
  private int distance = 0;
  private int fuel = 100;
  
  Car(String name, String color) {
    this.name = name;
    this.color = color;
  }
  
  public void printData() {
    System.out.println("名前：" + this.name);
    System.out.println("色：" + this.color);
    System.out.println("走行距離：" + this.distance + "km");
    System.out.println("ガソリン量：" + this.fuel + "L");
  }
  
  public void run(int distance) {
    System.out.println(distance + "km走ります");
    if(distance <= this.fuel) {
      this.distance += distance;
      this.fuel -= distance;
    } else {
      System.out.println("ガソリンが足りません");
    }
    System.out.println("走行距離：" + this.distance + "km");
    System.out.println("ガソリン量：" + this.fuel + "L");
  }
  public void charge(int addFuel) {
    System.out.println(addFuel + "L給油します");
    if(addFuel <= 0) {
      System.out.println("給油できません");
    } else if(addFuel + this.fuel >= 100) {
      System.out.println("満タンまで給油します");
      this.fuel = 100;
    } else {
      this.fuel += addFuel;
    }
    System.out.println("ガソリン量：" + this.fuel + "L");
  }
}
```

```Bicycle.java
Bicycle.java

class Bicycle {
  private String name;  //インスタンスフィールド
  private String color;
  private int distance = 0;
  
  //コンストラクタ　インスタンス生成時、自動で呼び出されるメソッド
  Bicycle(String name, String color) {  //クラス名を同じにして、戻り値は書かない
    this.name = name;
    this.color = color;
  }
  
  // printDataメソッドで呼ぶので,ゲッターメソッド削除
  
  public void printData() {
    System.out.println("名前：" + this.name);  //メインクラスでゲッターで出力していたものを移動
    System.out.println("色：" + this.color);
    System.out.println("走行距離：" + this.distance + "km");
  }
  
  public void run(int distance) {
    System.out.println(distance + "km走ります");
    this.distance += distance;
    System.out.println("走行距離：" + this.distance + "km");
  }
}
```