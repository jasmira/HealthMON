package com.vesag.bt.parser.beans;

import java.util.Arrays;


//Data Structure for SCP-ECG section 2 table
public class ECGSCPSec2 {
	
	private byte[] crc;
	
	private byte[] sectionId;
	
	private byte[] sectionLength;
	
	private byte sectionVersion;
	
	private byte protocolVersion;
	
	private byte[] reservedBits;

	private byte[] amount;
	
	private byte[] amtOfStructures;
	
	private byte prefixBits;
	
	private byte encodingBits;
	
	private byte tableType;
	
	private byte[] baseValue;
	
	private byte[] baseValEncoding;
	
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


	public byte[] getAmount() {
		return amount;
	}


	public void setAmount(byte[] amount) {
		this.amount = amount;
	}


	public byte[] getAmtOfStructures() {
		return amtOfStructures;
	}


	public void setAmtOfStructures(byte[] amtOfStructures) {
		this.amtOfStructures = amtOfStructures;
	}


	public byte getPrefixBits() {
		return prefixBits;
	}


	public void setPrefixBits(byte prefixBits) {
		this.prefixBits = prefixBits;
	}


	public byte getEncodingBits() {
		return encodingBits;
	}


	public void setEncodingBits(byte encodingBits) {
		this.encodingBits = encodingBits;
	}


	public byte getTableType() {
		return tableType;
	}


	public void setTableType(byte tableType) {
		this.tableType = tableType;
	}


	public byte[] getBaseValue() {
		return baseValue;
	}


	public void setBaseValue(byte[] baseValue) {
		this.baseValue = baseValue;
	}


	public byte[] getBaseValEncoding() {
		return baseValEncoding;
	}


	public void setBaseValEncoding(byte[] baseValEncoding) {
		this.baseValEncoding = baseValEncoding;
	}


	public byte getPaddingByte() {
		return paddingByte;
	}


	public void setPaddingByte(byte paddingByte) {
		this.paddingByte = paddingByte;
	}


	@Override
	public String toString() {
		return "ECGSCPSec2 [crc=" +  Arrays.toString(crc) + ", sectionId=" +  Arrays.toString(sectionId)
				+ ", length=" +  Arrays.toString(sectionLength) + ", sectionVersion= 0x" + String.format("%02X", sectionVersion)
				+ ", protocolVersion= 0x" + String.format("%02X", protocolVersion) + ", reservedBits="
				+ Arrays.toString(reservedBits) + ", amount=" +  Arrays.toString(amount)
				+ ", amtOfStructures=" +  Arrays.toString(amtOfStructures) + ", prefixBits="
				+ prefixBits + ", encodingBits=" + encodingBits
				+ ", tableType=" + tableType + ", baseValue=" +  Arrays.toString(baseValue)
				+ ", baseValEncoding=" +  Arrays.toString(baseValEncoding) + ", paddingByte="
				+ paddingByte + "]";
	}
	
	
}
