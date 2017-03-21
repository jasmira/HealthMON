package com.vesag.bt.parser.beans;

import java.util.Arrays;


//Data Structure for SCP-ECG section 3 table
public class ECGSCPSec3 {
	
	private byte[] crc;
	
	private byte[] sectionId;
	
	private byte[] sectionLength;
	
	private byte sectionVersion;
	
	private byte protocolVersion;
	
	private byte[] reservedBits;
	
	private byte amount;
	
	private byte leadConfiguration;
	
	private byte[] startingSample;
	
	private byte[] endingSample;
	
	private byte leadId;
	
	private byte paddingByte;

	

	public byte[] getCrc() {
		return crc;
	}



	public void setCrc(byte[] crc) {
		this.crc = crc;
	}



	public byte[] getSectionId() {
		return sectionId;
	}



	public void setSectionId(byte[] sectionId) {
		this.sectionId = sectionId;
	}





	public byte[] getSectionLength() {
		return sectionLength;
	}



	public void setSectionLength(byte[] sectionLength) {
		this.sectionLength = sectionLength;
	}



	public byte getSectionVersion() {
		return sectionVersion;
	}



	public void setSectionVersion(byte sectionVersion) {
		this.sectionVersion = sectionVersion;
	}



	public byte getProtocolVersion() {
		return protocolVersion;
	}



	public void setProtocolVersion(byte protocolVersion) {
		this.protocolVersion = protocolVersion;
	}



	public byte[] getReservedBits() {
		return reservedBits;
	}



	public void setReservedBits(byte[] reservedBits) {
		this.reservedBits = reservedBits;
	}



	public byte getAmount() {
		return amount;
	}



	public void setAmount(byte amount) {
		this.amount = amount;
	}



	public byte getLeadConfiguration() {
		return leadConfiguration;
	}



	public void setLeadConfiguration(byte leadConfiguration) {
		this.leadConfiguration = leadConfiguration;
	}



	public byte[] getStartingSample() {
		return startingSample;
	}



	public void setStartingSample(byte[] startingSample) {
		this.startingSample = startingSample;
	}



	public byte[] getEndingSample() {
		return endingSample;
	}



	public void setEndingSample(byte[] endingSample) {
		this.endingSample = endingSample;
	}



	public byte getLeadId() {
		return leadId;
	}



	public void setLeadId(byte leadId) {
		this.leadId = leadId;
	}



	public byte getPaddingByte() {
		return paddingByte;
	}



	public void setPaddingByte(byte paddingByte) {
		this.paddingByte = paddingByte;
	}



	@Override
	public String toString() {
		return "ECGSCPSec3 [crc=" +  Arrays.toString(crc) + ", sectionId=" +  Arrays.toString(sectionId)
				+ ", length=" +  Arrays.toString(sectionLength) + ", sectionVersion= 0x" + String.format("%02X", sectionVersion)
				+ ", protocolVersion= 0x" + String.format("%02X", protocolVersion) + ", reservedBits="
				+  Arrays.toString(reservedBits) + ", amount=" + amount
				+ ", leadConfiguration=" + leadConfiguration
				+ ", startingSample=" +  Arrays.toString(startingSample) + ", endingSample="
				+  Arrays.toString(endingSample) + ", leadId=" + leadId + ", paddingByte="
				+ paddingByte + "]";
	}
	
	
}
