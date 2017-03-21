package com.vesag.bt.beans;


//Data Structure for PulseOximeter Command
public class PulseOximeterCommand {

	private byte head1;

	private byte head2;
	
	private byte token;
	
	private byte length;
	
	private byte[] command;
	
	private byte crc;

	public byte getHead1() {
		return head1;
	}

	public void setHead1(byte head1) {
		this.head1 = head1;
	}

	public byte getHead2() {
		return head2;
	}

	public void setHead2(byte head2) {
		this.head2 = head2;
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

	public byte[] getCommand() {
		return command;
	}

	public void setCommand(byte[] command) {
		this.command = command;
	}

	public byte getCrc() {
		return crc;
	}

	public void setCrc(byte crc) {
		this.crc = crc;
	}
	
	
	

}
