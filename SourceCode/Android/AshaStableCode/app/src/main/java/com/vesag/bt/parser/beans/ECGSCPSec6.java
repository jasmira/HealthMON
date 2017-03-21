package com.vesag.bt.parser.beans;

import java.util.Arrays;


//Data Structure for SCP-ECG section 4 table
public class ECGSCPSec6 {
	private byte[] crc;
	
	private byte[] sectionId;
	
	private byte[] sectionLength;
	
	private byte sectionVersion;
	
	private byte protocolVersion;
	
	private byte[] reservedBits;
	
	private byte[] avm;
	
	private byte[] samplingInterval;

	private byte diffUsed;
	
	private byte biomodal;
	
	private byte[] leadLength;
	
	private byte[] dataBlock;

		
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


	public byte[] getAvm() {
		return avm;
	}


	public void setAvm(byte[] avm) {
		this.avm = avm;
	}


	public byte[] getSamplingInterval() {
		return samplingInterval;
	}


	public void setSamplingInterval(byte[] samplingInterval) {
		this.samplingInterval = samplingInterval;
	}


	public byte getDiffUsed() {
		return diffUsed;
	}


	public void setDiffUsed(byte diffUsed) {
		this.diffUsed = diffUsed;
	}


	public byte getBiomodal() {
		return biomodal;
	}


	public void setBiomodal(byte biomodal) {
		this.biomodal = biomodal;
	}


	public byte[] getLeadLength() {
		return leadLength;
	}


	public void setLeadLength(byte[] leadLength) {
		this.leadLength = leadLength;
	}


	public byte[] getDataBlock() {
		return dataBlock;
	}


	public void setDataBlock(byte[] dataBlock) {
		this.dataBlock = dataBlock;
	}



	@Override
	public String toString() {
		return "ECGSCPSec6 [crc=" +  Arrays.toString(crc) + ", sectionId=" +  Arrays.toString(sectionId)
				+ ", length=" +  Arrays.toString(sectionLength) + ", sectionVersion= 0x" + String.format("%02X", sectionVersion)
				+ ", protocolVersion= 0x" + String.format("%02X", protocolVersion) + ", reservedBits="
				+ Arrays.toString(reservedBits) + ", avm=" +  Arrays.toString(avm)
				+ ", samplingInterval=" +  Arrays.toString(samplingInterval) + ", diffUsed="
				+ diffUsed + ", biomodal=" + biomodal + ", leadLength="
				+  Arrays.toString(leadLength) + ", dataBlock=" + Arrays.toString(dataBlock)
				+ "]";
	}
	
	
}
