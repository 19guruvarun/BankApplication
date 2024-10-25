package dto;

public class UserProfile_dto {
	private String fname,lname,email,address,gender,password;
	private long phone;
	private int age;
	public UserProfile_dto(String fname,String lname, String email, String password,long phone,int age, String gender,String address) {
	
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.password=password;
		this.address = address;
		this.gender = gender;
		this.phone = phone;
		this.age = age;
	}

	public String getfName() {
		return fname;
	}
	public void setfName(String fname) {
		this.fname = fname;
	}
	public String getlName() {
		return lname;
	}
	public void setName(String lname) {
		this.lname = lname;
	}
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
}
