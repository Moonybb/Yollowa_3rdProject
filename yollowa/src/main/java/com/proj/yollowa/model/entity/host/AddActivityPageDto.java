package com.proj.yollowa.model.entity.host;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class AddActivityPageDto {
	private String activity_number;
	private String activity_category;
	private String activity_title;
	private String activity_location;
	private double activity_Lat;
	private double activity_Lng;
	private String activity_hashTag;
	private String activity_img;
	private String activity_reviewCount;
	private String activity_goodCount;
	private String activity_reviewGradeRate;
	private String activity_temp;
	private String information_comment;
	private String information_notice;
	private String information_basicInfo;
	private String information_addPeopleInfo;
	private String information_service;
	private String information_refundInfo;
	private MultipartFile[] titleImg;
	
	public AddActivityPageDto() {
		// TODO Auto-generated constructor stub
	}

	public AddActivityPageDto(String activity_number, String activity_category, String activity_title,
			String activity_location, double activity_Lat, double activity_Lng, String activity_hashTag,
			String activity_img, String activity_reviewCount, String activity_goodCount,
			String activity_reviewGradeRate, String activity_temp, String information_comment,
			String information_notice, String information_basicInfo, String information_addPeopleInfo,
			String information_service, String information_refundInfo, MultipartFile[] titleImg) {
		super();
		this.activity_number = activity_number;
		this.activity_category = activity_category;
		this.activity_title = activity_title;
		this.activity_location = activity_location;
		this.activity_Lat = activity_Lat;
		this.activity_Lng = activity_Lng;
		this.activity_hashTag = activity_hashTag;
		this.activity_img = activity_img;
		this.activity_reviewCount = activity_reviewCount;
		this.activity_goodCount = activity_goodCount;
		this.activity_reviewGradeRate = activity_reviewGradeRate;
		this.activity_temp = activity_temp;
		this.information_comment = information_comment;
		this.information_notice = information_notice;
		this.information_basicInfo = information_basicInfo;
		this.information_addPeopleInfo = information_addPeopleInfo;
		this.information_service = information_service;
		this.information_refundInfo = information_refundInfo;
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "AddActivityPageDto [activity_number=" + activity_number + ", activity_category=" + activity_category
				+ ", activity_title=" + activity_title + ", activity_location=" + activity_location + ", activity_Lat="
				+ activity_Lat + ", activity_Lng=" + activity_Lng + ", activity_hashTag=" + activity_hashTag
				+ ", activity_img=" + activity_img + ", activity_reviewCount=" + activity_reviewCount
				+ ", activity_goodCount=" + activity_goodCount + ", activity_reviewGradeRate="
				+ activity_reviewGradeRate + ", activity_temp=" + activity_temp + ", information_comment="
				+ information_comment + ", information_notice=" + information_notice + ", information_basicInfo="
				+ information_basicInfo + ", information_addPeopleInfo=" + information_addPeopleInfo
				+ ", information_service=" + information_service + ", information_refundInfo=" + information_refundInfo
				+ ", titleImg=" + Arrays.toString(titleImg) + "]";
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
		result = prime * result + ((activity_goodCount == null) ? 0 : activity_goodCount.hashCode());
		result = prime * result + ((activity_hashTag == null) ? 0 : activity_hashTag.hashCode());
		result = prime * result + ((activity_img == null) ? 0 : activity_img.hashCode());
		result = prime * result + ((activity_location == null) ? 0 : activity_location.hashCode());
		result = prime * result + ((activity_number == null) ? 0 : activity_number.hashCode());
		result = prime * result + ((activity_reviewCount == null) ? 0 : activity_reviewCount.hashCode());
		result = prime * result + ((activity_reviewGradeRate == null) ? 0 : activity_reviewGradeRate.hashCode());
		result = prime * result + ((activity_temp == null) ? 0 : activity_temp.hashCode());
		result = prime * result + ((activity_title == null) ? 0 : activity_title.hashCode());
		result = prime * result + ((information_addPeopleInfo == null) ? 0 : information_addPeopleInfo.hashCode());
		result = prime * result + ((information_basicInfo == null) ? 0 : information_basicInfo.hashCode());
		result = prime * result + ((information_comment == null) ? 0 : information_comment.hashCode());
		result = prime * result + ((information_notice == null) ? 0 : information_notice.hashCode());
		result = prime * result + ((information_refundInfo == null) ? 0 : information_refundInfo.hashCode());
		result = prime * result + ((information_service == null) ? 0 : information_service.hashCode());
		result = prime * result + Arrays.hashCode(titleImg);
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
		AddActivityPageDto other = (AddActivityPageDto) obj;
		if (Double.doubleToLongBits(activity_Lat) != Double.doubleToLongBits(other.activity_Lat))
			return false;
		if (Double.doubleToLongBits(activity_Lng) != Double.doubleToLongBits(other.activity_Lng))
			return false;
		if (activity_category == null) {
			if (other.activity_category != null)
				return false;
		} else if (!activity_category.equals(other.activity_category))
			return false;
		if (activity_goodCount == null) {
			if (other.activity_goodCount != null)
				return false;
		} else if (!activity_goodCount.equals(other.activity_goodCount))
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
		if (activity_number == null) {
			if (other.activity_number != null)
				return false;
		} else if (!activity_number.equals(other.activity_number))
			return false;
		if (activity_reviewCount == null) {
			if (other.activity_reviewCount != null)
				return false;
		} else if (!activity_reviewCount.equals(other.activity_reviewCount))
			return false;
		if (activity_reviewGradeRate == null) {
			if (other.activity_reviewGradeRate != null)
				return false;
		} else if (!activity_reviewGradeRate.equals(other.activity_reviewGradeRate))
			return false;
		if (activity_temp == null) {
			if (other.activity_temp != null)
				return false;
		} else if (!activity_temp.equals(other.activity_temp))
			return false;
		if (activity_title == null) {
			if (other.activity_title != null)
				return false;
		} else if (!activity_title.equals(other.activity_title))
			return false;
		if (information_addPeopleInfo == null) {
			if (other.information_addPeopleInfo != null)
				return false;
		} else if (!information_addPeopleInfo.equals(other.information_addPeopleInfo))
			return false;
		if (information_basicInfo == null) {
			if (other.information_basicInfo != null)
				return false;
		} else if (!information_basicInfo.equals(other.information_basicInfo))
			return false;
		if (information_comment == null) {
			if (other.information_comment != null)
				return false;
		} else if (!information_comment.equals(other.information_comment))
			return false;
		if (information_notice == null) {
			if (other.information_notice != null)
				return false;
		} else if (!information_notice.equals(other.information_notice))
			return false;
		if (information_refundInfo == null) {
			if (other.information_refundInfo != null)
				return false;
		} else if (!information_refundInfo.equals(other.information_refundInfo))
			return false;
		if (information_service == null) {
			if (other.information_service != null)
				return false;
		} else if (!information_service.equals(other.information_service))
			return false;
		if (!Arrays.equals(titleImg, other.titleImg))
			return false;
		return true;
	}

	public String getActivity_number() {
		return activity_number;
	}

	public void setActivity_number(String activity_number) {
		this.activity_number = activity_number;
	}

	public String getActivity_category() {
		return activity_category;
	}

	public void setActivity_category(String activity_category) {
		this.activity_category = activity_category;
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

	public String getActivity_hashTag() {
		return activity_hashTag;
	}

	public void setActivity_hashTag(String activity_hashTag) {
		this.activity_hashTag = activity_hashTag;
	}

	public String getActivity_img() {
		return activity_img;
	}

	public void setActivity_img(String activity_img) {
		this.activity_img = activity_img;
	}

	public String getActivity_reviewCount() {
		return activity_reviewCount;
	}

	public void setActivity_reviewCount(String activity_reviewCount) {
		this.activity_reviewCount = activity_reviewCount;
	}

	public String getActivity_goodCount() {
		return activity_goodCount;
	}

	public void setActivity_goodCount(String activity_goodCount) {
		this.activity_goodCount = activity_goodCount;
	}

	public String getActivity_reviewGradeRate() {
		return activity_reviewGradeRate;
	}

	public void setActivity_reviewGradeRate(String activity_reviewGradeRate) {
		this.activity_reviewGradeRate = activity_reviewGradeRate;
	}

	public String getActivity_temp() {
		return activity_temp;
	}

	public void setActivity_temp(String activity_temp) {
		this.activity_temp = activity_temp;
	}

	public String getInformation_comment() {
		return information_comment;
	}

	public void setInformation_comment(String information_comment) {
		this.information_comment = information_comment;
	}

	public String getInformation_notice() {
		return information_notice;
	}

	public void setInformation_notice(String information_notice) {
		this.information_notice = information_notice;
	}

	public String getInformation_basicInfo() {
		return information_basicInfo;
	}

	public void setInformation_basicInfo(String information_basicInfo) {
		this.information_basicInfo = information_basicInfo;
	}

	public String getInformation_addPeopleInfo() {
		return information_addPeopleInfo;
	}

	public void setInformation_addPeopleInfo(String information_addPeopleInfo) {
		this.information_addPeopleInfo = information_addPeopleInfo;
	}

	public String getInformation_service() {
		return information_service;
	}

	public void setInformation_service(String information_service) {
		this.information_service = information_service;
	}

	public String getInformation_refundInfo() {
		return information_refundInfo;
	}

	public void setInformation_refundInfo(String information_refundInfo) {
		this.information_refundInfo = information_refundInfo;
	}

	public MultipartFile[] getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(MultipartFile[] titleImg) {
		this.titleImg = titleImg;
	}

	
}
