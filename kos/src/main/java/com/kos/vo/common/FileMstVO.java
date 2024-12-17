package com.kos.vo.common;


public class FileMstVO extends BaseVO{
	
	private String fileCd;		//파일코드 ( 랜덤 20자리 )
	//private String fileUrl;	//파일 경로 /cupos/images/상점코드/apply/파일명
	
	private String originPath;	//원본이미지 저장 경로.	C:/cupos/images/상점코드/menu/origin/파일명
	private String applyPath;	//이미지 저장 경로.	C:/cupos/images/상점코드/menu/apply/파일명 
    private String filePath;	//디비저장시 :      /images/상점코드/menu/apply/파일명
	private String fileNm;		//파일명
	private String fileType;	//IMG, PDF, ...
	private String fileOrdr;	//순위
	private String originFileNm;	//원본 파일명
	
	
	public String getFileCd() {
		return fileCd;
	}
	public void setFileCd(String fileCd) {
		this.fileCd = fileCd;
	}
	public String getOriginPath() {
		return originPath;
	}
	public void setOriginPath(String originPath) {
		this.originPath = originPath;
	}
	public String getApplyPath() {
		return applyPath;
	}
	public void setApplyPath(String applyPath) {
		this.applyPath = applyPath;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileNm() {
		return fileNm;
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileOrdr() {
		return fileOrdr;
	}
	public void setFileOrdr(String fileOrdr) {
		this.fileOrdr = fileOrdr;
	}
	public String getOriginFileNm() {
		return originFileNm;
	}
	public void setOriginFileNm(String originFileNm) {
		this.originFileNm = originFileNm;
	}
	
	
}
