package cn.it.shop.util;

import cn.it.shop.model.FileImage;

public interface FileUploadUtil {

	//3:实现文件上传功能，返回上传后的新的文件名
	public abstract String uploadFile(FileImage fileImage);

	public String[] getFileNameByPath();
}