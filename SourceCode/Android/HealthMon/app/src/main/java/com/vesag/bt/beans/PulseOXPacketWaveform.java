package com.vesag.bt.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

//POJO for Waveform type of PulseOximeter packet
public class PulseOXPacketWaveform implements ClinicalMonitorDeviceData, Serializable {
	
	
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
	private int data1PB;
	private int data2PB;
	private int data3PB;
	private int data4PB;
	private int data5PB;
	private int data1WF;
	private int data2WF;
	private int data3WF;
	private int data4WF;
	private int data5WF;
	private String crc;
	private int crcCheck;
	private List<String> contentList = new ArrayList<String>();
	private String timeStamp;

	public String getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}
	
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
	public int getData1PB() {
		return data1PB;
	}
	public void setData1PB(int data1pb) {
		data1PB = data1pb;
	}
	public int getData2PB() {
		return data2PB;
	}
	public void setData2PB(int data2pb) {
		data2PB = data2pb;
	}
	public int getData3PB() {
		return data3PB;
	}
	public void setData3PB(int data3pb) {
		data3PB = data3pb;
	}
	public int getData4PB() {
		return data4PB;
	}
	public void setData4PB(int data4pb) {
		data4PB = data4pb;
	}
	public int getData5PB() {
		return data5PB;
	}
	public void setData5PB(int data5pb) {
		data5PB = data5pb;
	}
	public int getData1WF() {
		return data1WF;
	}
	public void setData1WF(int data1wf) {
		data1WF = data1wf;
	}
	public int getData2WF() {
		return data2WF;
	}
	public void setData2WF(int data2wf) {
		data2WF = data2wf;
	}
	public int getData3WF() {
		return data3WF;
	}
	public void setData3WF(int data3wf) {
		data3WF = data3wf;
	}
	public int getData4WF() {
		return data4WF;
	}
	public void setData4WF(int data4wf) {
		data4WF = data4wf;
	}
	public int getData5WF() {
		return data5WF;
	}
	public void setData5WF(int data5wf) {
		data5WF = data5wf;
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
	@Override
	public String toString() {
		return "PulseOXPacketWaveform [packetId=" + packetId + ", deviceName="
				+ deviceName + ", packetType=" + packetType + ", type=" + type
				+ ", head1=" + head1 + ", head2=" + head2 + ", token=" + token
				+ ", length=" + length + ", dataType=" + dataType
				+ ", sendingRate=" + sendingRate + ", data1PB=" + data1PB
				+ ", data2PB=" + data2PB + ", data3PB=" + data3PB
				+ ", data4PB=" + data4PB + ", data5PB=" + data5PB
				+ ", data1WF=" + data1WF + ", data2WF=" + data2WF
				+ ", data3WF=" + data3WF + ", data4WF=" + data4WF
				+ ", data5WF=" + data5WF + ", crc=" + crc + ", crcCheck="
				+ crcCheck + ", contentList=" + contentList + "]";
	}
	
	

}
