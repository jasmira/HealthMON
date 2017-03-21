package com.vesag.bt.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

//POJO for Parameter type of PulseOximeter packet
public class PulseOXPacketParameter implements Serializable {

	@Override
	public String toString() {
		return (" sp02= " + spO2 + " pulseRate = " + pulseRate + " perfusion Index = " + perfusionIndex + " status1 = " + status1 + " status2 =" + status2 + " dateTime ="+ dateTime);
	}
	
	
	private int packetId;
	private String deviceName;
	private String packetType;
	private String type;
	private String head1;
	private String head2;
	private String token;
	private int length;
	private String dataType;
	private int sendingRate;
	private String crc;
	private int crcCheck;
	private List<String> contentList = new ArrayList<String>();
	private int spO2;
	private int pulseRate;
	private int perfusionIndex;
	private int status1;
	private int status2;
	private String dateTime;
	
	public int getPacketId() {
		return packetId;
	}
	public void setPacketId(int packetId) {
		this.packetId = packetId;
	}
	public String getDeviceName() {
		return deviceName;
	}
	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
	public String getPacketType() {
		return packetType;
	}
	public void setPacketType(String packetType) {
		this.packetType = packetType;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getHead1() {
		return head1;
	}
	public void setHead1(String head1) {
		this.head1 = head1;
	}
	public String getHead2() {
		return head2;
	}
	public void setHead2(String head2) {
		this.head2 = head2;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public int getSendingRate() {
		return sendingRate;
	}
	public void setSendingRate(int sendingRate) {
		this.sendingRate = sendingRate;
	}
	public String getCrc() {
		return crc;
	}
	public void setCrc(String crc) {
		this.crc = crc;
	}
	public int getCrcCheck() {
		return crcCheck;
	}
	public void setCrcCheck(int crcCheck) {
		this.crcCheck = crcCheck;
	}
	public List<String> getContentList() {
		return contentList;
	}
	public void setContentList(List<String> contentList) {
		this.contentList = contentList;
	}
	public int getSpO2() {
		return spO2;
	}
	public void setSpO2(int spO2) {
		this.spO2 = spO2;
	}
	public int getPulseRate() {
		return pulseRate;
	}
	public void setPulseRate(int pulseRate) {
		this.pulseRate = pulseRate;
	}
	public int getPerfusionIndex() {
		return perfusionIndex;
	}
	public void setPerfusionIndex(int perfusionIndex) {
		this.perfusionIndex = perfusionIndex;
	}
	public int getStatus1() {
		return status1;
	}
	public void setStatus1(int status1) {
		this.status1 = status1;
	}
	public int getStatus2() {
		return status2;
	}
	public void setStatus2(int status2) {
		this.status2 = status2;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	
}
