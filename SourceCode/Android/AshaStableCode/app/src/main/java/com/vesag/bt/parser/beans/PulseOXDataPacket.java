package com.vesag.bt.parser.beans;

import java.util.Arrays;

public class PulseOXDataPacket {
	private int head1;

	private int head2;
	
	private int token;
	
	private int length;
	
	private byte [] content;
	
	private int crc;

	
	

	public int getHead1() {
		return head1;
	}

	public void setHead1(int head1) {
		this.head1 = head1;
	}

	public int getHead2() {
		return head2;
	}

	public void setHead2(int head2) {
		this.head2 = head2;
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
		return "DataPacket [token=" + token + ", length=" + length
				+ ", content=" + Arrays.toString(content) + ", crc=" + crc + "]";
	}


}
