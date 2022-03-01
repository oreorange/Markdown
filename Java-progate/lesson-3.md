# Java lesson-3
## 10. クラスの定義
- クラス名の最初の文字は大文字にする。 ex) class Person {
- ファイル名はクラス名.javaとする。 ex) Person.java
- 他クラスのメソッドを呼び出すときは、クラス名.メソッド名(); とする。　ex) Person.printDate();

```
Main.java
public class Main {
  public static void main(String[] args) {
    // printDataメソッドとfullNameメソッドの呼び出しを書き換えてください
    printData(fullName("Kate", "Jones"), 27, 1.6, 50.0);
    printData(fullName("John", "Christopher", "Smith"), 65, 1.75, 80.0);
  }
  
  // 以下のメソッドすべてを、Personクラスに移動してください
  public static void printData(String name, int age, double height, double weight) {
    System.out.println("私の名前は" + name + "です");
    System.out.println("年齢は" + age + "歳です");
    System.out.println("身長は" + height + "mです");
    System.out.println("体重は" + weight + "kgです");

    double bmi = bmi(height, weight);
    System.out.println("BMIは" + bmi + "です");

    if (isHealthy(bmi)) {
      System.out.println("標準値です");
    } else {
      System.out.println("標準値の範囲外です");
    }
  }

  public static String fullName(String firstName, String lastName) {
    return firstName + " " + lastName;
  }

  public static String fullName(String firstName, String middleName, String lastName) {
    return firstName + " " + middleName + " " + lastName;
  }
  
  public static double bmi(double height, double weight) {
    return weight / height / height;
  }

  public static boolean isHealthy(double bmi) {
    return bmi >= 18.5 && bmi < 25.0;
  }
}
```

## 11. ライブラリを使ってみよう
- 外部ライブラリを読み込むには、class定義より上にimportを使って記述する。 Java.langの部分はMathクラスの場所を示している
- 「java.lang.Math」は利用頻度が高いので、importせずに自動で読み込まれるようになっている。Mathクラス以外にも「java.lang.クラス名」となる外部ライブラリは全て自動で読み込まれる

```
import java.lang.Math;　// 外部ライプラリを読み込む

Class Main {
}
``` 

## 12.13. 入力を受け取ろう
- Scanner コンソールへの入力を受け取るライブラリ　ライブラリの使い方はググる
- データ型　変数 = scanner.next();   // nextの後ろは受け取るデータ型によって変える

```
import java.util.Scanner; //外部ライブラリ読み込み

class Main {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    
    System.out.print("名前：");
    // 文字列の入力を受け取る
    String firstName = scanner.next();
    
    System.out.print("年齢：");
    // 整数の入力を受け取ってください
    int age = scanner.nextInt();
    
    System.out.print("身長(m)：");
    // 小数の入力を受け取ってください
    double height = scanner.nextDouble();
    
    Person.printData(Person.fullName(firstName, lastName), age, height, weight);
  }
}
```
