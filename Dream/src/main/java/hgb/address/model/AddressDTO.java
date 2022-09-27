package hgb.address.model;

public class AddressDTO {
	
	
	private String order_name;             // 배송받을사람 이름(배송지)
	private String mobile;                 // 배송받을사람 전화번호 (SHA-256 암호화 대상)
    private String post_code;              // 우편번호
    private String address;                // 주소 
    private String detail_address;         // 상세주소 
   
	
    
    public AddressDTO() {}
    
    
    public AddressDTO(String order_name, String mobile, String post_code, String address, String detail_address) {
    	
    	super();
		this.order_name = order_name;
		this.mobile = mobile;
		this.post_code = post_code;
		this.address = address;
		this.mobile = mobile;
		this.detail_address = detail_address;			 	
    	
    }
	
	
	
    public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
	
	
	
	
	

}



