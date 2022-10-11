package vo;

public class Product {
// 6product.jsp <-> Product 클래스 <-> TBL_PRODUCT 테이블

	private String pcode;		// 상품 코드
	private String category;	// 카테고리
	private String pname;		// 상품명
	private int price;			// 상품 가격
	
	public Product() {

	}
	

	public Product(String pcode, String category, String pname, int price) {
		this.pcode = pcode;
		this.category = category;
		this.pname = pname;
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "[pcode = " + pcode + ", category = " + category + ", pname = " + pname + ", price = " + price + "]\n";
	}

	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
}
