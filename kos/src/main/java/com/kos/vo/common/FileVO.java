package com.kos.vo.common;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;

public class FileVO extends FileMstVO {

	@JsonIgnore
	private MultipartFile file;
	
	private int width=600;
	private int height=600;
	private String position = "H";  // W:넓이중심, H:높이중심, X:설정한 수치로(비율무시)
	private String format="jpg";	//파일 유형
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	
	
}
