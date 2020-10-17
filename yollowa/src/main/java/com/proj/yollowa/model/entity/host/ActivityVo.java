package com.proj.yollowa.model.entity.host;

public class ActivityVo {
	private int activity_number;
	private int activity_userNumber;
	private String activity_title;
	private String activity_location;
	private String activity_Lat;
	private String activity_Lng;
	private String activity_category;
	private String activity_hashTag;
	private int activity_goodCount;
	private double activity_reviewGradeRate;
	private int activity_reviewCount;
	private String activity_img;
	private int activity_temp;
	
	public ActivityVo() {
		// TODO Auto-generated constructor stub
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

	public String getActivity_Lat() {
		return activity_Lat;
	}

	public void setActivity_Lat(String activity_Lat) {
		this.activity_Lat = activity_Lat;
	}

	public String getActivity_Lng() {
		return activity_Lng;
	}

	public void setActivity_Lng(String activity_Lng) {
		this.activity_Lng = activity_Lng;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((activity_Lat == null) ? 0 : activity_Lat.hashCode());
		result = prime * result + ((activity_Lng == null) ? 0 : activity_Lng.hashCode());
		result = prime * result + ((activity_category == null) ? 0 : activity_category.hashCode());
		result = prime * result + activity_goodCount;
		result = prime * result + ((activity_hashTag == null) ? 0 : activity_hashTag.hashCode());
		result = prime * result + ((activity_img == null) ? 0 : activity_img.hashCode());
		result = prime * result + ((activity_location == null) ? 0 : activity_location.hashCode());
		result = prime * result + activity_number;
		result = prime * result + activity_reviewCount;
		long temp;
		temp = Double.doubleToLongBits(activity_reviewGradeRate);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + activity_temp;
		result = prime * result + ((activity_title == null) ? 0 : activity_title.hashCode());
		result = prime * result + activity_userNumber;
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
		ActivityVo other = (ActivityVo) obj;
		if (activity_Lat == null) {
			if (other.activity_Lat != null)
				return false;
		} else if (!activity_Lat.equals(other.activity_Lat))
			return false;
		if (activity_Lng == null) {
			if (other.activity_Lng != null)
				return false;
		} else if (!activity_Lng.equals(other.activity_Lng))
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
		return true;
	}

	@Override
	public String toString() {
		return "ActivityVo [activity_number=" + activity_number + ", activity_userNumber=" + activity_userNumber
				+ ", activity_title=" + activity_title + ", activity_location=" + activity_location + ", activity_Lat="
				+ activity_Lat + ", activity_Lng=" + activity_Lng + ", activity_category=" + activity_category
				+ ", activity_hashTag=" + activity_hashTag + ", activity_goodCount=" + activity_goodCount
				+ ", activity_reviewGradeRate=" + activity_reviewGradeRate + ", activity_reviewCount="
				+ activity_reviewCount + ", activity_img=" + activity_img + ", activity_temp=" + activity_temp + "]";
	}

	public ActivityVo(int activity_number, int activity_userNumber, String activity_title, String activity_location,
			String activity_Lat, String activity_Lng, String activity_category, String activity_hashTag,
			int activity_goodCount, double activity_reviewGradeRate, int activity_reviewCount, String activity_img,
			int activity_temp) {
		super();
		this.activity_number = activity_number;
		this.activity_userNumber = activity_userNumber;
		this.activity_title = activity_title;
		this.activity_location = activity_location;
		this.activity_Lat = activity_Lat;
		this.activity_Lng = activity_Lng;
		this.activity_category = activity_category;
		this.activity_hashTag = activity_hashTag;
		this.activity_goodCount = activity_goodCount;
		this.activity_reviewGradeRate = activity_reviewGradeRate;
		this.activity_reviewCount = activity_reviewCount;
		this.activity_img = activity_img;
		this.activity_temp = activity_temp;
	}
	
	
	
	
}
