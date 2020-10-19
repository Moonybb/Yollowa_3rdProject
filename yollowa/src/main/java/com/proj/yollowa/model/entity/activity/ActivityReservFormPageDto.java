package com.proj.yollowa.model.entity.activity;

public class ActivityReservFormPageDto {
	private int AReservInfo_articleNumber;
	private int AReservInfo_optionNumber;
	private String AReservInfo_amount;
	private int AReservInfo_unitPrice;
	
	public ActivityReservFormPageDto() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((AReservInfo_amount == null) ? 0 : AReservInfo_amount.hashCode());
		result = prime * result + AReservInfo_articleNumber;
		result = prime * result + AReservInfo_optionNumber;
		result = prime * result + AReservInfo_unitPrice;
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
		ActivityReservFormPageDto other = (ActivityReservFormPageDto) obj;
		if (AReservInfo_amount == null) {
			if (other.AReservInfo_amount != null)
				return false;
		} else if (!AReservInfo_amount.equals(other.AReservInfo_amount))
			return false;
		if (AReservInfo_articleNumber != other.AReservInfo_articleNumber)
			return false;
		if (AReservInfo_optionNumber != other.AReservInfo_optionNumber)
			return false;
		if (AReservInfo_unitPrice != other.AReservInfo_unitPrice)
			return false;
		return true;
	}

	public ActivityReservFormPageDto(int aReservInfo_articleNumber, int aReservInfo_optionNumber,
			String aReservInfo_amount, int aReservInfo_unitPrice) {
		super();
		AReservInfo_articleNumber = aReservInfo_articleNumber;
		AReservInfo_optionNumber = aReservInfo_optionNumber;
		AReservInfo_amount = aReservInfo_amount;
		AReservInfo_unitPrice = aReservInfo_unitPrice;
	}

	@Override
	public String toString() {
		return "ActivityReservFormPageDto [AReservInfo_articleNumber=" + AReservInfo_articleNumber
				+ ", AReservInfo_optionNumber=" + AReservInfo_optionNumber + ", AReservInfo_amount="
				+ AReservInfo_amount + ", AReservInfo_unitPrice=" + AReservInfo_unitPrice + "]";
	}

	public int getAReservInfo_articleNumber() {
		return AReservInfo_articleNumber;
	}

	public void setAReservInfo_articleNumber(int aReservInfo_articleNumber) {
		AReservInfo_articleNumber = aReservInfo_articleNumber;
	}

	public int getAReservInfo_optionNumber() {
		return AReservInfo_optionNumber;
	}

	public void setAReservInfo_optionNumber(int aReservInfo_optionNumber) {
		AReservInfo_optionNumber = aReservInfo_optionNumber;
	}

	public String getAReservInfo_amount() {
		return AReservInfo_amount;
	}

	public void setAReservInfo_amount(String aReservInfo_amount) {
		AReservInfo_amount = aReservInfo_amount;
	}

	public int getAReservInfo_unitPrice() {
		return AReservInfo_unitPrice;
	}

	public void setAReservInfo_unitPrice(int aReservInfo_unitPrice) {
		AReservInfo_unitPrice = aReservInfo_unitPrice;
	}

	
}
