package SignUpPackage;

public class ProdModel {
	private String prodCatgeory;
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public float getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(float prodPrice) {
		this.prodPrice = prodPrice;
	}
	public int getProdRating() {
		return prodRating;
	}
	public void setProdRating(int prodRating) {
		this.prodRating = prodRating;
	}
	public String getProdImage() {
		return prodImage;
	}
	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}
	public String getProdImage2() {
		return prodImage2;
	}
	public void setProdImage2(String prodImage2) {
		this.prodImage2 = prodImage2;
	}
	public String getProdImage3() {
		return prodImage3;
	}
	public void setProdImage3(String prodImage3) {
		this.prodImage3 = prodImage3;
	}
	public int getProdQuantity() {
		return prodQuantity;
	}
	public void setProdQuantity(int prodQuantity) {
		this.prodQuantity = prodQuantity;
	}
	public String getProdDesc() {
		return prodDesc;
	}
	public void setProdDesc(String prodDesc) {
		this.prodDesc = prodDesc;
	}
	public ProdModel(String prodName, float prodPrice, int prodRating, String prodImage, String prodImage2,
			String prodImage3, int prodQuantity, String prodDesc, String prodID, String prodCatgeory) {
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodRating = prodRating;
		this.prodImage = prodImage;
		this.prodImage2 = prodImage2;
		this.prodImage3 = prodImage3;
		this.prodQuantity = prodQuantity;
		this.prodDesc = prodDesc;
		this.prodID = prodID; 
		this.prodCatgeory = prodCatgeory;
	}
	public String getProdID() {
		return prodID;
	}
	public void setProdID(String prodID) {
		this.prodID = prodID;
	}
	private String prodID;
	private String prodName;
	private float prodPrice;
	private int prodRating;
	private String prodImage;
	private String prodImage2;
	private String prodImage3;
	private int prodQuantity;
	private String prodDesc;
	public String getProdCatgeory() {
		return prodCatgeory;
	}
	public void setProdCatgeory(String prodCatgeory) {
		this.prodCatgeory = prodCatgeory;
	}

}
