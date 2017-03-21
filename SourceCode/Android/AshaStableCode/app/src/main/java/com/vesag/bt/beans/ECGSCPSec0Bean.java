package com.vesag.bt.beans;

import java.util.Arrays;

//POJO for non real time ECGSCP Section 0 table 
public class ECGSCPSec0Bean extends ECGSCPSecBean{
	
	private int sectionId1;
	
	private int sectionLength1;
	
	private int indexToSection1;
	
	private int sectionId2;
	
	private int sectionLength2;
	
	private int indexToSection2;
	
	private int sectionId3;
	
	private int sectionLength3;
	
	private int indexToSection3;
	
	private int sectionId4;
	
	private int sectionLength4;
	
	private int indexToSection4;
	
	private int sectionId5;
	
	private int sectionLength5;
	
	private int indexToSection5;
	
	private int sectionId6;
	
	private int sectionLength6;
	
	private int indexToSection6;

	
	
	public int getSectionId1() {
		return sectionId1;
	}

	public void setSectionId1(int sectionId1) {
		this.sectionId1 = sectionId1;
	}

	public int getSectionLength1() {
		return sectionLength1;
	}

	public void setSectionLength1(int sectionLength1) {
		this.sectionLength1 = sectionLength1;
	}

	public int getIndexToSection1() {
		return indexToSection1;
	}

	public void setIndexToSection1(int indexToSection1) {
		this.indexToSection1 = indexToSection1;
	}

	public int getSectionId2() {
		return sectionId2;
	}

	public void setSectionId2(int sectionId2) {
		this.sectionId2 = sectionId2;
	}

	public int getSectionLength2() {
		return sectionLength2;
	}

	public void setSectionLength2(int sectionLength2) {
		this.sectionLength2 = sectionLength2;
	}

	public int getIndexToSection2() {
		return indexToSection2;
	}

	public void setIndexToSection2(int indexToSection2) {
		this.indexToSection2 = indexToSection2;
	}

	public int getSectionId3() {
		return sectionId3;
	}

	public void setSectionId3(int sectionId3) {
		this.sectionId3 = sectionId3;
	}

	public int getSectionLength3() {
		return sectionLength3;
	}

	public void setSectionLength3(int sectionLength3) {
		this.sectionLength3 = sectionLength3;
	}

	public int getIndexToSection3() {
		return indexToSection3;
	}

	public void setIndexToSection3(int indexToSection3) {
		this.indexToSection3 = indexToSection3;
	}

	public int getSectionId4() {
		return sectionId4;
	}

	public void setSectionId4(int sectionId4) {
		this.sectionId4 = sectionId4;
	}

	public int getSectionLength4() {
		return sectionLength4;
	}

	public void setSectionLength4(int sectionLength4) {
		this.sectionLength4 = sectionLength4;
	}

	public int getIndexToSection4() {
		return indexToSection4;
	}

	public void setIndexToSection4(int indexToSection4) {
		this.indexToSection4 = indexToSection4;
	}

	public int getSectionId5() {
		return sectionId5;
	}

	public void setSectionId5(int sectionId5) {
		this.sectionId5 = sectionId5;
	}

	public int getSectionLength5() {
		return sectionLength5;
	}

	public void setSectionLength5(int sectionLength5) {
		this.sectionLength5 = sectionLength5;
	}

	public int getIndexToSection5() {
		return indexToSection5;
	}

	public void setIndexToSection5(int indexToSection5) {
		this.indexToSection5 = indexToSection5;
	}

	public int getSectionId6() {
		return sectionId6;
	}

	public void setSectionId6(int sectionId6) {
		this.sectionId6 = sectionId6;
	}

	public int getSectionLength6() {
		return sectionLength6;
	}

	public void setSectionLength6(int sectionLength6) {
		this.sectionLength6 = sectionLength6;
	}

	public int getIndexToSection6() {
		return indexToSection6;
	}

	public void setIndexToSection6(int indexToSection6) {
		this.indexToSection6 = indexToSection6;
	}

	@Override
	public String toString() {
		return "ECGSCPSec0 [crc=" + String.format("%02X", this.crc) + ", sectionId=" + sectionId
				+ ", sectionLength=" + sectionLength + ", sectionVersion= 0x"
				+ String.format("%02X", sectionVersion) + ", protocolVersion= 0x" + String.format("%02X", protocolVersion)
				+ ", reservedBits=" + Arrays.toString(reservedBits)
				+ ", sectionId1=" + sectionId1 + ", sectionLength1="
				+ sectionLength1 + ", indexToSection1=" + indexToSection1
				+ ", sectionId2=" + sectionId2 + ", sectionLength2="
				+ sectionLength2 + ", indexToSection2=" + indexToSection2
				+ ", sectionId3=" + sectionId3 + ", sectionLength3="
				+ sectionLength3 + ", indexToSection3=" + indexToSection3
				+ ", sectionId4=" + sectionId4 + ", sectionLength4="
				+ sectionLength4 + ", indexToSection4=" + indexToSection4
				+ ", sectionId5=" + sectionId5 + ", sectionLength5="
				+ sectionLength5 + ", indexToSection5=" + indexToSection5
				+ ", sectionId6=" + sectionId6 + ", sectionLength6="
				+ sectionLength6 + ", indexToSection6=" + indexToSection6 + "]";
	}


	
}
