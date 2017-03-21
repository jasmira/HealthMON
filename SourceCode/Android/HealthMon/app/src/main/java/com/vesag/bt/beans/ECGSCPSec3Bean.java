package com.vesag.bt.beans;

import java.util.Arrays;

//POJO for non real time ECGSCP Section 3 table 
public class ECGSCPSec3Bean extends ECGSCPSecBean {
	
	
	private int amount;
	
	private int leadConfiguration;
	
	private int startingSample;
	
	private int endingSample;
	
	private int leadId;
	
	private int paddingByte;

	
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getLeadConfiguration() {
		return leadConfiguration;
	}

	public void setLeadConfiguration(int leadConfiguration) {
		this.leadConfiguration = leadConfiguration;
	}

	public int getStartingSample() {
		return startingSample;
	}

	public void setStartingSample(int startingSample) {
		this.startingSample = startingSample;
	}

	public int getEndingSample() {
		return endingSample;
	}

	public void setEndingSample(int endingSample) {
		this.endingSample = endingSample;
	}

	public int getLeadId() {
		return leadId;
	}

	public void setLeadId(int leadId) {
		this.leadId = leadId;
	}

	public int getPaddingByte() {
		return paddingByte;
	}

	public void setPaddingByte(int paddingByte) {
		this.paddingByte = paddingByte;
	}

	@Override
	public String toString() {
		return "ECGSCPSec3 [crc=" + crc + ", sectionId=" + sectionId
				+ ", length=" + sectionLength + ", sectionVersion= 0x" + sectionVersion
				+ ", protocolVersion= 0x" + protocolVersion + ", reservedBits="
				+  Arrays.toString(reservedBits) + ", amount=" + amount
				+ ", leadConfiguration=" + leadConfiguration
				+ ", startingSample=" + startingSample + ", endingSample="
				+ endingSample + ", leadId=" + leadId + ", paddingByte="
				+ paddingByte + "]";
	}
	
	
}
