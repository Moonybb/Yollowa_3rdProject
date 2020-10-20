package com.proj.yollowa.model.entity.lodgement;

import java.util.Arrays;

public class LodgementVo {

	private int lodgement_number;
	private int lodgement_userNumber;
	private String lodgement_companyName;
	private String lodgement_location;
	private String lodgement_Lat;
	private String lodgement_Lng;
	private String lodgement_category;
	private String lodgement_hashTag;
	private int lodgement_goodCount;
	private double lodgement_reviewGradeRate;
	private int lodgement_reviewCount;
	private String lodgement_img;
	private int lodgement_temp;
	private String[] hashTag;
	private int price;
	
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public LodgementVo() {
		// TODO Auto-generated constructor stub
	}

	public int getLodgement_number() {
		return lodgement_number;
	}

	public void setLodgement_number(int lodgement_number) {
		this.lodgement_number = lodgement_number;
	}

	public int getLodgement_userNumber() {
		return lodgement_userNumber;
	}

	public void setLodgement_userNumber(int lodgement_userNumber) {
		this.lodgement_userNumber = lodgement_userNumber;
	}

	public String getLodgement_companyName() {
		return lodgement_companyName;
	}

	public void setLodgement_companyName(String lodgement_companyName) {
		this.lodgement_companyName = lodgement_companyName;
	}

	public String getLodgement_location() {
		return lodgement_location;
	}

	public void setLodgement_location(String lodgement_location) {
		this.lodgement_location = lodgement_location;
	}

	public String getLodgement_Lat() {
		return lodgement_Lat;
	}

	public void setLodgement_Lat(String lodgement_Lat) {
		this.lodgement_Lat = lodgement_Lat;
	}

	public String getLodgement_Lng() {
		return lodgement_Lng;
	}

	public void setLodgement_Lng(String lodgement_Lng) {
		this.lodgement_Lng = lodgement_Lng;
	}

	public String getLodgement_category() {
		return lodgement_category;
	}

	public void setLodgement_category(String lodgement_category) {
		this.lodgement_category = lodgement_category;
	}

	public String getLodgement_hashTag() {
		return lodgement_hashTag;
	}

	public void setLodgement_hashTag(String lodgement_hashTag) {
		this.lodgement_hashTag = lodgement_hashTag;
	}

	public int getLodgement_goodCount() {
		return lodgement_goodCount;
	}

	public void setLodgement_goodCount(int lodgement_goodCount) {
		this.lodgement_goodCount = lodgement_goodCount;
	}

	public double getLodgement_reviewGradeRate() {
		return lodgement_reviewGradeRate;
	}

	public void setLodgement_reviewGradeRate(double lodgement_reviewGradeRate) {
		this.lodgement_reviewGradeRate = lodgement_reviewGradeRate;
	}

	public int getLodgement_reviewCount() {
		return lodgement_reviewCount;
	}

	public void setLodgement_reviewCount(int lodgement_reviewCount) {
		this.lodgement_reviewCount = lodgement_reviewCount;
	}

	public String getLodgement_img() {
		return lodgement_img;
	}

	public void setLodgement_img(String lodgement_img) {
		this.lodgement_img = lodgement_img;
	}

	public int getLodgement_temp() {
		return lodgement_temp;
	}

	public void setLodgement_temp(int lodgement_temp) {
		this.lodgement_temp = lodgement_temp;
	}

	public String[] getHashTag() {
		return hashTag;
	}

	public void setHashTag(String[] hashTag) {
		this.hashTag = hashTag;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Arrays.hashCode(hashTag);
		result = prime * result + ((lodgement_Lat == null) ? 0 : lodgement_Lat.hashCode());
		result = prime * result + ((lodgement_Lng == null) ? 0 : lodgement_Lng.hashCode());
		result = prime * result + ((lodgement_category == null) ? 0 : lodgement_category.hashCode());
		result = prime * result + ((lodgement_companyName == null) ? 0 : lodgement_companyName.hashCode());
		result = prime * result + lodgement_goodCount;
		result = prime * result + ((lodgement_hashTag == null) ? 0 : lodgement_hashTag.hashCode());
		result = prime * result + ((lodgement_img == null) ? 0 : lodgement_img.hashCode());
		result = prime * result + ((lodgement_location == null) ? 0 : lodgement_location.hashCode());
		result = prime * result + lodgement_number;
		result = prime * result + lodgement_reviewCount;
		long temp;
		temp = Double.doubleToLongBits(lodgement_reviewGradeRate);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + lodgement_temp;
		result = prime * result + lodgement_userNumber;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LodgementVo other = (LodgementVo) obj;
		if (!Arrays.equals(hashTag, other.hashTag))
			return false;
		if (lodgement_Lat == null) {
			if (other.lodgement_Lat != null)
				return false;
		} else if (!lodgement_Lat.equals(other.lodgement_Lat))
			return false;
		if (lodgement_Lng == null) {
			if (other.lodgement_Lng != null)
				return false;
		} else if (!lodgement_Lng.equals(other.lodgement_Lng))
			return false;
		if (lodgement_category == null) {
			if (other.lodgement_category != null)
				return false;
		} else if (!lodgement_category.equals(other.lodgement_category))
			return false;
		if (lodgement_companyName == null) {
			if (other.lodgement_companyName != null)
				return false;
		} else if (!lodgement_companyName.equals(other.lodgement_companyName))
			return false;
		if (lodgement_goodCount != other.lodgement_goodCount)
			return false;
		if (lodgement_hashTag == null) {
			if (other.lodgement_hashTag != null)
				return false;
		} else if (!lodgement_hashTag.equals(other.lodgement_hashTag))
			return false;
		if (lodgement_img == null) {
			if (other.lodgement_img != null)
				return false;
		} else if (!lodgement_img.equals(other.lodgement_img))
			return false;
		if (lodgement_location == null) {
			if (other.lodgement_location != null)
				return false;
		} else if (!lodgement_location.equals(other.lodgement_location))
			return false;
		if (lodgement_number != other.lodgement_number)
			return false;
		if (lodgement_reviewCount != other.lodgement_reviewCount)
			return false;
		if (Double.doubleToLongBits(lodgement_reviewGradeRate) != Double
				.doubleToLongBits(other.lodgement_reviewGradeRate))
			return false;
		if (lodgement_temp != other.lodgement_temp)
			return false;
		if (lodgement_userNumber != other.lodgement_userNumber)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "LodgementVo [lodgement_number=" + lodgement_number + ", lodgement_userNumber=" + lodgement_userNumber
				+ ", lodgement_companyName=" + lodgement_companyName + ", lodgement_location=" + lodgement_location
				+ ", lodgement_Lat=" + lodgement_Lat + ", lodgement_Lng=" + lodgement_Lng + ", lodgement_category="
				+ lodgement_category + ", lodgement_hashTag=" + lodgement_hashTag + ", lodgement_goodCount="
				+ lodgement_goodCount + ", lodgement_reviewGradeRate=" + lodgement_reviewGradeRate
				+ ", lodgement_reviewCount=" + lodgement_reviewCount + ", lodgement_img=" + lodgement_img
				+ ", lodgement_temp=" + lodgement_temp + ", hashTag=" + Arrays.toString(hashTag) + "]";
	}

	public LodgementVo(int lodgement_number, int lodgement_userNumber, String lodgement_companyName,
			String lodgement_location, String lodgement_Lat, String lodgement_Lng, String lodgement_category,
			String lodgement_hashTag, int lodgement_goodCount, double lodgement_reviewGradeRate,
			int lodgement_reviewCount, String lodgement_img, int lodgement_temp, String[] hashTag) {
		super();
		this.lodgement_number = lodgement_number;
		this.lodgement_userNumber = lodgement_userNumber;
		this.lodgement_companyName = lodgement_companyName;
		this.lodgement_location = lodgement_location;
		this.lodgement_Lat = lodgement_Lat;
		this.lodgement_Lng = lodgement_Lng;
		this.lodgement_category = lodgement_category;
		this.lodgement_hashTag = lodgement_hashTag;
		this.lodgement_goodCount = lodgement_goodCount;
		this.lodgement_reviewGradeRate = lodgement_reviewGradeRate;
		this.lodgement_reviewCount = lodgement_reviewCount;
		this.lodgement_img = lodgement_img;
		this.lodgement_temp = lodgement_temp;
		this.hashTag = hashTag;
	}
	
	
	
	
	
}
