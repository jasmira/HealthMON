package com.vesag.bt.parser.beans;

import java.util.Arrays;


//Data Structure for SCP-ECG section 0 table
public class ECGSCPSec0 {
	
	private byte[] crc;
	
	private byte[] sectionId;
	
	private byte[] sectionLength;
	
	private byte sectionVersion;
	
	private byte protocolVersion;
	
	private byte[] reservedBits;
	
	private byte[] sectionId1;
	
	private byte[] sectionLength1;
	
	private byte[] indexToSection1;
	
	private byte[] sectionId2;
	
	private byte[] sectionLength2;
	
	private byte[] indexToSection2;
	
	private byte[] sectionId3;
	
	private byte[] sectionLength3;
	
	private byte[] indexToSection3;
	
	private byte[] sectionId4;
	
	private byte[] sectionLength4;
	
	private byte[] indexToSection4;
	
	private byte[] sectionId5;
	
	private byte[] sectionLength5;
	
	private byte[] indexToSection5;
	
	private byte[] sectionId6;
	
	private byte[] sectionLength6;
	
	private byte[] indexToSection6;

	
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


	public byte[] getSectionId1() {
		return sectionId1;
	}


	public void setSectionId1(byte[] sectionId1) {
		this.sectionId1 = sectionId1;
	}


	public byte[] getSectionLength1() {
		return sectionLength1;
	}


	public void setSectionLength1(byte[] sectionLength1) {
		this.sectionLength1 = sectionLength1;
	}


	public byte[] getIndexToSection1() {
		return indexToSection1;
	}


	public void setIndexToSection1(byte[] indexToSection1) {
		this.indexToSection1 = indexToSection1;
	}


	public byte[] getSectionId2() {
		return sectionId2;
	}


	public void setSectionId2(byte[] sectionId2) {
		this.sectionId2 = sectionId2;
	}


	public byte[] getSectionLength2() {
		return sectionLength2;
	}


	public void setSectionLength2(byte[] sectionLength2) {
		this.sectionLength2 = sectionLength2;
	}


	public byte[] getIndexToSection2() {
		return indexToSection2;
	}


	public void setIndexToSection2(byte[] indexToSection2) {
		this.indexToSection2 = indexToSection2;
	}


	public byte[] getSectionId3() {
		return sectionId3;
	}


	public void setSectionId3(byte[] sectionId3) {
		this.sectionId3 = sectionId3;
	}


	public byte[] getSectionLength3() {
		return sectionLength3;
	}


	public void setSectionLength3(byte[] sectionLength3) {
		this.sectionLength3 = sectionLength3;
	}


	public byte[] getIndexToSection3() {
		return indexToSection3;
	}


	public void setIndexToSection3(byte[] indexToSection3) {
		this.indexToSection3 = indexToSection3;
	}


	public byte[] getSectionId4() {
		return sectionId4;
	}


	public void setSectionId4(byte[] sectionId4) {
		this.sectionId4 = sectionId4;
	}


	public byte[] getSectionLength4() {
		return sectionLength4;
	}


	public void setSectionLength4(byte[] sectionLength4) {
		this.sectionLength4 = sectionLength4;
	}


	public byte[] getIndexToSection4() {
		return indexToSection4;
	}


	public void setIndexToSection4(byte[] indexToSection4) {
		this.indexToSection4 = indexToSection4;
	}


	public byte[] getSectionId5() {
		return sectionId5;
	}


	public void setSectionId5(byte[] sectionId5) {
		this.sectionId5 = sectionId5;
	}


	public byte[] getSectionLength5() {
		return sectionLength5;
	}


	public void setSectionLength5(byte[] sectionLength5) {
		this.sectionLength5 = sectionLength5;
	}


	public byte[] getIndexToSection5() {
		return indexToSection5;
	}


	public void setIndexToSection5(byte[] indexToSection5) {
		this.indexToSection5 = indexToSection5;
	}


	public byte[] getSectionId6() {
		return sectionId6;
	}


	public void setSectionId6(byte[] sectionId6) {
		this.sectionId6 = sectionId6;
	}


	public byte[] getSectionLength6() {
		return sectionLength6;
	}


	public void setSectionLength6(byte[] sectionLength6) {
		this.sectionLength6 = sectionLength6;
	}


	public byte[] getIndexToSection6() {
		return indexToSection6;
	}


	public void setIndexToSection6(byte[] indexToSection6) {
		this.indexToSection6 = indexToSection6;
	}


	@Override
	public String toString() {
		return "ECGSCPSec0 [crc=" + Arrays.toString(crc) + ", sectionId=" +  Arrays.toString(sectionId)
				+ ", sectionLength=" +  Arrays.toString(sectionLength) + ", sectionVersion= 0x"
				+ String.format("%02X", sectionVersion) + ", protocolVersion= 0x" + String.format("%02X", protocolVersion)
				+ ", reservedBits=" + Arrays.toString(reservedBits)
				+ ", sectionId1=" +  Arrays.toString(sectionId1) + ", sectionLength1="
				+  Arrays.toString(sectionLength1) + ", indexToSection1=" +  Arrays.toString(indexToSection1)
				+ ", sectionId2=" +  Arrays.toString(sectionId2) + ", sectionLength2="
				+  Arrays.toString(sectionLength2) + ", indexToSection2=" +  Arrays.toString(indexToSection2)
				+ ", sectionId3=" +  Arrays.toString(sectionId3) + ", sectionLength3="
				+  Arrays.toString(sectionLength3) + ", indexToSection3=" +  Arrays.toString(indexToSection3)
				+ ", sectionId4=" +  Arrays.toString(sectionId4) + ", sectionLength4="
				+  Arrays.toString(sectionLength4) + ", indexToSection4=" +  Arrays.toString(indexToSection4)
				+ ", sectionId5=" +  Arrays.toString(sectionId5) + ", sectionLength5="
				+  Arrays.toString(sectionLength5) + ", indexToSection5=" +  Arrays.toString(indexToSection5)
				+ ", sectionId6=" +  Arrays.toString(sectionId6) + ", sectionLength6="
				+  Arrays.toString(sectionLength6) + ", indexToSection6=" +  Arrays.toString(indexToSection6) + "]";
	}


	
}
