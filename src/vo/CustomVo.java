package vo;

import java.sql.Date;


public class CustomVo {
	private String custom_id;
	private String name;
	private String email;
	private int age;
	private Date reg_date;
	
	public CustomVo() {

	}
	
	public CustomVo(String custom_id, String name, String email, int age, Date reg_date) {
		this.custom_id = custom_id;
		this.name = name;
		this.email = email;
		this.age = age;
		this.reg_date = reg_date;
	}


	@Override
	public String toString() {
		return "[custom_id = " + custom_id + ", name = " + name + ", email = " + email + ", age = " + age
				+ ", reg_date = " + reg_date + "]\n";
	}
	
	// getter, setter
	public String getCustom_id() {
		return custom_id;
	}
	
	public void setCustom_id(String custom_id) {
		this.custom_id = custom_id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public Date getReg_date() {
		return reg_date;
	}
	
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}