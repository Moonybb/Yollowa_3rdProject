package com.proj.yollowa.model.entity.activity;

public class ActivityOptionVo {
	private int activityOption_optionNumber;
	private int activityOption_articleNumber;
	private String activityOption_name;
	private String activityOption_subName;
	private int activityOption_price;
	
	public ActivityOptionVo() {
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + activityOption_articleNumber;
		result = prime * result + ((activityOption_name == null) ? 0 : activityOption_name.hashCode());
		result = prime * result + activityOption_optionNumber;
		result = prime * result + activityOption_price;
		result = prime * result + ((activityOption_subName == null) ? 0 : activityOption_subName.hashCode());
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
		ActivityOptionVo other = (ActivityOptionVo) obj;
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
		return true;
	}

	public ActivityOptionVo(int activityOption_optionNumber, int activityOption_articleNumber,
			String activityOption_name, String activityOption_subName, int activityOption_price) {
		super();
		this.activityOption_optionNumber = activityOption_optionNumber;
		this.activityOption_articleNumber = activityOption_articleNumber;
		this.activityOption_name = activityOption_name;
		this.activityOption_subName = activityOption_subName;
		this.activityOption_price = activityOption_price;
	}

	@Override
	public String toString() {
		return "ActivityOptionVo [activityOption_optionNumber=" + activityOption_optionNumber
				+ ", activityOption_articleNumber=" + activityOption_articleNumber + ", activityOption_name="
				+ activityOption_name + ", activityOption_subName=" + activityOption_subName + ", activityOption_price="
				+ activityOption_price + "]";
	}

	
	
}
