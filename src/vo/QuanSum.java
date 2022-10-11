package vo;

public class QuanSum {
// �ۼ��� : �̰���
	private String pcode;
	private int sum;
	
	// �⺻
	public QuanSum() {

	}
	
	// Ŀ����
	public QuanSum(String pcode, int sum) {
		this.pcode = pcode;
		this.sum = sum;
	}

	// toString
	@Override
	public String toString() {
		return "[pcode = " + pcode + ", sum = " + sum + "]\n";
	}

	// getter, setter
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
	

}
