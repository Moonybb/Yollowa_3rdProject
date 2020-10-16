package com.proj.yollowa.model.entity.activity;

public class ActivityDetailPageDto {

	private int activity_number;
	private int activity_userNumber;
	private String activity_title;
	private String activity_location;
	private String activity_LatLng;
	private String activity_category;
	private String activity_hashTag;
	private int activity_goodCount;
	private double activity_reviewGradeRate;
	private int activity_reviewCount;
	private String activity_img;
	private int activity_temp;
	
	private int activityOption_optionNumber;
	private int activityOption_articleNumber;
	private String activityOption_name;
	private String activityOption_subName;
	private int activityOption_price;
	
	public ActivityDetailPageDto() {
		// TODO Auto-generated constructor stub
	}

	public ActivityDetailPageDto(int activity_number, int activity_userNumber, String activity_title,
			String activity_location, String activity_LatLng, String activity_category, String activity_hashTag,
			int activity_goodCount, double activity_reviewGradeRate, int activity_reviewCount, String activity_img,
			int activity_temp, int activityOption_optionNumber, int activityOption_articleNumber,
			String activityOption_name, String activityOption_subName, int activityOption_price) {
		super();
		this.activity_number = activity_number;
		this.activity_userNumber = activity_userNumber;
		this.activity_title = activity_title;
		this.activity_location = activity_location;
		this.activity_LatLng = activity_LatLng;
		this.activity_category = activity_category;
		this.activity_hashTag = activity_hashTag;
		this.activity_goodCount = activity_goodCount;
		this.activity_reviewGradeRate = activity_reviewGradeRate;
		this.activity_reviewCount = activity_reviewCount;
		this.activity_img = activity_img;
		this.activity_temp = activity_temp;
		this.activityOption_optionNumber = activityOption_optionNumber;
		this.activityOption_articleNumber = activityOption_articleNumber;
		this.activityOption_name = activityOption_name;
		this.activityOption_subName = activityOption_subName;
		this.activityOption_price = activityOption_price;
	}

	@Override
	public String toString() {
		return "ActivityDetailPageDto [activity_number=" + activity_number + ", activity_userNumber="
				+ activity_userNumber + ", activity_title=" + activity_title + ", activity_location="
				+ activity_location + ", activity_LatLng=" + activity_LatLng + ", activity_category="
				+ activity_category + ", activity_hashTag=" + activity_hashTag + ", activity_goodCount="
				+ activity_goodCount + ", activity_reviewGradeRate=" + activity_reviewGradeRate
				+ ", activity_reviewCount=" + activity_reviewCount + ", activity_img=" + activity_img
				+ ", activity_temp=" + activity_temp + ", activityOption_optionNumber=" + activityOption_optionNumber
				+ ", activityOption_articleNumber=" + activityOption_articleNumber + ", activityOption_name="
				+ activityOption_name + ", activityOption_subName=" + activityOption_subName + ", activityOption_price="
				+ activityOption_price + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + activityOption_articleNumber;
		result = prime * result + ((activityOption_name == null) ? 0 : activityOption_name.hashCode());
		result = prime * result + activityOption_optionNumber;
		result = prime * result + activityOption_price;
		result = prime * result + ((activityOption_subName == null) ? 0 : activityOption_subName.hashCode());
		result = prime * result + ((activity_LatLng == null) ? 0 : activity_LatLng.hashCode());
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
		ActivityDetailPageDto other = (ActivityDetailPageDto) obj;
		if (activityOption_articleNumber != other.activityOption_articleNumber)
			return false;
		if (activityOption_name == null) {
			if (other.activityOption_name != null)
				return false;
		} else if (!activityOption_name.equals(other.activityOption_name))
			return false;
		if (activityOption_optionNumber != other.activityOption_optionNumber)
			return false;
		if (activityOption_price != other.activityOption_price)
			return false;
		if (activityOption_subName == null) {
			if (other.activityOption_subName != null)
				return false;
		} else if (!activityOption_subName.equals(other.activityOption_subName))
			return false;
		if (activity_LatLng == null) {
			if (other.activity_LatLng != null)
				return false;
		} else if (!activity_LatLng.equals(other.activity_LatLng))
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

	public String getActivity_LatLng() {
		return activity_LatLng;
	}

	public void setActivity_LatLng(String activity_LatLng) {
		this.activity_LatLng = activity_LatLng;
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

	public int getActivityOption_optionNumber() {
		return activityOption_optionNumber;
	}

	public void setActivityOption_optionNumber(int activityOption_optionNumber) {
		this.activityOption_optionNumber = activityOption_optionNumber;
	}

	public int getActivityOption_articleNumber() {
		return activityOption_articleNumber;
	}

	public void setActivityOption_articleNumber(int activityOption_articleNumber) {
		this.activityOption_articleNumber = activityOption_articleNumber;
	}

	public String getActivityOption_name() {
		return activityOption_name;
	}

	public void setActivityOption_name(String activityOption_name) {
		this.activityOption_name = activityOption_name;
	}

	public String getActivityOption_subName() {
		return activityOption_subName;
	}

	public void setActivityOption_subName(String activityOption_subName) {
		this.activityOption_subName = activityOption_subName;
	}

	public int getActivityOption_price() {
		return activityOption_price;
	}

	public void setActivityOption_price(int activityOption_price) {
		this.activityOption_price = activityOption_price;
	}
	
}
