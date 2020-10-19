package com.proj.yollowa.model.entity.mypage;

import java.sql.Date;

public class ActivityReviewVo {
	
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
	private int activity_number;
	private int activity_userNumber;
	private String activity_title;
	private String activity_location;
	private String activity_category;
	private String activity_hashTag;
	private int activity_goodCount;
	private double activity_reviewGradeRate;
	private int activity_reviewCount;
	private String activity_img;
	private int activity_temp;
	private double activity_Lat;
	private double activity_Lng;
	
	
	public ActivityReviewVo() {
	}


	public ActivityReviewVo(int review_reviewNumber, int review_articleNumber, String review_title,
			int review_userNumber, int review_resevNumber, int review_category, int review_starPoint,
			Date review_writedDate, String review_content, String review_writer, int activity_number,
			int activity_userNumber, String activity_title, String activity_location, String activity_category,
			String activity_hashTag, int activity_goodCount, double activity_reviewGradeRate, int activity_reviewCount,
			String activity_img, int activity_temp, double activity_Lat, double activity_Lng) {
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
		this.activity_number = activity_number;
		this.activity_userNumber = activity_userNumber;
		this.activity_title = activity_title;
		this.activity_location = activity_location;
		this.activity_category = activity_category;
		this.activity_hashTag = activity_hashTag;
		this.activity_goodCount = activity_goodCount;
		this.activity_reviewGradeRate = activity_reviewGradeRate;
		this.activity_reviewCount = activity_reviewCount;
		this.activity_img = activity_img;
		this.activity_temp = activity_temp;
		this.activity_Lat = activity_Lat;
		this.activity_Lng = activity_Lng;
	}


	@Override
	public String toString() {
		return "ActivityReviewVo [review_reviewNumber=" + review_reviewNumber + ", review_articleNumber="
				+ review_articleNumber + ", review_title=" + review_title + ", review_userNumber=" + review_userNumber
				+ ", review_resevNumber=" + review_resevNumber + ", review_category=" + review_category
				+ ", review_starPoint=" + review_starPoint + ", review_writedDate=" + review_writedDate
				+ ", review_content=" + review_content + ", review_writer=" + review_writer + ", activity_number="
				+ activity_number + ", activity_userNumber=" + activity_userNumber + ", activity_title="
				+ activity_title + ", activity_location=" + activity_location + ", activity_category="
				+ activity_category + ", activity_hashTag=" + activity_hashTag + ", activity_goodCount="
				+ activity_goodCount + ", activity_reviewGradeRate=" + activity_reviewGradeRate
				+ ", activity_reviewCount=" + activity_reviewCount + ", activity_img=" + activity_img
				+ ", activity_temp=" + activity_temp + ", activity_Lat=" + activity_Lat + ", activity_Lng="
				+ activity_Lng + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(activity_Lat);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(activity_Lng);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((activity_category == null) ? 0 : activity_category.hashCode());
		result = prime * result + activity_goodCount;
		result = prime * result + ((activity_hashTag == null) ? 0 : activity_hashTag.hashCode());
		result = prime * result + ((activity_img == null) ? 0 : activity_img.hashCode());
		result = prime * result + ((activity_location == null) ? 0 : activity_location.hashCode());
		result = prime * result + activity_number;
		result = prime * result + activity_reviewCount;
		temp = Double.doubleToLongBits(activity_reviewGradeRate);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + activity_temp;
		result = prime * result + ((activity_title == null) ? 0 : activity_title.hashCode());
		result = prime * result + activity_userNumber;
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
		ActivityReviewVo other = (ActivityReviewVo) obj;
		if (Double.doubleToLongBits(activity_Lat) != Double.doubleToLongBits(other.activity_Lat))
			return false;
		if (Double.doubleToLongBits(activity_Lng) != Double.doubleToLongBits(other.activity_Lng))
			return false;
		if (activity_category == null) {
			if (other.activity_category != null)
				return false;
		} else if (!activity_category.equals(other.activity_category))
			return false;
		if (activity_goodCount != other.activity_goodCount)
			return false;
		if (activity_hashTag == null) {
			if (other.activity_hashTag != null)
				return false;
		} else if (!activity_hashTag.equals(other.activity_hashTag))
			return false;
		if (activity_img == null) {
			if (other.activity_img != null)
				return false;
		} else if (!activity_img.equals(other.activity_img))
			return false;
		if (activity_location == null) {
			if (other.activity_location != null)
				return false;
		} else if (!activity_location.equals(other.activity_location))
			return false;
		if (activity_number != other.activity_number)
			return false;
		if (activity_reviewCount != other.activity_reviewCount)
			return false;
		if (Double.doubleToLongBits(activity_reviewGradeRate) != Double
				.doubleToLongBits(other.activity_reviewGradeRate))
			return false;
		if (activity_temp != other.activity_temp)
			return false;
		if (activity_title == null) {
			if (other.activity_title != null)
				return false;
		} else if (!activity_title.equals(other.activity_title))
			return false;
		if (activity_userNumber != other.activity_userNumber)
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


	public int getActivity_number() {
		return activity_number;
	}


	public void setActivity_number(int activity_number) {
		this.activity_number = activity_number;
	}


	public int getActivity_userNumber() {
		return activity_userNumber;
	}


	public void setActivity_userNumber(int activity_userNumber) {
		this.activity_userNumber = activity_userNumber;
	}


	public String getActivity_title() {
		return activity_title;
	}


	public void setActivity_title(String activity_title) {
		this.activity_title = activity_title;
	}


	public String getActivity_location() {
		return activity_location;
	}


	public void setActivity_location(String activity_location) {
		this.activity_location = activity_location;
	}


	public String getActivity_category() {
		return activity_category;
	}


	public void setActivity_category(String activity_category) {
		this.activity_category = activity_category;
	}


	public String getActivity_hashTag() {
		return activity_hashTag;
	}


	public void setActivity_hashTag(String activity_hashTag) {
		this.activity_hashTag = activity_hashTag;
	}


	public int getActivity_goodCount() {
		return activity_goodCount;
	}


	public void setActivity_goodCount(int activity_goodCount) {
		this.activity_goodCount = activity_goodCount;
	}


	public double getActivity_reviewGradeRate() {
		return activity_reviewGradeRate;
	}


	public void setActivity_reviewGradeRate(double activity_reviewGradeRate) {
		this.activity_reviewGradeRate = activity_reviewGradeRate;
	}


	public int getActivity_reviewCount() {
		return activity_reviewCount;
	}


	public void setActivity_reviewCount(int activity_reviewCount) {
		this.activity_reviewCount = activity_reviewCount;
	}


	public String getActivity_img() {
		return activity_img;
	}


	public void setActivity_img(String activity_img) {
		this.activity_img = activity_img;
	}


	public int getActivity_temp() {
		return activity_temp;
	}


	public void setActivity_temp(int activity_temp) {
		this.activity_temp = activity_temp;
	}


	public double getActivity_Lat() {
		return activity_Lat;
	}


	public void setActivity_Lat(double activity_Lat) {
		this.activity_Lat = activity_Lat;
	}


	public double getActivity_Lng() {
		return activity_Lng;
	}


	public void setActivity_Lng(double activity_Lng) {
		this.activity_Lng = activity_Lng;
	}

	
	
}
