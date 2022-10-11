package vo;

import java.sql.Date;

public class MoneySum {
// �ۼ��� : �̰���	
	private Date buy_date;
	private int sum;
	
	// �⺻
	public MoneySum() {
		
	}
	
	// Ŀ����
	public MoneySum(Date buy_date, int sum) {
		this.buy_date = buy_date;
		this.sum = sum;
	}
	
	// toString
	@Override
	public String toString() {
		return "[buy_date = " + buy_date + ", sum = " + sum + "]\n";
	}

	// getter, setter
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
	
	

}
