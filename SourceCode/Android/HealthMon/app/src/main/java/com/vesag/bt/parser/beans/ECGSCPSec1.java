package com.vesag.bt.parser.beans;

import java.util.Arrays;


//Data Structure for SCP-ECG section 1 table
public class ECGSCPSec1 {
	
	private byte[] crc;
	
	private byte[] sectionId;
	
	private byte[] sectionLength;
	
	private byte sectionVersion;
	
	private byte protocolVersion;
	
	private byte[] reservedBits;
	
	private byte tag1;
	
	private byte[] length1;
	
	private byte[] value1;
	
	private byte tag2;
	
	private byte[] length2;
	
	private byte[] value2;
	
	private byte tag3;
	
	private byte[] length3;

	
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


	public byte getTag1() {
		return tag1;
	}


	public void setTag1(byte tag1) {
		this.tag1 = tag1;
	}


	public byte[] getLength1() {
		return length1;
	}


	public void setLength1(byte[] length1) {
		this.length1 = length1;
	}


	public byte[] getValue1() {
		return value1;
	}


	public void setValue1(byte[] value1) {
		this.value1 = value1;
	}


	public byte getTag2() {
		return tag2;
	}


	public void setTag2(byte tag2) {
		this.tag2 = tag2;
	}


	public byte[] getLength2() {
		return length2;
	}


	public void setLength2(byte[] length2) {
		this.length2 = length2;
	}


	public byte[] getValue2() {
		return value2;
	}


	public void setValue2(byte[] value2) {
		this.value2 = value2;
	}


	public byte getTag3() {
		return tag3;
	}


	public void setTag3(byte tag3) {
		this.tag3 = tag3;
	}


	public byte[] getLength3() {
		return length3;
	}


	public void setLength3(byte[] length3) {
		this.length3 = length3;
	}


	@Override
	public String toString() {
		return "ECGSCPSec1 [crc=" +  Arrays.toString(crc) + ", sectionId=" +  Arrays.toString(sectionId)
				+ ", length=" +  Arrays.toString(sectionLength) + ", sectionVersion= 0x" + String.format("%02X", sectionVersion)
				+ ", protocolVersion= 0x" + String.format("%02X", protocolVersion) + ", reservedBits="
				+ Arrays.toString(reservedBits) + ", tag1=" + tag1
				+ ", length1=" +  Arrays.toString(length1) + ", value1=" +  Arrays.toString(value1) + ", tag2="
				+ tag2 + ", length2=" +  Arrays.toString(length2) + ", value2=" +  Arrays.toString(value2)
				+ ", tag3=" + tag3 + ", length3=" +  Arrays.toString(length3) + "]";
	}
	
	

}
