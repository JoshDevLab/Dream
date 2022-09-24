package kim.product.model;

import java.util.ArrayList;

public class ProductVO {

	private int product_num;        // 제품번호   
	private String register_date;   // 등록일자           
	private String product_name;    // 제품명       
	private String product_image;   // 제품 이미지 ,로 구분         
	private String category;        // 카테고리    
	private String detail_category; // 소카테고리  , 로 구분      
	private int price;           	// 가격


	private String gender;          // "없음" "남" "여"    
	private String product_size;    // , 로 구분          
	private int sale;            	// 0 : 판매중/ 1: 품절
	private int product_cnt;   	// 제품 수량  
	private int discount_rate;
	
	
	// 게러세러 
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDetail_category() {
		return detail_category;
	}
	public void setDetail_category(String detail_category) {
		this.detail_category = detail_category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public int getProduct_cnt() {
		return product_cnt;
	}
	public void setProduct_cnt(int product_cnt) {
		this.product_cnt = product_cnt;
	}
	
	public int getDiscount_rate() {
		return discount_rate;
	}
	public void setDiscount_rate(int discount_rate) {
		this.discount_rate = discount_rate;
	}


	// 게러세러 끝
	
	
	// , 로 들어간 녀석들 배열로 변환
	
	 public String[] getProduct_image_array	() {

        String[] arr = product_image.split(",");
        System.out.println(arr);
       return arr;
	 }
	 
	 
	 public String[] getProduct_size_array	() {

	        String[] arr = product_size.split(",");
	        System.out.println(arr);
	        return arr;
	 }
	
	 
	
	




}
