package egovframework.market.cmmn.service.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtils {

	public static final String uploadPath = "/upload";
	
	private static Map<String, MediaType> mediaMap;
	
	static {
		mediaMap = new HashMap<>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String ext) {
		return mediaMap.get(ext.toUpperCase());
	}
	
	public static String uploadFile(MultipartFile file) throws IOException {
		String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		String dirName = getCurrentUploadPath(uploadPath);
		
		File target = new File(dirName, fileName);
		
		FileCopyUtils.copy(file.getBytes(), target);
		String ext = getFileExtension(fileName); /* mime-type을 위해 확장자명이 필요함 */
		
		String uploadedFileName = null;
		
		if (getMediaType(ext) != null) {
			uploadedFileName = makeThumbnail(uploadPath, dirName, fileName);
		} else {
			uploadedFileName = makeIcon(uploadPath, dirName, fileName);
		}
		
		return uploadedFileName;
	}

	private static String getCurrentUploadPath(String uploadPath) {
		// TODO Auto-generated method stub
		
		Calendar cal = Calendar.getInstance();
		
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
		
		return makeDir(uploadPath, "" + y, new DecimalFormat("00").format(m), new DecimalFormat("00").format(d));
	}
	
	private static String makeDir(String uploadPath, String... paths) {
		for (String path : paths) {
			uploadPath += File.separator + path;
			File tmpFile = new File(uploadPath);
			if (tmpFile.exists())
				continue;
			tmpFile.mkdirs();
		}
		
		return uploadPath;
	}
	
	public static String getFileExtension(String fileName) {
		return fileName.substring(fileName.lastIndexOf(".") + 1);
	}
	
	private static String makeThumbnail(String uploadPath, String dirName, String fileName) throws IOException {
		BufferedImage srcImg = ImageIO.read(new File(dirName, fileName));
		BufferedImage destImg = Scalr.resize(srcImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		String thumbnailName = dirName + File.separator + "s_" + fileName;
		String ext = getFileExtension(fileName);
		File newFile = new File(thumbnailName);
		ImageIO.write(destImg, ext.toUpperCase(), newFile);
		
		return thumbnailName.replace(File.separatorChar, '/');
		//return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	private static String makeIcon(String uploadPath, String dirName, String fileName) throws IOException {
		// TODO Auto-generated method stub
		String iconName = dirName + File.separator + fileName;
		return iconName.replace(File.separatorChar, '/');
		//return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
