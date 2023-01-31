package SignUpPackage;

public class InvoiceViewModel {
	String orderID;
	String orderDate;
	String numOfItems;
	String totalAmt;
	public String getOrderID() {
		return orderID;
	}
	public InvoiceViewModel(String orderID, String orderDate, String numOfItems, String totalAmt) {
		this.orderID = orderID;
		this.orderDate = orderDate;
		this.numOfItems = numOfItems;
		this.totalAmt = totalAmt;
	}
	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getNumOfItems() {
		return numOfItems;
	}
	public void setNumOfItems(String numOfItems) {
		this.numOfItems = numOfItems;
	}
	public String getTotalAmt() {
		return totalAmt;
	}
	public void setTotalAmt(String totalAmt) {
		this.totalAmt = totalAmt;
	}
}
