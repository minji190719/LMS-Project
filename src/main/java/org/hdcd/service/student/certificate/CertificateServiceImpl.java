package org.hdcd.service.student.certificate;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.mapper.CertificateMapper;
import org.hdcd.vo.CertificateHisVO;
import org.hdcd.vo.CertificateVO;
import org.springframework.stereotype.Service;

import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.html2pdf.resolver.font.DefaultFontProvider;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.IBlockElement;
import com.itextpdf.layout.element.IElement;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.font.FontProvider;
import com.itextpdf.layout.property.Background;
import com.itextpdf.tool.xml.css.apply.ImageCssApplier;

import android.graphics.Color;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CertificateServiceImpl implements CertificateService{
	
	@Inject
	CertificateMapper certificateMapper;

	@Override
	public List<CertificateVO> getCertificateList() {
		// TODO Auto-generated method stub
		return certificateMapper.getCertificateList();
	}

	@Override
	public Map<String, Object> memberInfo(String userSession) {
		// TODO Auto-generated method stub
		return certificateMapper.memberInfo(userSession);
	}

	@Override
	public String certificateApply(CertificateHisVO certificateHisVO, HttpServletRequest req) throws Exception {
		certificateMapper.certificateApply(certificateHisVO);
		
		String crtfh_code = certificateHisVO.getCrtfh_code();
		log.info("==================== insert후 Certificate PK ====================: {}", crtfh_code);
		
		CertificateHisVO selectOnecertificateHisVO = certificateMapper.getCertificateHis(crtfh_code);
		
		// log.info("인서트 후 가져온 certificateHisVO : {}", selectOnecertificateHisVO);
		
		String userId = (String)req.getSession().getAttribute("userId");
		
		Map<String, Object> pdfInfo = certificateMapper.insertPOFInfo(userId);
		
		if(selectOnecertificateHisVO != null && pdfInfo != null) {
			return createHTML(selectOnecertificateHisVO, req, pdfInfo);
		}
		
		return "NG";
		
	}

	@Override
	public List<CertificateHisVO> getCertificateHisList(String userSession) {
		// TODO Auto-generated method stub
		return certificateMapper.getCertificateHisList(userSession);
	}
	
	private String createHTML(CertificateHisVO selectOnecertificateHisVO, HttpServletRequest req, Map<String, Object> pdfInfo) throws Exception {
		StringBuilder body = new StringBuilder();
		 
		String realPath = req.getSession().getServletContext().getRealPath("resources/pdf");
		
		File pdfPath = new File(realPath);
		
		if(!pdfPath.exists()) {
			pdfPath.mkdirs();
		}
		
		String crtf_code = selectOnecertificateHisVO.getCrtf_code();
		
		String pdfName = "";
		
		String title = "";
		
		if(crtf_code.equals("5")) {
			pdfName = "certificate5-"+selectOnecertificateHisVO.getCrtfh_code();
			title = "재&nbsp;학&nbsp;증&nbsp;명&nbsp;서";
		}else if(crtf_code.equals("6")) {
			pdfName = "certificate6-"+selectOnecertificateHisVO.getCrtfh_code();
			title = "졸&nbsp;업&nbsp;증&nbsp;명&nbsp;서";
		}
		
//		String returnStr = realPath + pdfName;
		
		String selectOnecertificateHisVODate = selectOnecertificateHisVO.getCrtfh_date();
		
		log.info("@@@@@@@@@@@@selectOnecertificateHisVODate : {}", selectOnecertificateHisVODate);
		
		String crtfh_date = selectOnecertificateHisVODate.substring(0, selectOnecertificateHisVO.getCrtfh_date().indexOf(" "));
		
		log.info("----------crtfh_date : {}", crtfh_date);
		
		String crtfh_year = crtfh_date.substring(0,crtfh_date.indexOf("-"));
		log.info("----------crtfh_year : {}", crtfh_year);
		
		String crtfh_month = crtfh_date.substring(crtfh_date.indexOf("-") + 1, crtfh_date.lastIndexOf("-"));
		log.info("----------crtfh_month : {}", crtfh_month);
		
		String crtfh_day = crtfh_date.substring(crtfh_date.lastIndexOf("-") + 1);
		log.info("----------crtfh_day : {}", crtfh_day);
		
		String savePath = realPath + "/" +pdfName + ".pdf";
		
		String header = "<!DOCTYPE html>" + "<html lang='ko-KR'>" + "<head>" + "<titlet></title>"
		                + "	<meta charset='UTF-8'/>" + "	<meta name='description' content='Free Web tutorials'/>"
		                + "	<meta name='keywords' content='HTML,CSS,XML,JavaScript'/>"
		                + "	<meta name='viewport' content='width=device-width, initial-scale=1.0'/>"
		                + "	<meta http-equiv='X-UA-Compatible' content='IE=Edge'/>"
		                + "<script src='https://use.fontawesome.com/releases/v5.2.0/js/all.js'></script>" + "</head>";
		                
		String middle = "<body style='margin:auto; padding: 0;'>"
		                + "	<div class='logo' style='width: 780px;height: 40px;padding: 10px; margin: auto;'>"
		                + "		<a href='#' style='color: #000000;text-decoration: none;'><img src='img/logo.png' alt='로고'/></a>"
		                + "	</div>";

		String footer = "	<div class='footer' style='width: 780px;height: 60px;padding: 20px;text-align: center;font-size: 0.75em; margin: auto;'>"
		                + "	본 메일은 발신전용 입니다. 자세한 사항은 홈페이지를 확인해 주시기 바랍니다.	" + "	</div>" + "</body>" + "</html>";
		                
		body.append(header);
		body.append(middle);
		body.append(footer);
		
		String BODY = body.toString();

//		String HTML = "<!DOCTYPE html>"
//						+"<head>"
//					    +"<meta charset='UTF-8'>"
//					+"</head>"
		String HTML = "<!DOCTYPE html>" + "<html lang='ko-KR'>" + "<head>" + "<titlet></title>"
                + "	<meta charset='UTF-8'/>" + "	<meta name='description' content='Free Web tutorials'/>"
                + "	<meta name='keywords' content='HTML,CSS,XML,JavaScript'/>"
                + "	<meta name='viewport' content='width=device-width, initial-scale=1.0'/>"
                + "	<meta http-equiv='X-UA-Compatible' content='IE=Edge'/>"
                + "<script src='https://use.fontawesome.com/releases/v5.2.0/js/all.js'></script>" + "</head>"
					+"<style>"
					    +"tr,td{"
					        +"padding: 30px;"
					        +"}"
					+"</style>"
					+"<body>"
					+"    <div>"
					+"    <table>"
					+"        <thead>"
					+"            <tr style='font-weight: bold; font-size: 110%;'>"
					+"                <td>발급번호 : "+selectOnecertificateHisVO.getCrtfh_code()+"</td>"
					+"            </tr>"
					+"            <tr style='font-weight: bold; font-size: 200%;'>"
					+"                <td style='text-align: center;'>"+title+"</td>"
					+"            </tr>"
					+"        </thead>"
					+"        <tbody style='background: url(./KakaoTalk_20230127_212342187.png) no-repeat center;background-size: contain; opacity: 0.9; font-weight: bold;'>"
					+"            <tr style='font-size: 110%;'>"
					+"                <td>성명 : &nbsp;"+String.valueOf(pdfInfo.get("MEM_NAME"))+"</td>"
					+"            </tr>"
					+"            <tr style='font-size: 110%;'>"
					+"                <td>학번 : &nbsp;"+String.valueOf(pdfInfo.get("MEM_NO"))+"</td>"
					+"            </tr>"
					+"            <tr style='font-size: 110%;'>"
					+"                <td>대학 : &nbsp;"+String.valueOf(pdfInfo.get("COL_NAME"))+"</td>"
					+"            </tr>"
					+"            <tr style='font-size: 110%;'>"
					+"                <td>학과 : &nbsp;"+String.valueOf(pdfInfo.get("STU_DEP"))+"</td>"
					+"            </tr>"
					+"            <tr style='font-size: 110%;'>"
					+"                 <td>위 사람은 "+crtfh_year+"년 "+crtfh_month+"월 "+crtfh_day+"일 현재까지 제 "+String.valueOf(pdfInfo.get("STU_SCHYEAR"))+"학년에 재학하고 있음을 증명합니다</td>" 
					+"            </tr>"
					+"        </tbody>"
					+"        <tfoot>"
					+"            <tr style='text-align: center; font-weight: bold; font-size: 110%;'>"
					+"            <td>"+crtfh_year+"년&nbsp;"+crtfh_month+"월&nbsp;"+crtfh_day+"일</td> "
					+"            </tr>"
					+"            <tr style='text-align: center; font-weight: bold; font-size: 200%;'>"
					+"                <td style='background: url(./dojang.png) no-repeat; background-size: contain; background-position: 65%;'>한&nbsp;국&nbsp;대&nbsp;학&nbsp;교&nbsp; 학&nbsp;교&nbsp;장</td>" 
					+"            </tr>"
					+"        </tfoot>"
					+"    </table>  "
					+"</div>  "
					+"</body>"
					+"</html>";
		
		
		// html to pdf
		makepdf(HTML, savePath, realPath);
		
		return pdfName;
	}

	public void makepdf(String BODY, String dest, String realPath) throws Exception {
		//한국어를 표시하기 위해 폰트 적용 
	    String FONT = "c:/windows/fonts/malgun.ttf";
	    //ConverterProperties : htmlconverter의 property를 지정하는 메소드인듯
	    ConverterProperties properties = new ConverterProperties();
	    FontProvider fontProvider = new DefaultFontProvider(false, false, false);
	    FontProgram fontProgram = FontProgramFactory.createFont(FONT);
	    fontProvider.addFont(fontProgram);
	    properties.setFontProvider(fontProvider);
	    
	    Image image = new Image(ImageDataFactory.create(realPath + "/" + "KakaoTalk_20230127_212342187.png"));
	    Image image2 = new Image(ImageDataFactory.create(realPath + "/" + "dojang.png"));
	    
	    image.setHeight(600);
	    image.setWidth(450);
	    image.setOpacity(0.6f);
	    image.setFixedPosition(60f, 200);
	    
	    image2.setHeight(100);
	    image2.setWidth(100f);
	    image2.setOpacity(0.35f);
	    image2.setFixedPosition(375f, 160);
		//pdf 페이지 크기를 조정 
//		Document document = HtmlConverter.convertToPdf(BODY, new FileOutputStream(dest));
		
//	    PdfDocument pdf = new PdfDocument(new PdfWriter(dest));
//	    Document document = new Document(pdf);
	       
//	    	//setMargins 매개변수순서 : 상, 우, 하, 좌
//	        document.setMargins(50, 100, 50, 100);
//	        for (IElement element : elements) {
//	        	
//	            document.add((IBlockElement) element);
//	        }
//	        
//	        
//	        document.close();
	        
	        //pdf 페이지 크기를 조정 
	        List<IElement> elements = HtmlConverter.convertToElements(BODY, properties);
	        
	        PdfDocument pdf = new PdfDocument(new PdfWriter(dest));
	        Document document = new Document(pdf);
	        
	        
	        //setMargins 매개변수순서 : 상, 우, 하, 좌
	        document.setMargins(50, 100, 50, 100);
	        for (IElement element : elements) {
	        	document.add((IBlockElement) element);
	        }
	        document.add(image);
	        document.add(image2);
	        
	        document.close();
	}

}
