package com.vesag.bt.beans;

import java.util.Arrays;

//POJO for non real time ECGSCP Section 2 table 
public class ECGSCPSec2Bean extends ECGSCPSecBean{


	private int amount;
	
	private int amtOfStructures;
	
	private int prefixBits;
	
	private int encodingBits;
	
	private int tableType;
	
	private int baseValue;
	
	private int baseValEncoding;
	
	private int paddingByte;

	
	
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getAmtOfStructures() {
		return amtOfStructures;
	}

	public void setAmtOfStructures(int amtOfStructures) {
		this.amtOfStructures = amtOfStructures;
	}

	public int getPrefixBits() {
		return prefixBits;
	}

	public void setPrefixBits(int prefixBits) {
		this.prefixBits = prefixBits;
	}

	public int getEncodingBits() {
		return encodingBits;
	}

	public void setEncodingBits(int encodingBits) {
		this.encodingBits = encodingBits;
	}

	public int getTableType() {
		return tableType;
	}

	public void setTableType(int tableType) {
		this.tableType = tableType;
	}

	public int getBaseValue() {
		return baseValue;
	}

	public void setBaseValue(int baseValue) {
		this.baseValue = baseValue;
	}

	public int getBaseValEncoding() {
		return baseValEncoding;
	}

	public void setBaseValEncoding(int baseValEncoding) {
		this.baseValEncoding = baseValEncoding;
	}

	public int getPaddingByte() {
		return paddingByte;
	}

	public void setPaddingByte(int paddingByte) {
		this.paddingByte = paddingByte;
	}

	@Override
	public String toString() {
		return "ECGSCPSec2 [crc=" + crc + ", sectionId=" + sectionId
				+ ", length=" + sectionLength + ", sectionVersion " + sectionVersion
				+ ", protocolVersion " + protocolVersion + ", reservedBits="
				+ Arrays.toString(reservedBits) + ", amount=" + amount
				+ ", amtOfStructures=" + amtOfStructures + ", prefixBits="
				+ prefixBits + ", encodingBits=" + encodingBits
				+ ", tableType=" + tableType + ", baseValue=" + baseValue
				+ ", baseValEncoding=" + baseValEncoding + ", paddingByte="
				+ paddingByte + "]";
	}
	
	
}
