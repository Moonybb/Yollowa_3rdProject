package com.proj.yollowa.model.entity.mypage;

import java.sql.Date;

public class LodgementReviewVo {
	
	private int review_reviewNumber;
	private int review_articleNumber;
	private String review_title;
	private int review_userNumber;
	private int review_resevNumber;
	private int review_category;
	private int review_starPoint;
	private Date review_writedDate;
	private String review_content;
	private String review_writer;
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
		
	public LodgementReviewVo() {
	}

	public int getReview_reviewNumber() {
		return review_reviewNumber;
	}

	public void setReview_reviewNumber(int review_reviewNumber) {
		this.review_reviewNumber = review_reviewNumber;
	}

	public int getReview_articleNumber() {
		return review_articleNumber;
	}

	public void setReview_articleNumber(int review_articleNumber) {
		this.review_articleNumber = review_articleNumber;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public int getReview_userNumber() {
		return review_userNumber;
	}

	public void setReview_userNumber(int review_userNumber) {
		this.review_userNumber = review_userNumber;
	}

	public int getReview_resevNumber() {
		return review_resevNumber;
	}

	public void setReview_resevNumber(int review_resevNumber) {
		this.review_resevNumber = review_resevNumber;
	}

	public int getReview_category() {
		return review_category;
	}

	public void setReview_category(int review_category) {
		this.review_category = review_category;
	}

	public int getReview_starPoint() {
		return review_starPoint;
	}

	public void setReview_starPoint(int review_starPoint) {
		this.review_starPoint = review_starPoint;
	}

	public Date getReview_writedDate() {
		return review_writedDate;
	}

	public void setReview_writedDate(Date review_writedDate) {
		this.review_writedDate = review_writedDate;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
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
		result = prime * result + review_articleNumber;
		result = prime * result + review_category;
		result = prime * result + ((review_content == null) ? 0 : review_content.hashCode());
		result = prime * result + review_resevNumber;
		result = prime * result + review_reviewNumber;
		result = prime * result + review_starPoint;
		result = prime * result + ((review_title == null) ? 0 : review_title.hashCode());
		result = prime * result + review_userNumber;
		result = prime * result + ((review_writedDate == null) ? 0 : review_writedDate.hashCode());
		result = prime * result + ((review_writer == null) ? 0 : review_writer.hashCode());
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
		LodgementReviewVo other = (LodgementReviewVo) obj;
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
		if (review_articleNumber != other.review_articleNumber)
			return false;
		if (review_category != other.review_category)
			return false;
		if (review_content == null) {
			if (other.review_content != null)
				return false;
		} else if (!review_content.equals(other.review_content))
			return false;
		if (review_resevNumber != other.review_resevNumber)
			return false;
		if (review_reviewNumber != other.review_reviewNumber)
			return false;
		if (review_starPoint != other.review_starPoint)
			return false;
		if (review_title == null) {
			if (other.review_title != null)
				return false;
		} else if (!review_title.equals(other.review_title))
			return false;
		if (review_userNumber != other.review_userNumber)
			return false;
		if (review_writedDate == null) {
			if (other.review_writedDate != null)
				return false;
		} else if (!review_writedDate.equals(other.review_writedDate))
			return false;
		if (review_writer == null) {
			if (other.review_writer != null)
				return false;
		} else if (!review_writer.equals(other.review_writer))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "LodgementReviewVo [review_reviewNumber=" + review_reviewNumber + ", review_articleNumber="
				+ review_articleNumber + ", review_title=" + review_title + ", review_userNumber=" + review_userNumber
				+ ", review_resevNumber=" + review_resevNumber + ", review_category=" + review_category
				+ ", review_starPoint=" + review_starPoint + ", review_writedDate=" + review_writedDate
				+ ", review_content=" + review_content + ", review_writer=" + review_writer + ", lodgement_number="
				+ lodgement_number + ", lodgement_userNumber=" + lodgement_userNumber + ", lodgement_companyName="
				+ lodgement_companyName + ", lodgement_location=" + lodgement_location + ", lodgement_Lat="
				+ lodgement_Lat + ", lodgement_Lng=" + lodgement_Lng + ", lodgement_category=" + lodgement_category
				+ ", lodgement_hashTag=" + lodgement_hashTag + ", lodgement_goodCount=" + lodgement_goodCount
				+ ", lodgement_reviewGradeRate=" + lodgement_reviewGradeRate + ", lodgement_reviewCount="
				+ lodgement_reviewCount + ", lodgement_img=" + lodgement_img + ", lodgement_temp=" + lodgement_temp
				+ "]";
	}

	public LodgementReviewVo(int review_reviewNumber, int review_articleNumber, String review_title,
			int review_userNumber, int review_resevNumber, int review_category, int review_starPoint,
			Date review_writedDate, String review_content, String review_writer, int lodgement_number,
			int lodgement_userNumber, String lodgement_companyName, String lodgement_location, String lodgement_Lat,
			String lodgement_Lng, String lodgement_category, String lodgement_hashTag, int lodgement_goodCount,
			double lodgement_reviewGradeRate, int lodgement_reviewCount, String lodgement_img, int lodgement_temp) {
		super();
		this.review_reviewNumber = review_reviewNumber;
		this.review_articleNumber = review_articleNumber;
		this.review_title = review_title;
		this.review_userNumber = review_userNumber;
		this.review_resevNumber = review_resevNumber;
		this.review_category = review_category;
		this.review_starPoint = review_starPoint;
		this.review_writedDate = review_writedDate;
		this.review_content = review_content;
		this.review_writer = review_writer;
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
	}
		
	
}
