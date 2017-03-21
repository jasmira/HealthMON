package com.vesag.bt.parser.beans;

import java.util.Arrays;


//Data Structure for SCP-ECG section 9 table
public class ECGSCPSec9 {
	
	private byte[] crc;
	
	private byte[] sectionId;
	
	private byte[] sectionLength;
	
	private byte sectionVersion;
	
	private byte protocolVersion;
	
	private byte[] reservedBits;
	
	private byte tagNumber1;
	
	private byte[] contentLength1;
	
	private byte[] content1;
	
	private byte tagNumber2;
	
	private byte[] contentLength2;
	
	private byte[] content2;
	
	private byte tagNumber3;
	
	private byte[] contentLength3;
	
	private byte[] content3;
	
	private byte tagNumber4;
	
	private byte[] contentLength4;
	
	private byte[] content4;
	
	private byte tagNumber5;
	
	private byte[] contentLength5;
	
	private byte[] content5;
	
	private byte tagNumber6;
	
	private byte[] contentLength6;
	
	private byte[] content6;
	
	private byte tagNumber7;
	
	private byte[] contentLength7;
	
	private byte[] content7;
	
	private byte tagNumber8;
	
	private byte[] contentLength8;
	
	private byte[] content8;
	
	private byte[] analysisDetails;

	
/*
	public byte[] getAnalysisDetails() {
		return analysisDetails;
	}

	public void setAnalysisDetails(byte[] analysisDetails) {
		this.analysisDetails = analysisDetails;
	}
	
	*/

	@Override
	public String toString() {
		return "ECGSCPSec9 [crc=" +  Arrays.toString(crc) + ", sectionId=" +  Arrays.toString(sectionId)
				+ ", length=" +  Arrays.toString(sectionLength) + ", sectionVersion= 0x" + String.format("%02X", sectionVersion)
				+ ", protocolVersion= 0x" + String.format("%02X", protocolVersion) + ", reservedBits="
				+ Arrays.toString(reservedBits) + ", tagNumber1="
				+ tagNumber1 + ", contentLength1=" +  Arrays.toString(contentLength1)
				+ ", content1=" + Arrays.toString(content1) + ", tagNumber2="
				+ tagNumber2 + ", contentLength2=" +  Arrays.toString(contentLength2)
				+ ", content2=" + Arrays.toString(content2) + ", tagNumber3="
				+ tagNumber3 + ", contentLength3=" +  Arrays.toString(contentLength3)
				+ ", content3=" + Arrays.toString(content3) + ", tagNumber4="
				+ tagNumber4 + ", contentLength4=" +  Arrays.toString(contentLength4)
				+ ", content4=" + Arrays.toString(content4) + ", tagNumber5="
				+ tagNumber5 + ", contentLength5=" +  Arrays.toString(contentLength5)
				+ ", content5=" + Arrays.toString(content5) + ", tagNumber6="
				+ tagNumber6 + ", contentLength6=" +  Arrays.toString(contentLength6)
				+ ", content6=" + Arrays.toString(content6) + ", tagNumber7="
				+ tagNumber7 + ", contentLength7=" +  Arrays.toString(contentLength7)
				+ ", content7=" + Arrays.toString(content7) + ", tagNumber8="
				+ tagNumber8 + ", contentLength8=" +  Arrays.toString(contentLength8)
				+ ", content8=" + Arrays.toString(content8)
				+ ", analysisDetails=" + Arrays.toString(analysisDetails) + "]";
	}


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


	public byte getTagNumber1() {
		return tagNumber1;
	}


	public void setTagNumber1(byte tagNumber1) {
		this.tagNumber1 = tagNumber1;
	}


	public byte[] getContentLength1() {
		return contentLength1;
	}


	public void setContentLength1(byte[] contentLength1) {
		this.contentLength1 = contentLength1;
	}


	public byte[] getContent1() {
		return content1;
	}


	public void setContent1(byte[] content1) {
		this.content1 = content1;
	}


	public byte getTagNumber2() {
		return tagNumber2;
	}


	public void setTagNumber2(byte tagNumber2) {
		this.tagNumber2 = tagNumber2;
	}


	public byte[] getContentLength2() {
		return contentLength2;
	}


	public void setContentLength2(byte[] contentLength2) {
		this.contentLength2 = contentLength2;
	}


	public byte[] getContent2() {
		return content2;
	}


	public void setContent2(byte[] content2) {
		this.content2 = content2;
	}


	public byte getTagNumber3() {
		return tagNumber3;
	}


	public void setTagNumber3(byte tagNumber3) {
		this.tagNumber3 = tagNumber3;
	}


	public byte[] getContentLength3() {
		return contentLength3;
	}


	public void setContentLength3(byte[] contentLength3) {
		this.contentLength3 = contentLength3;
	}


	public byte[] getContent3() {
		return content3;
	}


	public void setContent3(byte[] content3) {
		this.content3 = content3;
	}


	public byte getTagNumber4() {
		return tagNumber4;
	}


	public void setTagNumber4(byte tagNumber4) {
		this.tagNumber4 = tagNumber4;
	}


	public byte[] getContentLength4() {
		return contentLength4;
	}


	public void setContentLength4(byte[] contentLength4) {
		this.contentLength4 = contentLength4;
	}


	public byte[] getContent4() {
		return content4;
	}


	public void setContent4(byte[] content4) {
		this.content4 = content4;
	}


	public byte getTagNumber5() {
		return tagNumber5;
	}


	public void setTagNumber5(byte tagNumber5) {
		this.tagNumber5 = tagNumber5;
	}


	public byte[] getContentLength5() {
		return contentLength5;
	}


	public void setContentLength5(byte[] contentLength5) {
		this.contentLength5 = contentLength5;
	}


	public byte[] getContent5() {
		return content5;
	}


	public void setContent5(byte[] content5) {
		this.content5 = content5;
	}


	public byte getTagNumber6() {
		return tagNumber6;
	}


	public void setTagNumber6(byte tagNumber6) {
		this.tagNumber6 = tagNumber6;
	}


	public byte[] getContentLength6() {
		return contentLength6;
	}


	public void setContentLength6(byte[] contentLength6) {
		this.contentLength6 = contentLength6;
	}


	public byte[] getContent6() {
		return content6;
	}


	public void setContent6(byte[] content6) {
		this.content6 = content6;
	}


	public byte getTagNumber7() {
		return tagNumber7;
	}


	public void setTagNumber7(byte tagNumber7) {
		this.tagNumber7 = tagNumber7;
	}


	public byte[] getContentLength7() {
		return contentLength7;
	}


	public void setContentLength7(byte[] contentLength7) {
		this.contentLength7 = contentLength7;
	}


	public byte[] getContent7() {
		return content7;
	}


	public void setContent7(byte[] content7) {
		this.content7 = content7;
	}


	public byte getTagNumber8() {
		return tagNumber8;
	}


	public void setTagNumber8(byte tagNumber8) {
		this.tagNumber8 = tagNumber8;
	}


	public byte[] getContentLength8() {
		return contentLength8;
	}


	public void setContentLength8(byte[] contentLength8) {
		this.contentLength8 = contentLength8;
	}


	public byte[] getContent8() {
		return content8;
	}


	public void setContent8(byte[] content8) {
		this.content8 = content8;
	}


	public byte[] getAnalysisDetails() {
		return analysisDetails;
	}


	public void setAnalysisDetails(byte[] analysisDetails) {
		this.analysisDetails = analysisDetails;
	}
	

}
