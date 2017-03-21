package com.vesag.bt.beans;

public class ECGAckPacket {
	
	private byte head;
	
	private byte token;
	
	private byte length;
	
	private byte data;
	
	private byte crc;

	public byte getHead() {
		return head;
	}

	public void setHead(byte head) {
		this.head = head;
	}

	public byte getToken() {
		return token;
	}

	public void setToken(byte token) {
		this.token = token;
	}

	public byte getLength() {
		return length;
	}

	public void setLength(byte length) {
		this.length = length;
	}

	public byte getData() {
		return data;
	}

	public void setData(byte data) {
		this.data = data;
	}

	public byte getCrc() {
		return crc;
	}

	public void setCrc(byte crc) {
		this.crc = crc;
	}
	
	

}
