package day1.vo;

public class MyUser {
	private String name;
	private int age;
	private boolean etc;
	
	public MyUser(String name, int age, boolean etc) {
		this.name = name;
		this.age = age;
		this.etc = etc;
	}
	
	@Override
	public String toString() {
		return "MyUser [name = " + name + ", age = " + age + ", etc = " + etc + "]";
	}

	public String getName() {
		return name;
	}

	public int getAge() {
		return age;
	}

	public boolean isEtc() {
		return etc;
	}
	
	
}
