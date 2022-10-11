package vo;

import java.sql.Date;

public class Buy {
// �ۼ��� : �̰���
	private int buy_seq;
	private String custom_id;
	private String pcode;
	private int quantity;
	private Date buy_date;
	
	// �⺻
	public Buy() {

	}
	
	// 롬복 : 생성자는 기본, 모든 필드를 초기화하는 커스텀 생성자와 그 외 필요한 조합은 또 생성자를 만들지 않고 Builder 패턴을 활용한다.	
	public Buy(String custom_id, String pcode, int quantity) {
		this.custom_id = custom_id;
		this.pcode = pcode;
		this.quantity = quantity;
	}
	
	// Ŀ����
	public Buy(int buy_seq, String custom_id, String pcode, int quantity, Date buy_date) {
		this.buy_seq = buy_seq;
		this.custom_id = custom_id;
		this.pcode = pcode;
		this.quantity = quantity;
		this.buy_date = buy_date;
	}
	
	// toString
	@Override
	public String toString() {
		return "[buy_seq = " + buy_seq + ", custom_id = " + custom_id + ", pcode = " + pcode + ", quantity = " + quantity
				+ ", buy_date = " + buy_date + "]\n";
	}

	// getter, setter
	public int getBuy_seq() {
		return buy_seq;
	}

	public void setBuy_seq(int buy_seq) {
		this.buy_seq = buy_seq;
	}

	public String getCustom_id() {
		return custom_id;
	}

	public void setCustom_id(String custom_id) {
		this.custom_id = custom_id;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	
	
	
	
	

}
