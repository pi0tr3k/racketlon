package pl.racketlon.model;

import javax.persistence.*;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int productId;
	@NotEmpty(message=" Nazwa produktu nie mo¿e byæ pusta")
	private String productName; // rakieta, pilka, itd.
	private String productCategory; // tenis ziemny/stolowy
	private String productDescription; // opis
	@Min(value=0, message=" Cena nie mo¿e byæ ujemna")
	private double productPrice;
	private String productCondition; // nowy,uzywany
	private String productStatus; // aktywny, ... ?
	@Min(value=0, message=" Iloœæ nie mo¿e byæ ujemna")
	private int unitInStock;
	private String productManufacturer; // firma
	@Transient
	// nie bêdziemy przechowywaæ obrazka w bazie danych tylko w katalogu resources
	private MultipartFile productImage;
	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductCondition() {
		return productCondition;
	}

	public void setProductCondition(String productCondition) {
		this.productCondition = productCondition;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public int getUnitInStock() {
		return unitInStock;
	}

	public void setUnitInStock(int unitInStock) {
		this.unitInStock = unitInStock;
	}

	public String getProductManufacturer() {
		return productManufacturer;
	}

	public void setProductManufacturer(String productManufacturer) {
		this.productManufacturer = productManufacturer;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

}
