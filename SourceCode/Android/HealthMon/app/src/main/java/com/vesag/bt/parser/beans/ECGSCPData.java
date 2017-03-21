package com.vesag.bt.parser.beans;



//Data Structure for SCP-ECG non real time table
public class ECGSCPData {
	

	private byte[] crc;
	
	private byte[] length;

	public byte[] getCrc() {
		return crc;
	}

	public void setCrc(byte[] crc) {
		this.crc = crc;
	}

	public byte[] getLength() {
		return length;
	}

	public void setLength(byte[] length) {
		this.length = length;
	}

	


	
	

	
}
