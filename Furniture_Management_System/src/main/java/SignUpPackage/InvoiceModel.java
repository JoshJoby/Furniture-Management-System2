	package SignUpPackage;

public class InvoiceModel {
	String email;
	String name;
	String address;
	String country;
	String prodID;
	public InvoiceModel(String transactionID,String email, String prodID, String name, String address, String country,
			String dateOfPurchase, String prodName, float prodCost, String prodCategory, int prodQuantity,
			float prodTotalCost) {
		this.email = email; 
		this.prodID = prodID;
		this.name = name;
		this.address = address;
		this.country = country;
		this.transactionID = transactionID;
		this.dateOfPurchase = dateOfPurchase;
		this.prodName = prodName;
		this.prodCost = prodCost;
		this.prodCategory = prodCategory;
		this.prodQuantity = prodQuantity;
		this.prodTotalCost = prodTotalCost;
	}
	public String getProdID() {
		return prodID;
	}
	public void setProdID(String prodID) {
		this.prodID = prodID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getTransactionID() {
		return transactionID;
	}
	public void setTransactionID(String transactionID) {
		this.transactionID = transactionID;
	}
	public String getDateOfPurchase() {
		return dateOfPurchase;
	}
	public void setDateOfPurchase(String dateOfPurchase) {
		this.dateOfPurchase = dateOfPurchase;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public float getProdCost() {
		return prodCost;
	}
	public void setProdCost(float prodCost) {
		this.prodCost = prodCost;
	}
	public String getProdCategory() {
		return prodCategory;
	}
	public void setProdCategory(String prodCategory) {
		this.prodCategory = prodCategory;
	}
	public int getProdQuantity() {
		return prodQuantity;
	}
	public void setProdQuantity(int prodQuantity) {
		this.prodQuantity = prodQuantity;
	}
	public float getProdTotalCost() {
		return prodTotalCost;
	}
	public void setProdTotalCost(float prodTotalCost) {
		this.prodTotalCost = prodTotalCost;
	}
	String transactionID;
	String dateOfPurchase;
	String prodName;
	float prodCost;
	String prodCategory;
	int prodQuantity;
	float prodTotalCost;	
}
