package com.it.cf.admin.model;


import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import com.it.cf.common.SearchVO;
import com.it.cf.fdList.model.FundingListVO;
import com.it.cf.project.model.ProjectVO;
import com.it.cf.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@Repository
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{

   private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
   
   
   private final AdminDAO adminDao;

   @Override
   public int loginProc(String userid, String pwd) {
      int result=0;

      String dbPwd=adminDao.selectPwd(userid);
      if(dbPwd==null || dbPwd.isEmpty()) {
         result=AdminService.ID_NONE;
      }else {
         if(dbPwd.equals(pwd)) {
            result=AdminService.LOGIN_OK;
         }else {
            result=AdminService.PWD_DISAGREE;
         }
      }

      return result;
   }

   @Override
   public int insertAdmin(AdminVO vo) {
      return adminDao.insertAdmin(vo);
   }

   @Override
   public List<Map<String, Object>> selectPosition() {
      return adminDao.selectPosition();
   }

   @Override
   public List<UserVO> selectAllUser(SearchVO searchVo) {
      return adminDao.selectAllUser(searchVo);
   }

   @Override
   public int selectTotalRecord(SearchVO searchVo) {
      return adminDao.selectTotalRecord(searchVo);
   }

   @Override
   public int idDuplChk(String adminId) {
      return adminDao.idDuplChk(adminId);
   }

   @Override
   public AdminVO selectByUserid(String adminId) {
      return adminDao.selectByUserid(adminId);
   }

   @Override
   @Transactional
   public int deleteUserMulti(List<UserVO> list) {
      logger.info("deleteUserMulti list.size={}",list.size());
      int cnt=0;
      try {
         for(UserVO vo : list) {
            int userNo=vo.getUserNo();
            logger.info("deleteUserMulti userNo={}",userNo);
            if(userNo!=0) {  //체크한 회원만 삭제
               logger.info("deleteUserMulti, userNo={}",userNo);
               cnt=adminDao.deleteUser(userNo);
               logger.info("deleteUserMulti cnt={}",cnt);
            }
         }
      }catch(RuntimeException e) {
         e.printStackTrace();
         cnt=-1;
         TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
      }
      logger.info("cnt={}",cnt);
      return cnt;
   }

   @Override
   public List<AdminVO> selectAllAdmin(SearchVO searchVo) {
      return adminDao.selectAllAdmin(searchVo);
   }

   @Override
   public int selectTotalRecord2(SearchVO searchVo) {
      return adminDao.selectTotalRecord2(searchVo);
   }

   @Override
   @Transactional
   public int deleteAdminMulti(List<AdminVO> list) {
      logger.info("deleteAdminMulti list.size={}",list.size());
      int cnt=0;
      try {
         for(AdminVO vo : list) {
            int adminNo=vo.getAdminNo();
            logger.info("deleteAdminMulti adminNo={}",adminNo);
            if(adminNo!=0) {  //체크한 운영자만 삭제
               logger.info("deleteAdminMulti, adminNo={}",adminNo);
               cnt=adminDao.deleteAdmin(adminNo);
               logger.info("deleteAdminMulti cnt={}",cnt);
            }
         }
      }catch(RuntimeException e) {
         e.printStackTrace();
         cnt=-1;
         TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
      }
      logger.info("cnt={}",cnt);
      return cnt;
   }

   @Override
   public int checkPwd(String adminId, String adminPwd) {
      String dbPwd = adminDao.selectPwd(adminId);

      int result=0;
      if(adminPwd.equals(dbPwd)) {
         result= PWD_OK;
      }else {
         result= PWD_NO;
      }
      return result;
   }

   @Override
   public int updatePwd(AdminVO vo) {
      return adminDao.updatePwd(vo);
   }

   @Override
   public int getEnter(UserVO vo) {
      return adminDao.getEnter(vo);
   }

   @Override
   public int getGeneral(UserVO vo) {
      return adminDao.getGeneral(vo);
   }

   @Override
   public int getTotalUser(UserVO vo) {
      return adminDao.getTotalUser(vo);
   }

   @Override
   public int getTotalFunding(ProjectVO vo) {
      return adminDao.getTotalFunding(vo);
   }

   @Override
   public Map<String, Object> getMonthFunding() {
      return adminDao.getMonthFunding();
   }

   @Override
   public int getTotalWaitFunding(ProjectVO vo) {
      return adminDao.getTotalWaitFunding(vo);
   }

   @Override
   public Map<String, Object> getMonthWaitFunding() {
      return adminDao.getMonthWaitFunding();
   }

   @Override
   public int getTotalFundingComm(FundingListVO vo) {
      return adminDao.getTotalFundingComm(vo);
   }

   @Override
   public Map<String, Object> getMonthFundingComm() {
      return adminDao.getMonthFundingComm();
   }

   @Override
   public Map<String, Object> getCategoryFunding() {
      return adminDao.getCategoryFunding();
   }

   @Override
   public Map<String, Object> getFundingPercent() {
      return adminDao.getFundingPercent();
   }

   @Override
   public List<Map<String, Object>> getFundingTop5() {
      return adminDao.getFundingTop5();
   }

   @Override
   public void UserExcelDown(SearchVO searchVo, HttpServletResponse response) throws Exception {
      List<UserVO> memberList = adminDao.DownAllUser(searchVo);
      
      //엑셀 다운로드 시작
      Workbook workbook = new HSSFWorkbook();
      try {
         

         //sheet 생성
         Sheet sheet = workbook.createSheet("전체회원관리");

         //행,열,열번호
         Row row = null;
         Cell cell = null;
         int rowNo = 0;

         //테이블 헤더 스타일
         CellStyle headStyle = workbook.createCellStyle();

         //가는 경계선
         headStyle.setBorderTop(BorderStyle.THIN);
         headStyle.setBorderBottom(BorderStyle.THIN);
         headStyle.setBorderLeft(BorderStyle.THIN);
         headStyle.setBorderRight(BorderStyle.THIN);

         //배경 노란색
         headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
         headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

         //데이터용 경계 스타일 테두리만 지정
         CellStyle bodyStyle = workbook.createCellStyle();
         bodyStyle.setBorderTop(BorderStyle.THIN);
         bodyStyle.setBorderBottom(BorderStyle.THIN);
         bodyStyle.setBorderLeft(BorderStyle.THIN);
         bodyStyle.setBorderRight(BorderStyle.THIN);
         

         //헤더명 설정
         String[] headerArray = {"회원구분","사업자번호","이메일","이름","닉네임","가입일","우편번호","주소"};
         row = sheet.createRow(rowNo++);
         for(int i=0; i<headerArray.length;i++) {
            cell=row.createCell(i);
            cell.setCellStyle(headStyle);
            cell.setCellValue(headerArray[i]);
         }
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
         SimpleDateFormat sdf2 = new SimpleDateFormat("yyMMddHHmmss");
         Date time = new Date();
         String today = sdf2.format(time);
         
         for(UserVO excelData:memberList) {
            row=sheet.createRow(rowNo++);
            cell = row.createCell(0);
            cell.setCellStyle(bodyStyle);
            
            if(excelData.getUserFlag()==0) {
               cell.setCellValue("일반회원");
            }else {
               cell.setCellValue("기업회원");
            }
            
            cell=row.createCell(1);
            cell.setCellStyle(bodyStyle);
            if(excelData.getUserFlag()==0) {
               cell.setCellValue("-");
            }else {
               cell.setCellValue(excelData.getBusinessNo());
            }
            
            
            cell=row.createCell(2);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(excelData.getUserEmail());

            cell=row.createCell(3);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(excelData.getUserName());

            cell=row.createCell(4);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(excelData.getUserNickname());

            cell=row.createCell(5);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(sdf.format(excelData.getUserJoindate()));

            cell=row.createCell(6);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(excelData.getUserZipcode());

            cell=row.createCell(7);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(excelData.getUserAddress());
            
            sheet.setColumnWidth(1, 13*256);
            sheet.setColumnWidth(2, 30*256);
            sheet.setColumnWidth(5, 15*256);
            sheet.setColumnWidth(7, 15*256);
         }
         
         //컨텐츠 타입과 파일명 지정
         response.setContentType("application/vnd.ms-excel");
         response.setHeader("Content-Disposition", "attachment;filename="+java.net.URLEncoder.encode("전체회원목록("+today+").xls","UTF8"));

         //엑셀 출력
         workbook.write(response.getOutputStream());
         workbook.close();
         
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         
      }
   }

   @Override
   public void DownAllFunding(HttpServletResponse response) throws Exception {
      List<Map<Object, Object>> fundingList = adminDao.DownAllFunding();
      
      logger.info("fundingList={}"+fundingList);
      //엑셀 다운로드 시작
      Workbook workbook = new HSSFWorkbook();
      try {
         

         //sheet 생성
         Sheet sheet = workbook.createSheet("전체펀딩조회");

         //행,열,열번호
         Row row = null;
         Cell cell = null;
         int rowNo = 0;

         //테이블 헤더 스타일
         CellStyle headStyle = workbook.createCellStyle();

         //가는 경계선
         headStyle.setBorderTop(BorderStyle.THIN);
         headStyle.setBorderBottom(BorderStyle.THIN);
         headStyle.setBorderLeft(BorderStyle.THIN);
         headStyle.setBorderRight(BorderStyle.THIN);

         //배경 노란색
         headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
         headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

         //데이터용 경계 스타일 테두리만 지정
         CellStyle bodyStyle = workbook.createCellStyle();
         bodyStyle.setBorderTop(BorderStyle.THIN);
         bodyStyle.setBorderBottom(BorderStyle.THIN);
         bodyStyle.setBorderLeft(BorderStyle.THIN);
         bodyStyle.setBorderRight(BorderStyle.THIN);
         

         //헤더명 설정
         String[] headerArray = {"카테고리","펀딩명","시작일","종료일","목표금액","모금액","등록자","이메일"};
         row = sheet.createRow(rowNo++);
         for(int i=0; i<headerArray.length;i++) {
            cell=row.createCell(i);
            cell.setCellStyle(headStyle);
            cell.setCellValue(headerArray[i]);
         }
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
         SimpleDateFormat sdf2 = new SimpleDateFormat("yyMMddHHmmss");
         Date time = new Date();
         String today = sdf2.format(time);
         DecimalFormat df = new DecimalFormat("###,###,###,###");
         
         for(Map<Object, Object> excelData:fundingList) {
            row=sheet.createRow(rowNo++);
            cell = row.createCell(0);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue((String) excelData.get("ONE"));

            
            cell=row.createCell(1);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue((String) excelData.get("TWO"));

            cell=row.createCell(2);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(sdf.format((Timestamp) excelData.get("THREE")));

            cell=row.createCell(3);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(sdf.format((Timestamp) excelData.get("FOUR")));

            cell=row.createCell(4);
            cell.setCellStyle(bodyStyle);
            int int1 = Integer.parseInt(String.valueOf(excelData.get("FIVE")));
            cell.setCellValue(df.format(int1)+"원");

            cell=row.createCell(5);
            cell.setCellStyle(bodyStyle);
            int int2 = Integer.parseInt(String.valueOf(excelData.get("SIX")));
            cell.setCellValue(df.format(int2)+"원");

            cell=row.createCell(6);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue((String) excelData.get("SEVEN"));

            cell=row.createCell(7);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue((String) excelData.get("EIGHT"));
            
            sheet.setColumnWidth(1, 25*256);
            sheet.setColumnWidth(2, 12*256);
            sheet.setColumnWidth(3, 12*256);
            sheet.setColumnWidth(4, 15*256);
            sheet.setColumnWidth(5, 15*256);
            sheet.setColumnWidth(7, 25*256);
         }
         
         //컨텐츠 타입과 파일명 지정
         response.setContentType("application/vnd.ms-excel");
         response.setHeader("Content-Disposition", "attachment;filename="+java.net.URLEncoder.encode("전체펀딩목록("+today+").xls","UTF8"));

         //엑셀 출력
         workbook.write(response.getOutputStream());
         workbook.close();
         
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         
      }
   }
}