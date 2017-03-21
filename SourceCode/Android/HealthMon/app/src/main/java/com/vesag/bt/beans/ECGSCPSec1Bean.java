package com.vesag.bt.beans;

import java.util.Arrays;

//POJO for non real time ECGSCP Section 1 table 
public class ECGSCPSec1Bean extends ECGSCPSecBean{
	
	
	private int tag1;
	
	private int length1;
	
	private int[] value1;
	
	private int tag2;
	
	private int length2;
	
	private int[] value2;
	
	private int tag3;
	
	private int length3;
	
	

	public int getTag1() {
		return tag1;
	}

	public void setTag1(int tag1) {
		this.tag1 = tag1;
	}

	public int getLength1() {
		return length1;
	}

	public void setLength1(int length1) {
		this.length1 = length1;
	}


	public int[] getValue1() {
		return value1;
	}

	public void setValue1(int[] value1) {
		this.value1 = value1;
	}

	public int getTag2() {
		return tag2;
	}

	public void setTag2(int tag2) {
		this.tag2 = tag2;
	}

	public int getLength2() {
		return length2;
	}

	public void setLength2(int length2) {
		this.length2 = length2;
	}

	
	public int[] getValue2() {
		return value2;
	}

	public void setValue2(int[] value2) {
		this.value2 = value2;
	}

	public int getTag3() {
		return tag3;
	}

	public void setTag3(int tag3) {
		this.tag3 = tag3;
	}

	public int getLength3() {
		return length3;
	}

	public void setLength3(int length3) {
		this.length3 = length3;
	}

	@Override
	public String toString() {
		return "ECGSCPSec1 [crc=" + crc + ", sectionId=" + sectionId
				+ ", length=" + sectionLength + ", sectionVersion= 0x" + sectionVersion
				+ ", protocolVersion= 0x" + protocolVersion + ", reservedBits="
				+ Arrays.toString(reservedBits) + ", tag1=" + tag1
				+ ", length1=" + length1 + ", value1=" +  Arrays.toString(value1) + ", tag2="
				+ tag2 + ", length2=" + length2 + ", value2=" +  Arrays.toString(value2)
				+ ", tag3=" + tag3 + ", length3=" + length3 + "]";
	}
	
	

}
