package com.vesag.bt.beans;

//POJO for non real time ECGSCP Sections  
public class ECGSCPSecBean {
	
	public int id;
	
	public String crc;
	
	public int sectionId;
	
	public int sectionLength;
	
	public String sectionVersion;
	
	public String protocolVersion;
	
	public int[] reservedBits;

	public void setId(int id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
	}
	
	public String getCrc() {
		return crc;
	}

	public void setCrc(String crc) {
		this.crc = crc;
	}

	public int getSectionId() {
		return sectionId;
	}

	public void setSectionId(int sectionId) {
		this.sectionId = sectionId;
	}

	public int getSectionLength() {
		return sectionLength;
	}

	public void setSectionLength(int sectionLength) {
		this.sectionLength = sectionLength;
	}

	public String getSectionVersion() {
		return sectionVersion;
	}

	public void setSectionVersion(String sectionVersion) {
		this.sectionVersion = sectionVersion;
	}

	public String getProtocolVersion() {
		return protocolVersion;
	}

	public void setProtocolVersion(String protocolVersion) {
		this.protocolVersion = protocolVersion;
	}

	public int[] getReservedBits() {
		return reservedBits;
	}

	public void setReservedBits(int[] reservedBits) {
		this.reservedBits = reservedBits;
	}
	
	

}
