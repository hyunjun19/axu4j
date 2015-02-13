package com.axisj.axu4j;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.cop.bbs.service.*;
import egovframework.let.uat.uia.service.EgovLoginService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by HJ.Park on 2015-02-12.
 */
@Controller
public class AXU4JController {

    @Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;

    /** EgovLoginService */
    @Resource(name = "loginService")
    private EgovLoginService loginService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @RequestMapping("/login.do")
    public void login() { }

    @RequestMapping("/main.do")
    public void main() { }

    @RequestMapping("/list.do")
    public void list() { }

    @RequestMapping("/list-2.do")
    public void list2() { }

    @RequestMapping("/list.json")
    public void listJson(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

        boardVO.setBbsId(boardVO.getBbsId());
        boardVO.setBbsNm(boardVO.getBbsNm());

        BoardMasterVO vo = new BoardMasterVO();

        vo.setBbsId(boardVO.getBbsId());
        vo.setUniqId(user.getUniqId());

        boardVO.setPageUnit(propertyService.getInt("pageUnit"));
        boardVO.setPageSize(propertyService.getInt("pageSize"));

        PaginationInfo paginationInfo = new PaginationInfo();

        paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
        paginationInfo.setPageSize(boardVO.getPageSize());

        boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
        boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
        int totCnt = Integer.parseInt((String)map.get("resultCnt"));

        paginationInfo.setTotalRecordCount(totCnt);

        Map<String, Object> page = new HashMap<String, Object>();
        page.put("pageNo",    paginationInfo.getCurrentPageNo());
        page.put("pageCount", paginationInfo.getPageSize());
        page.put("listCount", map.get("resultCnt"));

        model.addAttribute("list", map.get("resultList"));
        model.addAttribute("page", page);
    }

    @RequestMapping("/view.do")
    public void view() { }

    @RequestMapping("/edit.do")
    public void edit() { }

    @RequestMapping("/edit.json")
    public void editJson(@ModelAttribute("searchVO") BoardVO boardVO
            , @ModelAttribute("bdMstr") BoardMaster bdMstr
            , @ModelAttribute("board") Board board
            , ModelMap model) throws Exception {
        Map<String, Object> rmap = new HashMap<String, Object>();
        rmap.put("isOK", false);
        model.put("result", rmap);

        // 사용자권한 처리
        if(!EgovUserDetailsHelper.isAuthenticated()) {
            rmap.put("message", egovMessageSource.getMessage("fail.common.login"));
            return;
        }

        LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        if (isAuthenticated) {
            board.setFrstRegisterId(user.getUniqId());
            board.setLastUpdusrId(user.getUniqId());
            board.setBbsId(board.getBbsId());

            board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
            board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
            board.setNttCn(board.getNttCn());	// XSS 방지

            BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

            if (vo == null || StringUtils.isBlank(vo.getBbsId())) {
                bbsMngService.insertBoardArticle(board);
            } else {
                bbsMngService.updateBoardArticle(board);
            }

            rmap.put("isOK", true);
        }
    }

    @RequestMapping("/delete.json")
    public void deleteBoardArticleJson(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board,
                                       @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws Exception {
        Map<String, Object> rmap = new HashMap<String, Object>();
        rmap.put("isOK", false);
        model.put("result", rmap);

        // 사용자권한 처리
        if(!EgovUserDetailsHelper.isAuthenticated()) {
            rmap.put("message", egovMessageSource.getMessage("fail.common.login"));
            return;
        }

        LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        if (isAuthenticated) {
            board.setLastUpdusrId(user.getUniqId());

            bbsMngService.deleteBoardArticle(board);

            rmap.put("isOK", true);
        }
    }


    /**
     * 로그인 화면으로 들어간다
     */
    @RequestMapping(value="/login.do")
    public void loginUsrView() { }

    /**
     * 일반 로그인을 처리한다
     * @param loginVO - 아이디, 비밀번호가 담긴 LoginVO
     * @param request - 세션처리를 위한 HttpServletRequest
     * @return result - 로그인결과(세션정보)
     * @exception Exception
     */
    @RequestMapping(value="/actionLogin.do")
    public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO,
                              HttpServletRequest request,
                              ModelMap model)
            throws Exception {


        // 1. 일반 로그인 처리
        LoginVO resultVO = loginService.actionLogin(loginVO);

        boolean loginPolicyYn = true;

        if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("") && loginPolicyYn) {

            request.getSession().setAttribute("LoginVO", resultVO);
            return "forward:/list.do";
        } else {

            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "login";
        }

    }

    /**
     * 로그아웃한다.
     * @return String
     * @exception Exception
     */
    @RequestMapping(value="/logout.do")
    public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

        RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);

        return "forward:/login.do";
    }

}
