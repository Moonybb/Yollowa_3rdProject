package com.proj.yollowa.model.entity.mypage;

import java.sql.Date;

public class LReviewDto {
	private int lReservInfo_number;
	private int lReservInfo_userNumber;
	private int lReservInfo_acticleNumber;
	private int lReservInfo_roomNumber;
	private Date lReservInfo_checkIn;
	private Date lReservInfo_checkOut;
	private String lReservInfo_phoneNumber;
	private Date lReservInfo_reservDate;
	private int lReservInfo_payment;
	private int lReservInfo_reservStatus;
	private int lReservInfo_cartStatus;
	private int roomInfo_roomNumber;
	private int roomInfo_articleNumber;
	private String roomInfo_name;
	private int lodgement_number;
	private String lodgement_companyName;
	private String lodgement_location;
	private String lodgement_LatLng;
	
	public LReviewDto() {
	}

	public LReviewDto(int lReservInfo_number, int lReservInfo_userNumber, int lReservInfo_acticleNumber,
			int lReservInfo_roomNumber, Date lReservInfo_checkIn, Date lReservInfo_checkOut,
			String lReservInfo_phoneNumber, Date lReservInfo_reservDate, int lReservInfo_payment,
			int lReservInfo_reservStatus, int lReservInfo_cartStatus, int roomInfo_roomNumber,
			int roomInfo_articleNumber, String roomInfo_name, int lodgement_number, String lodgement_companyName,
			String lodgement_location, String lodgement_LatLng) {
		super();
		this.lReservInfo_number = lReservInfo_number;
		this.lReservInfo_userNumber = lReservInfo_userNumber;
		this.lReservInfo_acticleNumber = lReservInfo_acticleNumber;
		this.lReservInfo_roomNumber = lReservInfo_roomNumber;
		this.lReservInfo_checkIn = lReservInfo_checkIn;
		this.lReservInfo_checkOut = lReservInfo_checkOut;
		this.lReservInfo_phoneNumber = lReservInfo_phoneNumber;
		this.lReservInfo_reservDate = lReservInfo_reservDate;
		this.lReservInfo_payment = lReservInfo_payment;
		this.lReservInfo_reservStatus = lReservInfo_reservStatus;
		this.lReservInfo_cartStatus = lReservInfo_cartStatus;
		this.roomInfo_roomNumber = roomInfo_roomNumber;
		this.roomInfo_articleNumber = roomInfo_articleNumber;
		this.roomInfo_name = roomInfo_name;
		this.lodgement_number = lodgement_number;
		this.lodgement_companyName = lodgement_companyName;
		this.lodgement_location = lodgement_location;
		this.lodgement_LatLng = lodgement_LatLng;
	}

	public int getlReservInfo_number() {
		return lReservInfo_number;
	}

	public void setlReservInfo_number(int lReservInfo_number) {
		this.lReservInfo_number = lReservInfo_number;
	}

	public int getlReservInfo_userNumber() {
		return lReservInfo_userNumber;
	}

	public void setlReservInfo_userNumber(int lReservInfo_userNumber) {
		this.lReservInfo_userNumber = lReservInfo_userNumber;
	}

	public int getlReservInfo_acticleNumber() {
		return lReservInfo_acticleNumber;
	}

	public void setlReservInfo_acticleNumber(int lReservInfo_acticleNumber) {
		this.lReservInfo_acticleNumber = lReservInfo_acticleNumber;
	}

	public int getlReservInfo_roomNumber() {
		return lReservInfo_roomNumber;
	}

	public void setlReservInfo_roomNumber(int lReservInfo_roomNumber) {
		this.lReservInfo_roomNumber = lReservInfo_roomNumber;
	}

	public Date getlReservInfo_checkIn() {
		return lReservInfo_checkIn;
	}

	public void setlReservInfo_checkIn(Date lReservInfo_checkIn) {
		this.lReservInfo_checkIn = lReservInfo_checkIn;
	}

	public Date getlReservInfo_checkOut() {
		return lReservInfo_checkOut;
	}

	public void setlReservInfo_checkOut(Date lReservInfo_checkOut) {
		this.lReservInfo_checkOut = lReservInfo_checkOut;
	}

	public String getlReservInfo_phoneNumber() {
		return lReservInfo_phoneNumber;
	}

	public void setlReservInfo_phoneNumber(String lReservInfo_phoneNumber) {
		this.lReservInfo_phoneNumber = lReservInfo_phoneNumber;
	}

	public Date getlReservInfo_reservDate() {
		return lReservInfo_reservDate;
	}

	public void setlReservInfo_reservDate(Date lReservInfo_reservDate) {
		this.lReservInfo_reservDate = lReservInfo_reservDate;
	}

	public int getlReservInfo_payment() {
		return lReservInfo_payment;
	}

	public void setlReservInfo_payment(int lReservInfo_payment) {
		this.lReservInfo_payment = lReservInfo_payment;
	}

	public int getlReservInfo_reservStatus() {
		return lReservInfo_reservStatus;
	}

	public void setlReservInfo_reservStatus(int lReservInfo_reservStatus) {
		this.lReservInfo_reservStatus = lReservInfo_reservStatus;
	}

	public int getlReservInfo_cartStatus() {
		return lReservInfo_cartStatus;
	}

	public void setlReservInfo_cartStatus(int lReservInfo_cartStatus) {
		this.lReservInfo_cartStatus = lReservInfo_cartStatus;
	}

	public int getRoomInfo_roomNumber() {
		return roomInfo_roomNumber;
	}

	public void setRoomInfo_roomNumber(int roomInfo_roomNumber) {
		this.roomInfo_roomNumber = roomInfo_roomNumber;
	}

	public int getRoomInfo_articleNumber() {
		return roomInfo_articleNumber;
	}

	public void setRoomInfo_articleNumber(int roomInfo_articleNumber) {
		this.roomInfo_articleNumber = roomInfo_articleNumber;
	}

	public String getRoomInfo_name() {
		return roomInfo_name;
	}

	public void setRoomInfo_name(String roomInfo_name) {
		this.roomInfo_name = roomInfo_name;
	}

	public int getLodgement_number() {
		return lodgement_number;
	}

	public void setLodgement_number(int lodgement_number) {
		this.lodgement_number = lodgement_number;
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

	public String getLodgement_LatLng() {
		return lodgement_LatLng;
	}

	public void setLodgement_LatLng(String lodgement_LatLng) {
		this.lodgement_LatLng = lodgement_LatLng;
	}

	@Override
	public String toString() {
		return "ReviewDto [lReservInfo_number=" + lReservInfo_number + ", lReservInfo_userNumber="
				+ lReservInfo_userNumber + ", lReservInfo_acticleNumber=" + lReservInfo_acticleNumber
				+ ", lReservInfo_roomNumber=" + lReservInfo_roomNumber + ", lReservInfo_checkIn=" + lReservInfo_checkIn
				+ ", lReservInfo_checkOut=" + lReservInfo_checkOut + ", lReservInfo_phoneNumber="
				+ lReservInfo_phoneNumber + ", lReservInfo_reservDate=" + lReservInfo_reservDate
				+ ", lReservInfo_payment=" + lReservInfo_payment + ", lReservInfo_reservStatus="
				+ lReservInfo_reservStatus + ", lReservInfo_cartStatus=" + lReservInfo_cartStatus
				+ ", roomInfo_roomNumber=" + roomInfo_roomNumber + ", roomInfo_articleNumber=" + roomInfo_articleNumber
				+ ", roomInfo_name=" + roomInfo_name + ", lodgement_number=" + lodgement_number
				+ ", lodgement_companyName=" + lodgement_companyName + ", lodgement_location=" + lodgement_location
				+ ", lodgement_LatLng=" + lodgement_LatLng + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + lReservInfo_acticleNumber;
		result = prime * result + lReservInfo_cartStatus;
		result = prime * result + ((lReservInfo_checkIn == null) ? 0 : lReservInfo_checkIn.hashCode());
		result = prime * result + ((lReservInfo_checkOut == null) ? 0 : lReservInfo_checkOut.hashCode());
		result = prime * result + lReservInfo_number;
		result = prime * result + lReservInfo_payment;
		result = prime * result + ((lReservInfo_phoneNumber == null) ? 0 : lReservInfo_phoneNumber.hashCode());
		result = prime * result + ((lReservInfo_reservDate == null) ? 0 : lReservInfo_reservDate.hashCode());
		result = prime * result + lReservInfo_reservStatus;
		result = prime * result + lReservInfo_roomNumber;
		result = prime * result + lReservInfo_userNumber;
		result = prime * result + ((lodgement_LatLng == null) ? 0 : lodgement_LatLng.hashCode());
		result = prime * result + ((lodgement_companyName == null) ? 0 : lodgement_companyName.hashCode());
		result = prime * result + ((lodgement_location == null) ? 0 : lodgement_location.hashCode());
		result = prime * result + lodgement_number;
		result = prime * result + roomInfo_articleNumber;
		result = prime * result + ((roomInfo_name == null) ? 0 : roomInfo_name.hashCode());
		result = prime * result + roomInfo_roomNumber;
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
		LReviewDto other = (LReviewDto) obj;
		if (lReservInfo_acticleNumber != other.lReservInfo_acticleNumber)
			return false;
		if (lReservInfo_cartStatus != other.lReservInfo_cartStatus)
			return false;
		if (lReservInfo_checkIn == null) {
			if (other.lReservInfo_checkIn != null)
				return false;
		} else if (!lReservInfo_checkIn.equals(other.lReservInfo_checkIn))
			return false;
		if (lReservInfo_checkOut == null) {
			if (other.lReservInfo_checkOut != null)
				return false;
		} else if (!lReservInfo_checkOut.equals(other.lReservInfo_checkOut))
			return false;
		if (lReservInfo_number != other.lReservInfo_number)
			return false;
		if (lReservInfo_payment != other.lReservInfo_payment)
			return false;
		if (lReservInfo_phoneNumber == null) {
			if (other.lReservInfo_phoneNumber != null)
				return false;
		} else if (!lReservInfo_phoneNumber.equals(other.lReservInfo_phoneNumber))
			return false;
		if (lReservInfo_reservDate == null) {
			if (other.lReservInfo_reservDate != null)
				return false;
		} else if (!lReservInfo_reservDate.equals(other.lReservInfo_reservDate))
			return false;
		if (lReservInfo_reservStatus != other.lReservInfo_reservStatus)
			return false;
		if (lReservInfo_roomNumber != other.lReservInfo_roomNumber)
			return false;
		if (lReservInfo_userNumber != other.lReservInfo_userNumber)
			return false;
		if (lodgement_LatLng == null) {
			if (other.lodgement_LatLng != null)
				return false;
		} else if (!lodgement_LatLng.equals(other.lodgement_LatLng))
			return false;
		if (lodgement_companyName == null) {
			if (other.lodgement_companyName != null)
				return false;
		} else if (!lodgement_companyName.equals(other.lodgement_companyName))
			return false;
		if (lodgement_location == null) {
			if (other.lodgement_location != null)
				return false;
		} else if (!lodgement_location.equals(other.lodgement_location))
			return false;
		if (lodgement_number != other.lodgement_number)
			return false;
		if (roomInfo_articleNumber != other.roomInfo_articleNumber)
			return false;
		if (roomInfo_name == null) {
			if (other.roomInfo_name != null)
				return false;
		} else if (!roomInfo_name.equals(other.roomInfo_name))
			return false;
		if (roomInfo_roomNumber != other.roomInfo_roomNumber)
			return false;
		return true;
	}
	
	
}
