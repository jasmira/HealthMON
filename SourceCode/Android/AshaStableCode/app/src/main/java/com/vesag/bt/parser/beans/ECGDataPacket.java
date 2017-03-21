package com.vesag.bt.parser.beans;

import java.util.Arrays;


public class ECGDataPacket{
	
private int head;
	
	private int token;
	
	private int length;
	
	private byte[] content;
	
	private int crc;

	public int getHead() {
		return head;
	}

	public void setHead(int head) {
		this.head = head;
	}

	public int getToken() {
		return token;
	}

	public void setToken(int token) {
		this.token = token;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	
	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public int getCrc() {
		return crc;
	}

	public void setCrc(int crc) {
		this.crc = crc;
	}

	@Override
	public String toString() {
		return "ECGDataPacket [head=" + head + ", token=" + token + ", length="
				+ length + ", content=" + Arrays.toString(content) + ", crc="
				+ crc + "]";
	}
	
	

}
