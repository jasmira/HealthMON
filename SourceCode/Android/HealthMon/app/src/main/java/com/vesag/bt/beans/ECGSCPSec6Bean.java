package com.vesag.bt.beans;

import java.util.Arrays;
import java.util.List;

//POJO for non real time ECGSCP Section 6 table 
public class ECGSCPSec6Bean extends ECGSCPSecBean{
	
	
	private int avm;
	
	private int samplingInterval;

	private int diffUsed;
	
	private int biomodal;
	
	private int leadLength;
	
	private int[] dataBlock;

	private List<Integer> ecgsignal;
	

	public int getAvm() {
		return avm;
	}

	public void setAvm(int avm) {
		this.avm = avm;
	}

	public int getSamplingInterval() {
		return samplingInterval;
	}

	public void setSamplingInterval(int samplingInterval) {
		this.samplingInterval = samplingInterval;
	}

	public int getDiffUsed() {
		return diffUsed;
	}

	public void setDiffUsed(int diffUsed) {
		this.diffUsed = diffUsed;
	}

	public int getBiomodal() {
		return biomodal;
	}

	public void setBiomodal(int biomodal) {
		this.biomodal = biomodal;
	}

	public int getLeadLength() {
		return leadLength;
	}

	public void setLeadLength(int leadLength) {
		this.leadLength = leadLength;
	}

	public int[] getDataBlock() {
		return dataBlock;
	}

	public void setDataBlock(int[] dataBlock) {
		this.dataBlock = dataBlock;
	}

	
	public List<Integer> getEcgsignal() {
		return ecgsignal;
	}

	public void setEcgsignal(List<Integer> ecgsignal) {
		this.ecgsignal = ecgsignal;
	}

	@Override
	public String toString() {
		return "ECGSCPSec6 [crc=" + crc + ", sectionId=" + sectionId
				+ ", length=" + sectionLength + ", sectionVersion= 0x" + sectionVersion
				+ ", protocolVersion= 0x" + protocolVersion + ", reservedBits="
				+ Arrays.toString(reservedBits) + ", avm=" + avm
				+ ", samplingInterval=" + samplingInterval + ", diffUsed="
				+ diffUsed + ", biomodal=" + biomodal + ", leadLength="
				+ leadLength + ", dataBlock=" + Arrays.toString(dataBlock)
				+ "]";
	}
	
	
}
