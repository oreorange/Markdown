# Java lesson-5
## 継承 protected 抽象クラス 多態性
```Main.java
Main.java

class Main {
  public static void main(String[] args) {
    Person person1 = new Person("Kate", "Jones", 27, 1.6, 50.0);
    Person person2 = new Person("John", "Christopher", "Smith", 65, 1.75, 80.0);

    Car car = new Car("フェラーリ", "赤");
    Bicycle bicycle = new Bicycle("ビアンキ", "緑");
    
    person1.buy(car);
    
    person2.buy(bicycle);

    System.out.println("【車の情報】");
    car.printData();
    System.out.println("-----------------");
    System.out.println("【車の所有者の情報】");
    car.getOwner().printData();

    System.out.println("=================");
    System.out.println("【自転車の情報】");
    bicycle.printData();
    System.out.println("-----------------");
    System.out.println("【自転車の所有者の情報】");
    bicycle.getOwner().printData();
  }
}
```

```Vehicle.java
Vehicle.java

abstract class Vehicle {
  private String name;
  private String color;
  protected int distance = 0;
  private Person owner;

  Vehicle(String name, String color) {
    this.name = name;
    this.color = color;
  }

  public String getName() {
    return this.name;
  }
  public String getColor() {
    return this.color;
  }
  public int getDistance() {
    return this.distance;
  }
  public Person getOwner() {
    return this.owner;
  }
  public void setName(String name) {
    this.name = name;
  }
  public void setColor(String color) {
    this.color = color;
  }
  public void setOwner(Person person) {
    this.owner = person;
  }

  public void printData() {
    System.out.println("名前：" + this.name);
    System.out.println("色：" + this.color);
    System.out.println("走行距離：" + this.distance + "km");
  }

  public abstract void run(int distance);
}
```

```Car.java
Car.java

class Car extends Vehicle {
  private int fuel = 50;

  Car(String name, String color) {
    super(name, color);
  }

  public int getFuel() {
    return this.fuel;
  }

  public void printData() {
    super.printData();
    System.out.println("ガソリン量：" + this.fuel + "L");
  }

  public void run(int distance) {
    System.out.println(distance + "km走ります");
    if (distance <= this.fuel) {
      this.distance += distance;
      this.fuel -= distance;
    } else {
      System.out.println("ガソリンが足りません");
    }
    System.out.println("走行距離：" + this.distance + "km");
    System.out.println("ガソリン量：" + this.fuel + "L");
  }

  public void charge(int litre) {
    System.out.println(litre + "L給油します");
    if (litre <= 0) {
      System.out.println("給油できません");
    } else if (litre + this.fuel >= 100) {
      System.out.println("満タンまで給油します");
      this.fuel = 100;
    } else {
      this.fuel += litre;
    }
    System.out.println("ガソリン量：" + this.fuel + "L");
  }
}
```

```Bicycle.java
Bicycle.java

class Bicycle extends Vehicle {
  Bicycle(String name, String color) {
    super(name, color);
  }

  public void run(int distance) {
    System.out.println(distance + "km走ります");
    this.distance += distance;
    System.out.println("走行距離：" + this.distance + "km");
  }
}
```

```Person.java
Person.java

class Person {
  private String firstName;
  private String middleName;
  private String lastName;
  private int age;
  private double height;
  private double weight;

  Person(String firstName, String lastName, int age, double height, double weight) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.height = height;
    this.weight = weight;
  }

  Person(String firstName, String middleName, String lastName, int age, double height, double weight) {
    this(firstName, lastName, age, height, weight);
    this.middleName = middleName;
  }
  
  public String fullName() {
    if (this.middleName == null) {
      return this.firstName + " " + this.lastName;
    } else {
      return this.firstName + " " + this.middleName + " " + this.lastName;
    }
  }

  public void printData() {
    System.out.println("名前は" + this.fullName() + "です");
    System.out.println("年齢は" + this.age + "歳です");
    System.out.println("身長は" + this.height + "mです");
    System.out.println("体重は" + this.weight + "kgです");
    System.out.println("BMIは" + Math.round(this.bmi()) + "です");
  }

  public double bmi() {
    return this.weight / this.height / this.height;
  }
  
  // 以下2つを一つのメソッドで書き換えてください
  public void buy(Vehicle vehicle) {
    vehicle.setOwner(this);
  }
  
}
```
