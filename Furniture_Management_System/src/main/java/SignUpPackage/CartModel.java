package SignUpPackage;

public class CartModel {
	String prodID;
	String prodName;
	int prodSelectedQuantity;
	String prodCategory;
	public String getProdCategory() {
		return prodCategory;
	}

	public void setProdCategory(String prodCategory) {
		this.prodCategory = prodCategory;
	}

	public int getProdSelectedQuantity() {
		return prodSelectedQuantity;
	}

	public void setProdSelectedQuantity(int prodSelectedQuantity) {
		this.prodSelectedQuantity = prodSelectedQuantity;
	}

	public String getProdID() {
		return prodID;
	}

	public void setProdID(String prodID) {
		this.prodID = prodID;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	String prodImage;
	String prodDesc;
	float prodCost;
	int prodQuantity;
	float totalProdCost;
	
	public String getProdImage() {
		return prodImage;
	}

	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}

	public String getProdDesc() {
		return prodDesc;
	}

	public void setProdDesc(String prodDesc) {
		this.prodDesc = prodDesc;
	}

	public float getProdCost() {
		return prodCost;
	}

	public void setProdCost(float prodCost) {
		this.prodCost = prodCost;
	}

	public int getProdQuantity() {
		return prodQuantity;
	}

	public void setProdQuantity(int prodQuantity) {
		this.prodQuantity = prodQuantity;
	}

	public float getTotalProdCost() {
		return totalProdCost;
	}

	public void setTotalProdCost(float totalProdCost) {
		this.totalProdCost = totalProdCost;
	}

	public CartModel(String prodID, String prodName, String prodImage, String prodDesc, float prodCost, int prodQuantity, float totalProdCost, int prodSelectedQuantity, String prodCategory) {
		this.prodID = prodID;
		this.prodName = prodName;
		this.prodImage = prodImage;
		this.prodDesc = prodDesc;
		this.prodCost = prodCost;
		this.prodQuantity = prodQuantity;
		this.totalProdCost = totalProdCost;
		this.prodSelectedQuantity = prodSelectedQuantity;
		this.prodCategory = prodCategory;
	}
}
