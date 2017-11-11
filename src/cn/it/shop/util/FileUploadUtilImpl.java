package cn.it.shop.util;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import cn.it.shop.model.FileImage;

@Component("fileUpload")
public class FileUploadUtilImpl implements FileUploadUtil {

	private String filePath = "c:/";
	
	private String bankPath = "" ;
	@Value("#{prop.basePath+prop.bankImage}")
	public void setBankPath(String bankPath) {
		System.out.println(bankPath+"--------------");
		this.bankPath = bankPath;
	}
	// 注入"值"  配置文件的加载存储到 applicationContext-public.xml 中
	@Value("#{prop.basePath+prop.filePath}")
	public void setFilePath(String filePath) {
		System.out.println("路径："+filePath);
		this.filePath = filePath;
	}

	//通过文件名获取扩展名
	private String getFileExt(String fileName){
		
		String ext = FilenameUtils.getExtension(fileName);
		return ext;
	}
	
	//2:生成UUID随机数，作为新的文件名
	private String newFileName(String fileName){
		String ext = getFileExt(fileName);
		
		return UUID.randomUUID().toString()+"."+ext;
	}
	
	//3:实现文件上传功能，返回上传后的新的文件名
	/* (non-Javadoc)
	 * @see cn.it.shop.util.FileUploadUtil#uploadFile(cn.it.shop.model.FileImage)
	 */
	@Override
	public String uploadFile(FileImage fileImage) {
		
		String pic = newFileName(fileImage.getFilename());
		try {
			FileUtil.copyFile(fileImage.getFile(), new File(filePath, pic));
			return pic;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}finally{
			
			fileImage.getFile().delete();
		}
		
	}

	@Override
	public String[] getFileNameByPath() {
		// TODO Auto-generated method stub
		System.out.println(bankPath);
		File file = new File(bankPath);
		
		return file.list(new FilenameFilter(){

					@Override
					public boolean accept(File dir, String name) {
						// TODO Auto-generated method stub
						
						return name.endsWith("gif");
					}
					
				});
	}
	
}
