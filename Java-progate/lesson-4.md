# Java lesson-4
## オブジェクト指向
- クラスとインスタンス
- インスタンスフィールド
- コンストラクタ
- クラスフィールド
- コンストラクタのオーバーロード
- カプセル化　ゲッター　セッター

```java
Main.java

class Main {
  public static void main(String[] args) {
    // 仕事を「医者」にしてください
    Person person1 = new Person("Kate", "Jones", 27, 1.6, 50.0, "医者");
    person1.printData();
    // 仕事を「教師」にしてください
    Person person2 = new Person("John", "Christopher", "Smith", 65, 1.75, 80.0, "教師");  //オーバーロード
    person2.printData();
    System.out.println("----------------------");
    // person1の仕事を「獣医」に変更してください
    person1.setJob("獣医");
    
    // 「person1の仕事を◯◯に変更しました」と出力されるようにしてください
    System.out.println("person1の仕事を" + person1.getJob() + "に変更しました");
    
    person1.printData();
  }
}
```

```java
Person.java

class Person {
  private static int count = 0;　　　// インスタンスフィールド　プライペート
  private String firstName;
  private String middleName;
  private String lastName;
  private int age;
  private double height;
  private double weight;
  // インスタンスフィールド「job」を追加してください
  private String job;
  
  // コンストラクタを書き換えてください　　// コンストラクタは newを使ってインスタンス生成時、自動で呼び出される特別なメソッド。
  Person(String firstName, String lastName, int age, double height, double weight, String job) {
    Person.count++;
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.height = height;
    this.weight = weight;
    this.job = job;
  }
  
  // コンストラクタを書き換えてください　　//オーバーロード
  Person(String firstName, String middleName, String lastName, int age, double height, double weight, String job) {
    this(firstName, lastName, age, height, weight, job);
    this.middleName = middleName;
  }

  public String getMiddleName() {
    return this.middleName;
  }
  
  // jobのゲッターを定義してください      //メソッド作成　戻り値文字列型
  public String getJob() {
    return this.job;
  } 


  public void setMiddleName(String middleName) {
    this.middleName = middleName;
  }
  
  // jobのセッターを定義してください　　　　//メソッド作成　戻り値なし
  public void setJob(String job) {
    this.job = job;
  }
  

  public String fullName() {
    if (this.middleName == null) {
      return this.firstName + " " + this.lastName;
    } else {
      return this.firstName + " " + this.middleName + " " + this.lastName;
    }
  }

  public void printData() {
    System.out.println("私の名前は" + this.fullName() + "です");
    System.out.println("年齢は" + this.age + "歳です");
    System.out.println("BMIは" + Math.round(this.bmi()) + "です");
    // 「仕事は◯◯です」と出力してください
    System.out.println("仕事は" + this.job + "です");
    
  }

  public double bmi() {
    return this.weight / this.height / this.height;
  }

  public static void printCount() {
    System.out.println("合計" + Person.count + "人です");
  }
}

```