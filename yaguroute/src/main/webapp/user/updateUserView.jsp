<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- saved from url=(0052)https://nid.naver.com/user2/help/myInfoV2?lang=ko_KR -->
<html lang="ko"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
<meta http-equiv="Cache-Control" content="post-check=0, pre-check=0">
<meta http-equiv="Pragma" content="No-Cache">
<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>   
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<title>야구ROUTE</title>

<script type="text/javascript" src="/js/user/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/account.min.css">
<link href="https://nid.naver.com/favicon_1024.png" rel="apple-touch-icon-precomposed" sizes="1024x1024">
<script type="text/javascript" src="/js/user/lcslog.js"></script>
<script type="text/javascript" src="/js/user/nclk_v0.8.1.js"></script>
<script type="text/javascript" src="/js/user/commonUtil.js"></script>
<script type="text/javascript" src="/js/user/lua.js"></script>
<script type="text/javascript" src="/js/user/agent_check.js"></script>
<meta name="decorator" content="NEW_USER_MYINFO_V2">
<style id="gnb_style" type="text/css">@charset "UTF-8";
/* NTS UIT Development Office YJH 140717 */
a.gnb_my, .gnb_icon, #gnb .gnb_my_interface, .gnb_my_li .gnb_my_content .gnb_membership, #gnb .gnb_ico_num .gnb_ico_new, #gnb .gnb_ico_num .gnb_ico_new .gnb_count, .gnb_lst .ico_arrow, a.gnb_my .filter_mask, .gnb_my_lyr, .gnb_my_li .gnb_my_content .gnb_mask, .gnb_my_li .gnb_my_content .gnb_edit_lst li, .gnb_notice_li .gnb_notice_lyr, .gnb_notice_li .svc_list .gnb_ico_mail, .gnb_notice_li .svc_list .gnb_btn_remove span, .gnb_notice_li .svc_list .gnb_btn_remove i, .gnb_notice_li .gnb_error .gnb_ico_error, .gnb_ly_alert .gnb_btn_close i, .gnb_first_visit, .gnb_search_box, .gnb_search_box .gnb_del_txt, .gnb_svc_more .gnb_svc_lstwrp li.gnb_event em.ic_gnb_new, .gnb_svc_more .svc_btnwrp button { background: url(https://ssl.pstatic.net/static/common/gnb/one/sp_gnb_v14.png) no-repeat -999px -999px;		background: url(https://ssl.pstatic.net/static/common/gnb/one/sp_gnb_v15.png?v=2006) no-repeat -999px -999px; /* background: url(../img/sp_gnb_v15.png) no-repeat -999px -999px; */}
.gnb_favorite_area, .gnb_search_area, .gnb_banner, .gnb_linkwrp{background:url(https://ssl.pstatic.net/static/common/gnb/2014/bg_svclyr2_v2.png) no-repeat -999px -999px}
#gnb .gnb_my_li .gnb_my_community a, .gnb_notice_li .gnb_notice_all, a.gnb_service_all, .gnb_svc_more .svc_btns{display:block;height:38px;border-top:1px solid #ebebeb;background-color:#f8f8f8;text-align:center;font-weight:bold;text-decoration:none;letter-spacing:-1px;line-height:38px}
#gnb .gnb_my_li .gnb_my_community a:visited, .gnb_notice_li .gnb_notice_all:visited, a.gnb_service_all:visited, .gnb_svc_more .svc_btns:visited{color:#444}
.gnb_login_li, .gnb_my_li, .gnb_notice_li, .mail_li, .gnb_service_li{float:left;margin-right:2px;overflow:visible}
.gnb_login_li a, .gnb_my_li a, .gnb_notice_li a, .mail_li a, .gnb_service_li a{position:relative;z-index:100}
a.gnb_my, .gnb_icon{position:relative}
#gnb{position:relative;z-index:2147483646;font-family:'나눔고딕',NanumGothic,'돋움',Dotum,'Apple SD Gothic Neo',Helvetica,Sans-serif !important;color:#444;font-size:12px;letter-spacing:0 !important;line-height:normal !important;text-align:left !important}
#gnb div, #gnb p, #gnb span, #gnb em, #gnb strong, #gnb h1, #gnb h2, #gnb h3, #gnb h4, #gnb h5, #gnb h6, #gnb ul, #gnb ol, #gnb li, #gnb dl, #gnb dt, #gnb dd, #gnb table, #gnb th, #gnb td, #gnb form, #gnb fieldset, #gnb legend, #gnb input, #gnb textarea, #gnb button, #gnb label{font-family:'나눔고딕',NanumGothic,'돋움',Dotum,'Apple SD Gothic Neo',Helvetica,Sans-serif !important}
#gnb a, #gnb label, #gnb button{cursor:pointer}
#gnb a, #gnb a:visited, #gnb a:active, #gnb a:focus{color:#444}
#gnb a:hover{color:#444;text-decoration:underline;vertical-align: baseline;}
#gnb input::-ms-clear{display:none}
#gnb em{font-style:normal}
#gnb ul{list-style:none}
#gnb .blind{display:block;overflow:hidden;position:absolute;top:-1000em;left:0;width:1px;height:1px;margin:0;padding:0;font-size:0;line-height:0}
#gnb .gnb_my_membership{padding: 0;display: block;width: 64px;height: 16px;background: url(https://ssl.pstatic.net/static/common/gnb/one/ico_gnb_membership.png) no-repeat; background-size: 64px 16px;margin: 0;}
#gnb .gnb_my_interface{padding:5px;position:absolute;top:12px;right:8px;display:block;width:17px;height:16px;background-position:-90px 5px}
#gnb .gnb_my_interface:hover{background-position:-90px -20px}
#gnb .gnb_my_interface:focus{background-position:-90px -20px}
#gnb .gnb_pad_lyr{position:absolute}
#gnb .gnb_ico_num{display:block;position:absolute;top:1px;width:40px;text-align:center}
#gnb .gnb_ico_num .gnb_ico_new{height:15px;display:inline-block;background-position: -331px 0;zoom:1}
#gnb .gnb_ico_num .gnb_ico_new .gnb_count{position:relative;top:0;right:-5px;height:15px;margin:0;padding:0 4px 0 1px;display:inline-block;*display:inline;vertical-align:top;background-position: 100% 0;text-indent:-2px;font-family:tahoma !important;font-weight:bold;color:#fff;zoom:1}
#gnb .gnb_ico_num .gnb_ico_new .plus{margin:1px -1px 0 2px;font-size:8px;display:inline-block;color:#fff;vertical-align:top}
:root #gnb .gnb_pad_lyr{opacity:1 !important;/* background:#fff */}
.gnb_lst{margin:0;padding:0;zoom:1}
.gnb_lst:after{display:block;clear:both;content:''}
.gnb_lst ul{margin:0;padding:0}
.gnb_lst .ico_arrow{display:none;position:absolute;left:50%;top:27px;width:10px;height:8px;margin-left:-5px;background-position:-175px -10px}
.gnb_lyr_opened .gnb_my_lyr, .gnb_lyr_opened .gnb_service_lyr, .gnb_lyr_opened .gnb_notice_lyr, .gnb_lyr_opened .ico_arrow{display:block !important}
.gnb_login_li{height:23px;padding:5px 7px 0 0}
.gnb_btn_login, .gnb_bg, .gnb_bdr{display:inline-block;width:46px;height:20px;font-size:12px}
.gnb_btn_login{position:relative}
.gnb_bg{background-color: #fff;opacity: 0.05;filter: alpha(opacity=5);}
.gnb_bdr{position:absolute;top: -1px;left: -1px;width: 46px;height: 20px;border: 1px solid #000;opacity: 0.12;filter: alpha(opacity=12);}
.gnb_txt{position:absolute;top:0;left:0;width:45px;height:20px;padding-left:1px;line-height:21px;color:#666;text-align:center}
.gnb_btn_login:hover{text-decoration:none !important}
.gnb_account .gnb_btn_login{width:54px;margin:-1px 0 0 8px;vertical-align:top}
.gnb_account a.gnb_btn_login .gnb_txt {padding-left: 0;}
.gnb_account .gnb_bdr{width:52px}
.gnb_account .gnb_txt{width:53px}
.gnb_my_li{margin-right:7px}
.gnb_my_namebox{padding:2px 9px 0 0;background-repeat:no-repeat;background-position:100% 50%;zoom:1}
.gnb_my_namebox:after{display:block;clear:both;content:''}
a.gnb_my{float:left;display:block;font-size:12px;vertical-align:middle}
a.gnb_my .filter_mask {position: absolute; top: -1px; left: -1px; z-index: 1; width: 28px; height: 28px; background-position: -260px -60px;}
a.gnb_my img{vertical-align:top;border-radius:16px}
a.gnb_my .gnb_name{margin-right:-1px;padding-left:5px;display:inline-block;height:28px;line-height:28px;vertical-align:top;font-size:11px;color:#444}
a.gnb_my:visited{color:#444}
a.gnb_my:hover, a.gnb_my:active, a.gnb_my:visited, a.gnb_my:focus{text-decoration:none !important}
a.gnb_my:hover .gnb_name{text-decoration:underline}
a.gnb_my .ico_arrow{top:25px;margin-left:8px}
.gnb_my_namebox a.gnb_emp{float:left;display:inline-block;height:28px;margin-left:3px;line-height:28px;font-size:11px;color:#777 !important}
.gnb_my_lyr{display:none;position:absolute;top:26px;right:-8px;padding:9px 5px 4px 4px;width:316px;height:155px;background-position:-2px -1310px;z-index:10}
.gnb_my_lyr.gnb_groupid{height:144px;background-position:-2px -1500px}
.gnb_my_lyr.gnb_groupid .gnb_my_content{height:80px}
.gnb_my_lyr.gnb_groupid.gnb_longid1{height:144px;/*background-position:-2px -1664px*/}
.gnb_my_lyr.gnb_groupid.gnb_longid2{height:144px;background-position:-2px -1828px}
.gnb_my_lyr.gnb_longid1{/*width:318px;*/ /*background-position:-2px -1118px;*/}
.gnb_my_lyr.gnb_longid2{width:348px;background-position:-2px -926px}
.gnb_my_li .gnb_my_content{zoom:1;height:91px;padding:15px 0 10px 15px}
.gnb_my_li .gnb_my_content:after{display:block;clear:both;content:''}
.gnb_my_li .gnb_my_content .gnb_img_area{float:left;position:relative;display:block;width:80px;margin: 1px 0 0 1px;}
.gnb_my_li .gnb_my_content .gnb_img_area img{vertical-align:top}
.gnb_my_li .gnb_my_content .gnb_mask{position:absolute;top:0;left:0;display:block;width:80px;height:80px;background-position:-70px -60px}
.gnb_my_li .gnb_my_content .gnb_change{position:absolute;bottom:-2px;left:-2px;display:block;width:28px;height:28px;background: url(https://ssl.pstatic.net/static/common/gnb/one/ico_gnb_change.png) no-repeat !important; background-size: 28px 28px !important;}
.gnb_my_li .gnb_my_content .gnb_change:hover{background-image: url(https://ssl.pstatic.net/static/common/gnb/one/ico_gnb_change_hover.png) !important;}
.gnb_my_li .gnb_my_content .gnb_txt_area{float:left;width:210px;margin:0 0 0 10px}
.gnb_longid1 .gnb_my_content .gnb_txt_area{/* width:210px; */}
.gnb_longid2 .gnb_my_content .gnb_txt_area{width:235px}
.gnb_my_li .gnb_my_content .gnb_account{margin-bottom:3px 0 1px;font-size:0}
.gnb_my_li .gnb_my_content .gnb_name{color:#666;font-size:14px;vertical-align: top}
.gnb_my_li .gnb_my_content .gnb_name a{display:inline-block;vertical-align:top;font-weight:bold;color:#222 !important}
.gnb_my_li .gnb_my_content a.gnb_mail_address{margin-left:1px;font-family:tahoma;color:#666 !important;font-size:12px}
.gnb_my_li .gnb_my_content .gnb_edit_lst{zoom:1;margin-top:7px !important}
.gnb_my_li .gnb_my_content .gnb_edit_lst:after{display:block;clear:both;content:''}
.gnb_my_li .gnb_my_content .gnb_edit_lst li{float:left;padding-left:6px;margin-left:5px;background-position:-290px -25px}
.gnb_my_li .gnb_my_content .gnb_edit_lst li.gnb_info{padding-left:0;margin-left:0;background:none}
.gnb_my_li .gnb_my_content .gnb_edit_lst a{color:#666 !important;letter-spacing:-1px}
.gnb_my_li .gnb_my_content .gnb_membership {display: inline-block;margin-right: 5px;margin-left: 1px;padding-right: 8px;background-position: -287px -403px;}
.gnb_my_li .gnb_my_content .gnb_pay_check{height:16px;margin:7px -4px 0 0 !important}
@media screen and (min-width: 0\0) { .gnb_my_li .gnb_my_content .gnb_pay_check{margin-top:17px} }
.gnb_my_li .gnb_my_content .gnb_pay_check em{display:inline-block;width:16px;height:16px;background: url(https://ssl.pstatic.net/static/common/gnb/one/ico_gnb_pay_check.png) no-repeat !important; background-size: 16px 16px !important;margin:0 4px 0 0;overflow:hidden;font-size:0;line-height:0;vertical-align:top}
.gnb_my_li .gnb_my_content .gnb_pay_check a{font-size:14px;letter-spacing:-1px;line-height:16px;vertical-align:top}
.gnb_my_li .gnb_my_content .gnb_pay_check span{font-weight: bold;}
.gnb_my_li .gnb_my_content .gnb_pay_check strong{font-family:tahoma;letter-spacing:0;vertical-align:top;}
.gnb_my_li .gnb_my_content .gnb_pay_check a, .gnb_my_li .gnb_my_content .gnb_pay_check span, .gnb_my_li .gnb_my_content .gnb_pay_check strong{font-size:12px;color:#222 !important}
#gnb .gnb_my_li .gnb_my_community{clear:both;zoom:1}
#gnb .gnb_my_li .gnb_my_community:after{display:block;clear:both;content:''}
#gnb .gnb_my_li .gnb_my_community a{float:left;width:106px;margin-right: 0;border-right:1px solid #ebebeb}
#gnb .gnb_my_li .gnb_my_community a.gnb_pay{width:102px;border-right:0;line-height:0}
#gnb .gnb_my_li .gnb_my_community a.gnb_pay span{display:inline-block;width:41px;height:16px;background: url(https://ssl.pstatic.net/static/common/gnb/one/ico_gnb_pay.png) no-repeat !important; background-size: 41px 16px !important;margin:11px auto 0;font-size:0;line-height:0}
#gnb .gnb_my_li .gnb_my_community a.gnb_pay i {display: inline-block;width: 61px;height: 20px;margin: 9px auto 0;background: url(https://ssl.pstatic.net/static/common/gnb/banner/promo_membership.png) no-repeat !important;background-size: 61px 20px !important;font-size: 0;line-height: 0;}
#gnb .gnb_my_li .gnb_my_community a:active, #gnb .gnb_my_li .gnb_my_community a:focus, #gnb .gnb_my_li .gnb_my_community a:visited{text-decoration:none !important}
#gnb .gnb_my_li .gnb_my_community a:hover{text-decoration:underline !important}
#gnb .gnb_my_lyr.gnb_longid1 .gnb_my_community a{/*width:105px;*/}
#gnb .gnb_my_lyr.gnb_longid1 .gnb_my_community a.gnb_pay{/* width:106px;*/}
#gnb .gnb_my_lyr.gnb_longid2 .gnb_my_community a{width:115px}
#gnb .gnb_my_lyr.gnb_longid2 .gnb_my_community a.gnb_pay{width:116px}
#gnb.gnb_one .gnb_my_community a, #gnb.gnb_one_small .gnb_my_community a{margin-right: 0 !important;}
.gnb_notice_li a.gnb_notice{display:block;width:15px;height:17px;padding:7px 9px 4px;text-decoration:none !important}
.gnb_notice_li a.gnb_notice .gnb_ico_num{left:1px;top:0}
.gnb_notice_li a.gnb_notice .gnb_icon{display:block;width:15px;height:17px;background-position:-3px -60px}
.gnb_notice_li a.gnb_notice:hover .gnb_icon{background-position:-38px -60px;text-decoration:none !important}
.gnb_notice_li .gnb_notice_lyr{display:none;position:absolute;top:26px;right:-7px;width:297px;height:330px;padding:9px 4px 4px;background-position:-2px -584px;z-index:10;overflow:hidden}
.gnb_notice_li .svc_scroll{height:291px;overflow:scroll;overflow-x:hidden;position:relative;zoom:1}
.gnb_notice_li .svc_panel{width:100%;height:330px;overflow:hidden}
.gnb_notice_li .svc_head{position:relative;height:36px;padding-left:15px;line-height:20px;border-bottom:1px solid #eaeaea;zoom:1}
.gnb_notice_li .svc_head .gnb_tit{color:#6b6d70;margin-right:1px;line-height:36px}
.gnb_notice_li .svc_head .task_right{position:absolute;right:8px;top:8px;font-size:0}
.gnb_notice_li .svc_head .task_right button{height:20px;padding:0 6px;margin-left:4px;border:1px solid #ddd;color:#888;background-color:#fff;font-family:'나눔고딕', NanumGothic;font-size:12px;letter-spacing:-1px;line-height:18px;*line-height:16px;overflow:visible}
.gnb_notice_li .svc_list .gnb_btn_remove i, .gnb_notice_li .svc_list .gnb_btn_remove span, .gnb_notice_li .svc_noti .gnb_ico_mail, .gnb_notice_li .svc_blank .svc_msg_box, .gnb_notice_li .svc_blank .gnb_v_guide{display:inline-block;*display:inline;*zoom:1}
.gnb_notice_li .svc_list{margin-top:-1px}
.gnb_notice_li .svc_list li{position:relative;padding:7px 34px 7px 15px;border-top:1px solid #eaeaea;line-height:18px}
.gnb_notice_li .svc_list .gnb_new{background:#ffffd8}
.gnb_notice_li .svc_list .gnb_unread .gnb_subject{color:#444}
.gnb_notice_li .svc_list .gnb_unread .d_cnt{color:#ff630e}
.gnb_notice_li .svc_list .gnb_unread a:hover .gnb_subject, .gnb_notice_li .svc_list .gnb_unread .gnb_unread a:hover .d_cnt{color:#390}
.gnb_notice_li .svc_list .gnb_unread .svc_name{color:#444}
.gnb_notice_li .svc_list a.gnb_list_cover{text-decoration:none !important;display:block;position:relative;zoom:1}
.gnb_notice_li .svc_list a:hover .gnb_subject{text-decoration:underline}
.gnb_notice_li .svc_list .gnb_subject{overflow:hidden;text-overflow:ellipsis;white-space:nowrap;width:100%;color:#adadad}
.gnb_notice_li .svc_list .d_cnt{font-family:tahoma;font-size:10px}
.gnb_notice_li .svc_list .gnb_info{color:#adadad}
.gnb_notice_li .svc_list .svc_name{margin-right:3px;color:#adadad}
.gnb_notice_li .svc_list .cchr{margin-right:3px}
.gnb_notice_li .svc_list .dona{position:absolute;top:8px;right:34px;text-decoration:underline}
.gnb_notice_li .svc_list .dona a{color:#adadad}
.gnb_notice_li .svc_list .dona a:hover{color:#390}
.gnb_notice_li .svc_list .gnb_ico_mail{width:14px;height:15px;font-size:0;line-height:0;color:#fff;vertical-align:top}
.gnb_notice_li .svc_list .gnb_ico_mail.gnb_yes{background-position:-245px -17px}
.gnb_notice_li .svc_list .gnb_ico_mail.gnb_no{background-position:-245px 4px}
.gnb_notice_li .svc_list .gnb_btn_remove{position:absolute;right:4px;top:50%;z-index:100;margin-top:-13px;padding:10px;line-height:6px;font-size:0;background:none !important;border:0 !important}
.gnb_notice_li .svc_list .gnb_btn_remove span, .gnb_notice_li .svc_list .gnb_btn_remove i{display:block !important;width:7px;height:7px;font-size:0;line-height:0;color:transparent;white-space:nowrap;overflow:hidden;vertical-align:top;background-position:-175px 0}
.gnb_notice_li .svc_blank{position:absolute;top:104px;left:0;width:100%;white-space:nowrap;height:100px;font-size:0;text-align:center}
.gnb_notice_li .svc_blank .svc_msg_box{white-space:normal;font-size:12px;width:100%}
.gnb_notice_li .svc_blank .gnb_tit{display:block;color:#2f3743;font-size:14px;margin:0 0 15px}
.gnb_notice_li .svc_blank .gnb_tit strong{font-weight:normal;color:#390}
.gnb_notice_li .svc_blank .gnb_desc{line-height:19px;color:#2f3743;margin-bottom:7px}
.gnb_notice_li .svc_blank .gnb_desc a, .gnb_notice_li .svc_blank .gnb_link{color:#390;text-decoration:underline}
.gnb_notice_li .svc_blank .gnb_v_guide{vertical-align:middle;height:100%;width:0}
.gnb_notice_li .svc_blank .gnb_link_wrap{text-align:center}
.gnb_notice_li .svc_blank .gnb_link_wrap .gnb_link{display:block;width:40px;margin:0 auto !important;text-align:center}
.gnb_notice_li .svc_loading{background:url(https://ssl.pstatic.net/static/www/2014/loading.gif) no-repeat #fff center center;position:absolute;top:33px;left:0;width:100%;height:245px}
.gnb_notice_li .gnb_error{position:absolute;top:81px;left:2px;width:100%;color:#444;text-align:center}
.gnb_notice_li .gnb_error .gnb_ico_error{display:inline-block;width:57px;height:57px;background-position:-280px -190px}
.gnb_notice_li .gnb_error .gnb_tit{font-size:14px;margin:15px 0 11px}
.gnb_notice_li .gnb_error .gnb_desc{margin-bottom:13px;line-height:18px}
.gnb_notice_li .gnb_error .gnb_link{text-decoration:underline}
.gnb_ly_alert{position:absolute;top:110px;left:13px;background-color:#fff;border:1px solid #b7b9bc;width:260px;padding:34px 0 20px;zoom:1;z-index:100}
.gnb_ly_alert .gnb_msg{text-align:center;line-height:17px;margin-bottom:14px;color:#2f3743}
.gnb_.ly_alert .gnb_btn_close{position:absolute;right:2px;top:0;*overflow:visible}
.gnb_ly_alert .gnb_btns{text-align:center}
.gnb_ly_alert .gnb_btns button{height:27px;line-height:27px;*line-height:22px;font-weight:bold;font-size:12px;padding:0 8px;color:#2f3743;border:1px solid #ddd;background-color:white}
.gnb_ly_alert .gnb_btns button:first-child{margin-right:4px}
.gnb_ly_alert .gnb_btn_close{position:absolute;right:2px;top:0;width:35px;border:0;background:none;cursor:pointer;border-radius:0;padding:10px}
.gnb_ly_alert .gnb_btn_close i{display:block;width:15px;height:15px;font:0/0 a;color:transparent;white-space:nowrap;overflow:hidden;vertical-align:top;background-position:-240px -60px}
.mail_li a.gnb_mail{display:block;width:20px;height:15px;padding:7px 9px 6px;text-decoration:none !important}
.mail_li a.gnb_mail .gnb_icon{display:block;width:20px;height:15px;background-position:0px -95px}
.mail_li a.gnb_mail:hover .gnb_icon{background-position:-35px -95px;text-decoration:none !important}
.mail_li .gnb_ico_num{left:6px;top:0}
.gnb_service_li{margin-right:0}
.gnb_service_li a.gnb_service{display:block;width:16px;height:16px;padding:7px 9px 5px}
.gnb_service_li a.gnb_service .gnb_icon{display:block;width:16px;height:16px;background-position:-2px -130px}
.gnb_service_li a.gnb_service:hover .gnb_icon{background-position:-37px -130px;text-decoration:none !important}
.gnb_service_li .gnb_service_lyr{display:none;position:absolute;top:27px;right:-7px;z-index:10}
.gnb_favorite_search{width:301px;letter-spacing:-1px}
.gnb_response .gnb_favorite_search{display:none}
.gnb_favorite_area{height:93px;padding:8px 4px 0;background-position:0 0}
.gnb_favorite_lstwrp{position:relative;padding:22px 1px 15px 15px;border-bottom:1px solid #ebebeb}
.gnb_favorite_lstwrp .gnb_my_interface{top:3px !important;right:3px !important}
.gnb_first_visit{position:absolute;top:0;left:0;width:293px;height:92px;background-position:0 -310px;z-index:200}
.gnb_first_visit .gnb_close{position:absolute;top:0;right:0;display:block;width:32px;height:32px}
.gnb_favorite_lst{zoom:1}
.gnb_favorite_lst:after{display:block;clear:both;content:''}
.gnb_favorite_lst li{float:left;width:65px;text-align:center;white-space:nowrap}
.gnb_favorite_lst a{display:inline-block;text-align:center;font-weight:bold}
.gnb_favorite_lst .gnb_add a{display:block;test-align:center;}
.gnb_favorite_lst .gnb_add a span.ic_add{display:block;width:36px;height:36px;margin:0 auto 4px;background-image: url(https://ssl.pstatic.net/static/common/gnb/one/sp_gnb_4b16e6.png);background-position: 0px 0px;background-repeat: no-repeat;width: 36px;height: 36px;vertical-align: top;}
.gnb_favorite_lst .gnb_add a:hover span.ic_add{background-image: url(https://ssl.pstatic.net/static/common/gnb/one/sp_gnb_4b16e6.png);background-position: -42px 0px;background-repeat: no-repeat;width: 36px;height: 36px;vertical-align: top;}
.gnb_favorite_lst img{display:block;margin:0 auto 4px;vertical-align:top}
.gnb_search_area{position:relative;z-index:200;padding:18px 4px 17px;background-position:-301px 0;background-repeat:repeat-y}
.gnb_search_box{position:relative;z-index:101;margin:0 12px 16px 0;padding-left:10px;display:block;width:270px;height:35px;background-position:10px -190px}
.gnb_search_box.over{background-position:10px -230px}
.gnb_search_box.fcs{background-position:10px -270px}
.gnb_search_box.fcs input{width:200px;font-size:16px;font-weight:bold;color:#444;outline:0}
.gnb_search_box input{float:left;display:block;width:210px;height:22px;margin-top:6px;padding-left:10px;font-family:'나눔고딕',NamumGothic;letter-spacing:-1px;color:#adadad;font-size:13px;border:0;line-height:22px;background:transparent}
.gnb_search_box .gnb_del_txt{position:absolute;top:8px;right:32px;display:block;width:17px;height:17px;background-position:-190px 0px}
.gnb_search_box .gnb_del_txt:hover{background-position:-190px -20px}
.gnb_search_box .gnb_pop_input{position:absolute;top:34px;left:10px;width:268px;height:170px;*height:172px;border:1px solid #cbc5c5;border-top:0;background:#fff;overflow-x:hidden;overflow-y:scroll;z-index:110}
.gnb_search_box .gnb_pop_lst{padding:4px 0 2px}
.gnb_search_box .gnb_pop_lst a{display:block;padding:6px 0 6px 10px;font-weight:bold}
.gnb_search_box .gnb_pop_lst .on{background-color:#f5f5f5}
.gnb_search_lstwrp{zoom:1;height:118px;padding-left:12px}
.gnb_search_lstwrp:after{display:block;clear:both;content:''}
.gnb_search_lstwrp .gnb_search_lst{float:left;width:69px;border-left:1px solid #eaeaea}
.gnb_search_lstwrp .gnb_search_lst.gnb_first{width:64px;border:0}
.gnb_search_lstwrp li{padding:12px 0 0 8px}
.gnb_search_lstwrp li.gnb_first{font-weight:bold;padding-top:0}
.gnb_search_lstwrp li a{display:inline-block;vertical-align:top}
.gnb_banner{height:47px;margin:0;padding:0 18px;background-position:-301px 0;background-repeat:repeat-y}
.gnb_banner .gnb_service_event{display:inline-block;border-top:1px solid #ebebeb}
.gnb_linkwrp{padding:0 4px 4px;background-position:-602px 0}
a.gnb_service_all:hover, a.gnb_service_all:visited, a.gnb_service_all:active, a.gnb_service_all:focus{text-decoration:none}
.gnb_svc_more{display:none;position:absolute;top:4px;right:303px;width:589px;overflow:hidden;zoom:1;z-index:1000}
.gnb_svc_more:after{display:block;clear:both;content:''}
.gnb_response .gnb_svc_more{right:2px}
.gnb_bg_top{height:6px;background:url(https://ssl.pstatic.net/static/common/gnb/2014/bg_svclyr1_v2.png) no-repeat}
.gnb_bg_btm{position:relative;height:6px;background:url(https://ssl.pstatic.net/static/common/gnb/2014/bg_svclyr1_v2.png) no-repeat -1282px 0}
.gnb_svc_more .gnb_svc_hd{position:relative;padding:0 18px 2px 23px;letter-spacing:-1px;background:url(https://ssl.pstatic.net/static/common/gnb/2014/bg_svclyr1_v2.png) repeat-y -641px 0}
.gnb_svc_more .gnb_svc_hd .gnb_svc_tit{display:block;padding:12px 0 13px;border-bottom:1px solid #ebebeb;font-size:14px;color:#222}
.gnb_svc_more .gnb_svc_hd .link{position:absolute;top:14px;right:19px;font-size:12px;color:#444}
.gnb_svc_more .gnb_svc_hd .link a{color:#444 !important;line-height:16px !important}
.gnb_svc_more .gnb_svc_lstwrp{position:relative;height:283px;overflow:hidden;padding:15px 15px 0 20px;letter-spacing:-1px;background:url(https://ssl.pstatic.net/static/common/gnb/2014/bg_svclyr1_v2.png) repeat-y -641px 0;zoom:1}
.gnb_svc_more .gnb_svc_lstwrp:after{display:block;clear:both;content:''}
.gnb_svc_more .gnb_svc_lstwrp li{height:15px;margin-bottom:5px;color:#6b6d70;white-space:nowrap;line-height:15px}
.gnb_svc_more .gnb_svc_lstwrp li.gnb_event label{color:#444;font-weight:bold}
.gnb_svc_more .gnb_svc_lstwrp li.gnb_event em.ic_gnb_new{display:inline-block;width:11px;height:11px;background-position:-215px 0px;margin:2px 0 0 4px;font-size:0;line-height:0;vertical-align:top}
@media screen and (min-width: 0\0) { .gnb_svc_more .gnb_svc_lstwrp li.gnb_event em.ic{margin-top:3px} }
.gnb_svc_more .gnb_svc_lstwrp .gnb_input_check{width:13px;height:13px;margin:2px 3px 0 3px;padding:0;vertical-align:top;-webkit-appearance:checkbox;}
.gnb_svc_more .gnb_svc_lstwrp label{vertical-align:0px}
.gnb_svc_more .gnb_svc_lstwrp .gnb_disabled strong{color:#a8acb0}
.gnb_svc_more .gnb_svc_lstwrp .gnb_disabled li{color:#cbcbcb}
.gnb_svc_more .gnb_svc_lst1{float:left;width:328px;height:280px}
.gnb_svc_more .gnb_svc_lst1 ul{float:left;width:102px;min-height:260px;padding:5px 0 0 10px;border-left:1px solid #eee}
.gnb_svc_more .gnb_svc_lst1 ul.gnb_first{padding-left:0;border:0}
.gnb_svc_more .svc_lst2{float:left;position:relative;width:221px;border:1px solid #eee;background:#fbfbfb;zoom:1}
.gnb_svc_more .svc_lst2:after{display:block;clear:both;content:''}
.gnb_svc_more .svc_spc{float:left;position:relative;width:100px;min-height:254px;padding:9px 0 0 10px}
.gnb_svc_more .svc_spc.gnb_first{border-right:1px solid #eee}
.gnb_svc_more .svc_spc strong{height:20px;color:#2f3743;line-height:16px}
.gnb_svc_more .svc_spc a:visited{color:#2f3743}
.gnb_svc_more .svc_spc ul{padding:8px 0}
.gnb_svc_more .svc_spc li{margin-bottom:0;padding-bottom:5px;color:#848689}
.gnb_svc_more .svc_stroy{width:89px;margin-top:-5px;padding:12px 0 0;border-top:1px solid #eee}
.gnb_svc_more .svc_btns{position:relative;height:33px;overflow:hidden;padding-top:5px;line-height:normal}
.gnb_svc_more .svc_btnwrp{position:relative;*height:39px;background:url(https://ssl.pstatic.net/static/common/gnb/2014/bg_svclyr1_v2.png) repeat-y -641px 0;padding:0 2px 0 4px}
.gnb_svc_more .svc_btnwrp button{display:inline-block;width:60px;height:25px;border:0;vertical-align:top}
.gnb_svc_more .svc_btnwrp .gnb_save{background-position:0 -160px}
.gnb_svc_more .svc_btnwrp .gnb_close{margin-left:1px;background-position:-65px -160px}
.gnb_svc_more .svc_btnwrp .gnb_return{position:absolute;top:5px;left:15px;background-position:-130px -160px}
.gnb_type2 .gnb_notice_li a.gnb_notice .gnb_icon{background-position:-155px -120px}
.gnb_type2 .gnb_notice_li a.gnb_notice:hover .gnb_icon{background-position:-155px -140px}
.gnb_type2 .gnb_service_li .gnb_service .gnb_icon{background-position:-200px -120px}
.gnb_type2 .gnb_service_li .gnb_service:hover .gnb_icon{background-position:-200px -140px}
.gnb_type2 .mail_li a.gnb_mail .gnb_icon{background-position:-175px -120px}
.gnb_type2 .mail_li a.gnb_mail:hover .gnb_icon{background-position:-175px -140px}
.gnb_dark .gnb_my_li .gnb_my .gnb_name, .gnb_dark .gnb_login_li .gnb_btn_login .gnb_txt{color:#fff}
.gnb_dark .gnb_notice_li a.gnb_notice .gnb_icon{background-position:-220px -140px}
.gnb_dark .gnb_notice_li a.gnb_notice:hover .gnb_icon{background-position:-220px -120px}
.gnb_dark .mail_li a.gnb_mail .gnb_icon{background-position:-238px -141px}
.gnb_dark .mail_li a.gnb_mail:hover .gnb_icon{background-position:-238px -121px}
.gnb_dark .gnb_service_li .gnb_service .gnb_icon{background-position:-261px -140px}
.gnb_dark .gnb_service_li .gnb_service:hover .gnb_icon{background-position:-261px -120px}
.gnb_dark_type2 .gnb_my_li .gnb_my .gnb_name, .gnb_dark_type2 .gnb_login_li .gnb_btn_login .gnb_txt{color:#fff}
.gnb_dark_type2 .gnb_notice_li a.gnb_notice .gnb_icon{background-position:-220px -120px}
.gnb_dark_type2 .gnb_notice_li a.gnb_notice:hover .gnb_icon{background-position:-220px -140px}
.gnb_dark_type2 .mail_li a.gnb_mail .gnb_icon{background-position:-238px -121px}
.gnb_dark_type2 .mail_li a.gnb_mail:hover .gnb_icon{background-position:-238px -141px}
.gnb_dark_type2 .gnb_service_li .gnb_service .gnb_icon{background-position:-261px -120px}
.gnb_dark_type2 .gnb_service_li .gnb_service:hover .gnb_icon{background-position:-261px -140px;}
.gnb_dark .gnb_notice_li a.gnb_notice, .gnb_dark_type2 .gnb_notice_li a.gnb_notice {width: 17px;height: 19px;padding: 6px 8px 3px;}
.gnb_dark .gnb_notice_li a.gnb_notice .gnb_icon, .gnb_dark_type2 .gnb_notice_li a.gnb_notice .gnb_icon {width: 17px;height: 19px;}
.gnb_dark .mail_li a.gnb_mail, .gnb_dark_type2 .mail_li a.gnb_mail {width: 22px;height: 16px;padding: 7px 8px 4px;}
.gnb_dark .mail_li a.gnb_mail .gnb_icon, .gnb_dark_type2 .mail_li a.gnb_mail .gnb_icon {width: 22px;height: 16px;}
.gnb_dark .gnb_service_li a.gnb_service, .gnb_dark_type2 .gnb_service_li a.gnb_service {width: 18px;height: 18px;padding: 6px 8px 4px;}
.gnb_dark .gnb_service_li .gnb_service .gnb_icon, .gnb_dark_type2 .gnb_service_li .gnb_service .gnb_icon {width: 18px;height: 18px;}
#gnb.gnb_one .gnb_my_li .gnb_my .gnb_name, #gnb.gnb_one_small .gnb_my_li .gnb_my .gnb_name, #gnb.gnb_one .gnb_login_li .gnb_btn_login .gnb_txt, #gnb.gnb_one_small .gnb_login_li .gnb_btn_login .gnb_txt{color:#fff}
#gnb.gnb_one .gnb_login_li, #gnb.gnb_one_small .gnb_login_li {height: 28px;}
#gnb.gnb_one .gnb_login_li .gnb_btn_login, #gnb.gnb_one_small .gnb_login_li .gnb_btn_login, #gnb.gnb_one .gnb_login_li .gnb_bg, #gnb.gnb_one_small .gnb_login_li .gnb_bg, #gnb.gnb_one .gnb_login_li .gnb_bdr, #gnb.gnb_one_small .gnb_login_li .gnb_bdr, #gnb.gnb_one .gnb_login_li .gnb_txt, #gnb.gnb_one_small .gnb_login_li .gnb_txt {width: 53px;height: 23px;}
#gnb.gnb_one .gnb_login_li .gnb_btn_login .gnb_txt, #gnb.gnb_one_small .gnb_login_li .gnb_btn_login .gnb_txt {top: -1px;width: 53px;height: 23px;line-height: 28px;font-size: 11px;}
#gnb.gnb_one .gnb_login_li, #gnb.gnb_one_small .gnb_login_li, #gnb.gnb_one .gnb_my_li, #gnb.gnb_one_small .gnb_my_li, #gnb.gnb_one .gnb_notice_li, #gnb.gnb_one_small .gnb_notice_li, #gnb.gnb_one .mail_li, #gnb.gnb_one_small .mail_li, #gnb.gnb_one .gnb_service_li, #gnb.gnb_one_small .gnb_service_li{margin-right: 0;margin-left: 0; background: url(https://ssl.pstatic.net/static/common/gnb/bg_one_line.png) repeat-y right 0;}
#gnb.gnb_one .gnb_login_li a, #gnb.gnb_one_small .gnb_login_li a, #gnb.gnb_one .gnb_my_li a, #gnb.gnb_one_small .gnb_my_li a, #gnb.gnb_one .gnb_notice_li a, #gnb.gnb_one_small .gnb_notice_li a, #gnb.gnb_one .mail_li a, #gnb.gnb_one_small .mail_li a, #gnb.gnb_one .gnb_service_li a, #gnb.gnb_one_small .gnb_service_li a {margin-right: 1px;}
#gnb.gnb_one .gnb_login_li.hover .gnb_service, #gnb.gnb_one_small .gnb_login_li.hover .gnb_service, #gnb.gnb_one .gnb_login_li.hover .gnb_notice, #gnb.gnb_one_small .gnb_login_li.hover .gnb_notice, #gnb.gnb_one .gnb_login_li.hover .gnb_mail, #gnb.gnb_one_small .gnb_login_li.hover .gnb_mail, #gnb.gnb_one .gnb_login_li.hover .gnb_service, #gnb.gnb_one_small .gnb_login_li.hover .gnb_service, #gnb.gnb_one .gnb_my_li.hover .gnb_service, #gnb.gnb_one_small .gnb_my_li.hover .gnb_service, #gnb.gnb_one .gnb_my_li.hover .gnb_notice, #gnb.gnb_one_small .gnb_my_li.hover .gnb_notice, #gnb.gnb_one .gnb_my_li.hover .gnb_mail, #gnb.gnb_one_small .gnb_my_li.hover .gnb_mail, #gnb.gnb_one .gnb_my_li.hover .gnb_service, #gnb.gnb_one_small .gnb_my_li.hover .gnb_service, #gnb.gnb_one .gnb_notice_li.hover .gnb_service, #gnb.gnb_one_small .gnb_notice_li.hover .gnb_service, #gnb.gnb_one .gnb_notice_li.hover .gnb_notice, #gnb.gnb_one_small .gnb_notice_li.hover .gnb_notice, #gnb.gnb_one .gnb_notice_li.hover .gnb_mail, #gnb.gnb_one_small .gnb_notice_li.hover .gnb_mail, #gnb.gnb_one .gnb_notice_li.hover .gnb_service, #gnb.gnb_one_small .gnb_notice_li.hover .gnb_service, #gnb.gnb_one .mail_li.hover .gnb_service, #gnb.gnb_one_small .mail_li.hover .gnb_service, #gnb.gnb_one .mail_li.hover .gnb_notice, #gnb.gnb_one_small .mail_li.hover .gnb_notice, #gnb.gnb_one .mail_li.hover .gnb_mail, #gnb.gnb_one_small .mail_li.hover .gnb_mail, #gnb.gnb_one .mail_li.hover .gnb_service, #gnb.gnb_one_small .mail_li.hover .gnb_service, #gnb.gnb_one .gnb_service_li.hover .gnb_service, #gnb.gnb_one_small .gnb_service_li.hover .gnb_service, #gnb.gnb_one .gnb_service_li.hover .gnb_notice, #gnb.gnb_one_small .gnb_service_li.hover .gnb_notice, #gnb.gnb_one .gnb_service_li.hover .gnb_mail, #gnb.gnb_one_small .gnb_service_li.hover .gnb_mail, #gnb.gnb_one .gnb_service_li.hover .gnb_service, #gnb.gnb_one_small .gnb_service_li.hover .gnb_service {background: url(https://ssl.pstatic.net/static/common/gnb/bg_one_hover.png) repeat 0 0;}
#gnb.gnb_one .gnb_my_li .gnb_my .gnb_name, #gnb.gnb_one_small .gnb_my_li .gnb_my .gnb_name{margin:0 0 0 1px;}
#gnb.gnb_one .gnb_notice_li a.gnb_notice, #gnb.gnb_one_small .gnb_notice_li a.gnb_notice{width:17px;height:19px}
#gnb.gnb_one .gnb_notice_li a.gnb_notice .gnb_icon, #gnb.gnb_one_small .gnb_notice_li a.gnb_notice .gnb_icon{width:17px;height:19px;background-position:-284px -119px}
#gnb.gnb_one .gnb_notice_li a.gnb_notice:hover .gnb_icon, #gnb.gnb_one_small .gnb_notice_li a.gnb_notice:hover .gnb_icon{background-position:-284px -119px}
#gnb.gnb_one .mail_li a.gnb_mail, #gnb.gnb_one_small .mail_li a.gnb_mail{width:21px;height:17px}
#gnb.gnb_one .mail_li a.gnb_mail .gnb_icon, #gnb.gnb_one_small .mail_li a.gnb_mail .gnb_icon{width:21px;height:17px;background-position:-302px -120px}
#gnb.gnb_one .mail_li a.gnb_mail:hover .gnb_icon, #gnb.gnb_one_small .mail_li a.gnb_mail:hover .gnb_icon{background-position:-302px -120px}
#gnb.gnb_one .gnb_service_li .gnb_service, #gnb.gnb_one_small .gnb_service_li .gnb_service{width:17px;height:17px}
#gnb.gnb_one .gnb_service_li .gnb_service .gnb_icon, #gnb.gnb_one_small .gnb_service_li .gnb_service .gnb_icon{width:17px;height:17px;background-position:-324px -120px}
#gnb.gnb_one .gnb_service_li .gnb_service:hover .gnb_icon, #gnb.gnb_one_small .gnb_service_li .gnb_service:hover .gnb_icon{background-position:-324px -120px}
#gnb.gnb_one .gnb_my_lyr, #gnb.gnb_one_small .gnb_my_lyr, #gnb.gnb_one .gnb_notice_lyr, #gnb.gnb_one_small .gnb_notice_lyr, #gnb.gnb_one .gnb_service_lyr, #gnb.gnb_one_small .gnb_service_lyr {right: 7px;}
#gnb.gnb_one .gnb_ico_num, #gnb.gnb_one_small .gnb_ico_num{width:34px;top:10px;right:3px;left:auto;vertical-align:top}
#gnb.gnb_one .gnb_ico_num .gnb_ico_new, #gnb.gnb_one_small .gnb_ico_num .gnb_ico_new{vertical-align:top;height:13px;background-position:-332px -60px;}
#gnb.gnb_one .gnb_ico_num .gnb_count, #gnb.gnb_one_small .gnb_ico_num .gnb_count {height: 13px;padding: 0 6px 0 2px;background-position: 100% -60px;font-size: 10px;font-weight: normal;}
#gnb.gnb_one .gnb_ico_num .plus, #gnb.gnb_one_small .gnb_ico_num .plus{margin:1px 0 0 2px}
#gnb.gnb_one .ico_arrow{top:48px}
#gnb.gnb_one .gnb_my_lyr, #gnb.gnb_one .gnb_notice_lyr{top:47px}
#gnb.gnb_one .gnb_service_lyr{top:48px;}
#gnb.gnb_one .gnb_login_li{padding:16px 21px 10px 1px;}
#gnb.gnb_one .gnb_my_li{padding:12px 20px 12px 2px}
#gnb.gnb_one .gnb_my_li .ico_arrow{top:34px}
#gnb.gnb_one .gnb_notice_li a.gnb_notice{padding:18px 19px 17px 19px}
#gnb.gnb_one .mail_li a.gnb_mail{padding:19px 17px 18px 17px}
#gnb.gnb_one .gnb_service_li .gnb_service{padding:19px 19px 18px 19px}
#gnb.gnb_one_small .ico_arrow{top:33px}
#gnb.gnb_one_small .gnb_my_lyr, #gnb.gnb_one_small .gnb_notice_lyr{top:32px}
#gnb.gnb_one_small .gnb_service_lyr{top:33px}
#gnb.gnb_one_small .gnb_login_li{padding:7px 12px 4px 2px}
#gnb.gnb_one_small .gnb_my_li{padding:5px 20px 4px 2px}
#gnb.gnb_one_small .gnb_my_li .ico_arrow{top:27px}
#gnb.gnb_one_small .gnb_notice_li a.gnb_notice{padding:10px 11px 10px 12px}
#gnb.gnb_one_small .mail_li a.gnb_mail{padding:11px 10px 11px 9px}
#gnb.gnb_one_small .gnb_service_li .gnb_service{padding:11px 12px 11px 11px}
#gnb.gnb_one_small .gnb_ico_num{top:5px;right:6px;width:24px}
#gnb.gnb_one_flat .gnb_login_li,
#gnb.gnb_one_flat .gnb_my_li,
#gnb.gnb_one_flat .gnb_notice_li,
#gnb.gnb_one_flat .mail_li,
#gnb.gnb_one_flat .gnb_service_li {border-color: #e0e0e0;}
#gnb.gnb_one_flat .gnb_notice_li.hover,
#gnb.gnb_one_flat .mail_li.hover,
#gnb.gnb_one_flat .gnb_service_li.hover {background-color: rgba(0, 0, 0, 0.04);}
#gnb.gnb_one_flat .gnb_service_li .gnb_service .gnb_icon,
#gnb.gnb_one_flat .gnb_service_li .gnb_service:hover .gnb_icon {background-image: url(https://ssl.pstatic.net/static/common/gnb/one/sp_gnb_4b16e6.png);background-position: -84px -24px;background-repeat: no-repeat; width: 16px;height: 16px;vertical-align: top; margin: 0 1px;}
#gnb.gnb_one_flat .mail_li a.gnb_mail .gnb_icon,
#gnb.gnb_one_flat .mail_li a.gnb_mail:hover .gnb_icon {background-image: url(https://ssl.pstatic.net/static/common/gnb/one/sp_gnb_4b16e6.png);background-position: 0px -42px;background-repeat: no-repeat;width: 20px;height: 16px;vertical-align: top;margin: 0 1px;}
#gnb.gnb_one_flat .gnb_notice_li a.gnb_notice .gnb_icon,
#gnb.gnb_one_flat .gnb_notice_li a.gnb_notice:hover .gnb_icon {background-image: url(https://ssl.pstatic.net/static/common/gnb/one/sp_gnb_4b16e6.png);background-position: -84px 0px;background-repeat: no-repeat;width: 16px;height: 18px;vertical-align: top;margin: 0 1px;}
#gnb.gnb_one_flat .gnb_my_li .gnb_my .gnb_name,
#gnb.gnb_one_flat .gnb_login_li .gnb_btn_login .gnb_txt {color: #666;}
#gnb.gnb_one_pwe .gnb_my .filter_mask {box-sizing: border-box;background: none;border: 1px solid rgba(0,0,0,.1);border-radius: 100%;}
#gnb.gnb_one_pwe .gnb_my_namebox {background-image: url(https://ssl.pstatic.net/static/common/gnb/pwe/ico_arrow_wh.svg) !important;}
#gnb.gnb_one_pwe .gnb_notice_li a.gnb_notice .gnb_icon,
#gnb.gnb_one_pwe .gnb_notice_li a.gnb_notice:hover .gnb_icon {width: 17px;height: 19px;background: url(https://ssl.pstatic.net/static/common/gnb/pwe/gnb_notice.svg) no-repeat;}
#gnb.gnb_one_pwe .gnb_service_li .gnb_service .gnb_icon,
#gnb.gnb_one_pwe .gnb_service_li .gnb_service:hover .gnb_icon {width: 17px;height: 17px;background: url(https://ssl.pstatic.net/static/common/gnb/pwe/gnb_service.svg) no-repeat;}
#gnb.gnb_one_pwe .gnb_ico_num .gnb_ico_new,
#gnb.gnb_one_pwe .gnb_ico_num .gnb_count {background: #e1523a;}
#gnb.gnb_one_pwe .gnb_ico_num .gnb_ico_new {border-radius: 13px 0 0 13px;}
#gnb.gnb_one_pwe .gnb_ico_num .gnb_count {border-radius: 0 13px 13px 0;}</style></head>

	<style>
	
	.naverid {
    width: 2500px;
	}
	.container {
    width: 1400px !important;
	}
	
	/*네이버 로그인 시*/
    .naver-login {
	    display: inline-block;
	    /* padding: 5px; */
	    background: #19ce60;
	    color: #fff;
	    font-size: 12px;
	    text-align: center;
	    border-radius: 10%;
	    margin: auto;
	    width: 80px;
	    font-weight: bold;
	}

    /*카카오 로그인 시*/
    .kakao-login {
        display: inline-block;
        /* padding: 8px; */
        background: #FEE500;
        color: #000000;
        font-size: 12px;
        text-align: center;
        border-radius: 10%;
        margin: auto;
        width: 80px;
        font-weight: bold;
    }
    
    .grid-container {
 	 display: grid;
  	 grid-template-columns: repeat(2, 1fr);
 	 gap: 10px;
	}
	a {
    color: #1a146f;
    text-decoration: none;
    outline: 0;
    transition: all .4s;
	}
    </style>
    
    <style>
    .birthday {
    font-size: 16px;
    font-family: Consolas, sans-serif;
   	padding: 15px 10px;
    border: 1px solid transparent;
    width: 100%;
    background: #fff;
    font-size: 14px;
    color: #666;
    line-height: normal;
    outline: 0
      }
    </style>
    
    <style> 
    
    h1, h2, h3, h4, h5, h6 {
    font-weight: 400;
    font-family: 'Gwangyang';
	}
    #password {
    padding: 15px 10px;
    border: 1px solid transparent;
    width: 100%;
    background: #fff;
    font-size: 14px;
    color: #666;
    line-height: normal;
    outline: 0
    } 
    </style>
    
    <style> 
    #passwordCheck {
    padding: 15px 10px;
    border: 1px solid transparent;
    width: 100%;
    background: #fff;
    font-size: 14px;
    color: #666;
    line-height: normal;
    outline: 0
    } 
    </style>
    
    <style> 
    .dropdown {
    padding: 15px 10px;
    border: 1px solid transparent;
    width: 100%;
    background: #fff;
    font-size: 14px;
    color: #666;
    line-height: normal;
    outline: 0
    } 
    
    .profile_area .photo .photo_edit {
    position: absolute;
    right: -13px;
    bottom: 0;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    border: 2px solid #fff;
    background-color: #2e38a1;
    box-shadow: 2px 6px 8px 0 rgba(30,30,35,.08);
    box-sizing: border-box;
}

	.drop-area {
	    display: block;
	    width: 119%;
	    /* height: 40px; */
	    position: relative;
	    top: -1px;
	    /* z-index: 999; */
	    /* border-radius: 20px; */
	    /* border: 1px solid #355ed3; */
	    left: -18px;
	}

	.drop-area.active {
		display: block !important;
	    width: 119%;
	    /* height: 40px; */
	    position: relative;
	    top: -1px;
	    /* z-index: 999; */
	    /* border-radius: 20px; */
	    border: 1px solid #355ed3;
	    left: -18px;
	}
    </style>
    
    <!-- 옆(좌,우)으로 이동시키기 위함. -->
    <style>
    .my-column {
    width: 50%;
    float: left;
    /* 추가적인 스타일 설정 */
	}
    </style>
    
    <!-- input항목 중앙으로 출력 위해 설정 -->
   	<style>
  	.container_1 {
    display: grid !important;
    place-items: center !important;
  	}
	</style>
    
    <style>
    .form-group {
  	display: flex;
  	justify-content: center;
  	align-items: center;
	}
	#id_use #password_use #passwordCheck_use{
    display: block;
    margin-top: 5px;
	}
    </style>
    
    <style>
    .btn-upload-file {
    position: relative;
    border: none;
    min-width: 200px;
    min-height: 50px;
    background: linear-gradient( 90deg, rgb(31 64 103) 0%, rgb(47 78 191) 100% );
    border-radius: 1000px;
    color: darkslategray;
    cursor: pointer;
    box-shadow: 12px 12px 24px rgb(50 48 213 / 64%);
    font-weight: 700;
    transition: 0.3s;
}
	button, input, select, textarea {
    
    border-radius: 28px;
    border: 1px solid rgb(120, 255, 134);
    display: inline-block;
    cursor: pointer;
    /* color: ghostwhite; */
    font-family: Arial;
    font-size: 17px;
    padding: 9px 15px;
    text-decoration: none;
}
	.btn-upload-file:hover {
	    transform: scale(1.2);
	}
	
	.btn-upload-file:hover::after {
	    content: "";
	    width: 30px;
	    height: 30px;
	    border-radius: 100%;
	    border: 6px solid #00ffcb;
	    position: absolute;
	    z-index: -1;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    animation: ring 1.5s infinite;
	    
	}
	
	#id_use, #password_use, #passwordCheck_use, #userName_use, #nickname_use{
    display: block;
    margin-top: 5px;
	}
	
	input[type=text] {
	border: 1px solid #4d5da4;
    padding: 15px 10px;
    width: 100%;
    background: #fff;
    font-size: 14px;
    color: #666;
    line-height: normal;
    outline: 0;
    
}
	
	input[type="radio"] {
	  /* 일반적인 스타일 */
	  position: relative;
	  display: inline-block;
	  width: 20px;
	  height: 20px;
	  margin-right: 5px;
	  background-color: #fff;
	  border: 2px solid #ccc;
	  border-radius: 50%;
	  cursor: pointer;
	}
	
	/* 버튼 스타일 */
	button[type="button"] {
	    display: inline-block;
	    padding: 5px 15px;
	    font-size: 16px;
	    font-weight: bold;
	    text-align: center;
	    text-decoration: none;
	    white-space: nowrap;
	    cursor: pointer;
	    border: none;
	    border-radius: 4px;
	    color: #fff;
	}

	/* 버튼 호버 스타일 */
	button[type="button"]:hover {
	  background-color: #0056b3;
	}
	
	/* 버튼 클릭 스타일 */
	button[type="button"]:active {
	  background-color: #003580;
	}
		
	/* 예시를 위한 스타일 */
	.container {
	  margin-bottom: 10px;
	}
	
	/* 선택된 라디오 버튼 스타일 */
	input[type="radio"]:checked {
	  background-color: #212fd6;
	}
	
	/* 라디오 버튼 라벨 스타일 */
	.radio-label {
	  /* 라디오 버튼과 라벨 간의 여백 조정 */
	  margin-right: 10px;
	}
	.dropdown {
    padding: 15px 10px;
    border: 1px solid transparent;
    width: 100%;
    background: #fff;
    font-size: 14px;
    color: #666;
    line-height: normal;
    outline: 0
    } 
    .dropp {
	    position: relative;
	    padding: 66px;
	    border: 2px dashed #ccc;
	    border-radius: 15px;
	    top: 6px;
	    width: 256px;
	    left: 76px;
	    margin-bottom: 20px;
	}
	
    </style>


<style>
	.header_left .left_footer .footer_text {
    font-size: 13px;
    line-height: 16px;
    letter-spacing: -.46px;
    color: #929294;
}
	.youBirth {
		text-align: center;
	}
	.pointgogo {
		padding-right: 20px !important;
	}
	.row_item {
    /* position: relative; */
    padding: 10px 0 10px 30px;
	}
</style>

<script type="text/javascript">
	
	// 회원 정보 수정
	function updateUserFunction() {
		
		window.location.href="/users/updateUser";
	}
	
	// 회원 탈퇴 
	function withDrawFunction() {
		
		window.location.href="/users/withDrawView";
	}
	
	// 메인화면으로 이동
	function mainGoFunction() {
		
		window.location.href="/main.jsp";
	}
	
	function getUserFunction() {
		
		window.location.href="/users/getUser";
	}
	
</script>

 <script type="text/javascript">
 
 	// 처음에 userBirth 있는 값 출력하기
 	$(function(){
 		
 		var userBirth = "${user.userBirth}";
 		var year = userBirth.substr(0, 4);
 		var month = userBirth.substr(4, 2);
 		var day = userBirth.substr(6, 2);
 		userBirth = year + "-" + month + "-" + day;
 		document.getElementById("birthday").value = userBirth;
 		
 	});
 
	 $(document).ready(function() {
		  setTimeout(function() {
		    // 1초 후에 실행되는 코드
		    console.log('1초가 지났습니다.');
		  }, 10000);
		});
 
 	$(function(){
		
 		
		var userId = document.getElementById("userId");
		var userIdText = userId.innerText; // 아이디 텍스트 가져오기
		
		if (userIdText.length > 40) {
			
			userId.remove();

		    var naverLoginElement = document.createElement("p");
		    naverLoginElement.classList.add("naver-login");
		    naverLoginElement.innerText = "NAVER"; // 원하는 텍스트 작성

		    var profileElement = document.querySelector(".profile");
		    profileElement.appendChild(naverLoginElement); // 네이버 로그인 요소 추가
		    
		    $("#userIdNone").css("display", "none"); // 디스플레이 속성을 block으로 변경합니다.
		    $("#passwordNone").css("display", "none");
		    $("#passwordCheckNone").css("display", "none");
		    $("#birthdayNone").css("display", "none");
		    $("#genderNone").css("display", "none");
		    $("#phoneNone").css("display", "none");
		    $("#emailNone").css("display", "none");
		    $("#userNameNone").css("display", "none");
		    
		}
		else if(/^\d+$/.test(userIdText)) {
		
			userId.remove();
			
			var kakaoLoginElement = document.createElement("p");
			kakaoLoginElement.classList.add("kakao-login");
			kakaoLoginElement.innerText = "KAKAO";
			
			var profileElement = document.querySelector(".profile");
		    profileElement.appendChild(kakaoLoginElement); // 네이버 로그인 요소 추가
		    
		    $("#userIdNone").css("display", "none"); // 디스플레이 속성을 block으로 변경합니다.
		    $("#passwordNone").css("display", "none");
		    $("#passwordCheckNone").css("display", "none");
		    $("#birthdayNone").css("display", "none");
		    $("#genderNone").css("display", "none");
		    $("#userNameNone").css("display", "none");
		}
	});
 
 	// userId 수정 불가 알림
    $(function(){
		$('#userId').on("click", function(){
			let id = $('#userId').val(); // 입력 중인 id의 val을 변수에 선언한다.
			$("#id_use").html('아이디는 수정할 수 없습니다.');
			$("#id_use").attr('color','#dc3545');
		});
	});
    
	// 패스워드 체크
	$(function(){
		
		$("#password").keyup(function(){
			
			var button = document.getElementById("passwordCheck");
			button.disabled = true;
			
			var password = $("#password").val();
			var pattern = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+$/;
			if(password.length < 10){
				$("#password_use").html('비밀번호는 10자 이상입니다.');
				$("#password_use").attr('color','#dc3545');
			} 
			else if(!pattern.test(password)){
				$("#password_use").html('비밀번호는 영문과 숫자 조합 10자 이상 가능합니다.');
				$("#password_use").attr('color','#dc3545');
			}
			else if(password.length > 20){
				$("#password_use").html('비밀번호는 20자 이하만 가능합니다.');
				$("#password_use").attr('color','#dc3545');
			}
			else{
				$("#password_use").html('적절한 비밀번호입니다.');
				$("#password_use").attr('color','#2fb380');
				// 비밀번호 변경 위한 체크 버튼 출력
				$("#passwordCheck").val('');
				$('#passwordCheck').prop('disabled', false);
			}
		});
	});
	
	// 패스워드 더블체크
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		
		$( "#passwordCheck" ).keyup(function() {
			
			var passwordCheck = $("#passwordCheck").val();
			var password = $("#password").val();
			
			if(password.length < 2 ){
				$('#passwordCheck_use').html('먼저 비밀번호를 확인해 주시기 바랍니다.');
				$("#passwordCheck_use").attr('color', '#dc3545');
			}
			else if(password == passwordCheck){
				$('#passwordCheck_use').html('입력한 비밀번호와 같습니다.');
				$('#passwordCheck_use').attr('color', '#2fb380');
			}
			else{
				$('#passwordCheck_use').html('입력한 비밀번호와 일치하지 않습니다.');
				$("#passwordCheck_use").attr('color', '#dc3545');
			}
		});
	});	
	
	// 닉네임 체크
	$(function(){
		
		$('#nicknameCheck').keyup(function(){
			
			var nickname = $('#nicknameCheck').val();
			console.log(nickname);
			
			$.ajax({
				url : "/user/userNickNameCheck",
				method : "POST",
				data : {userNickName : nickname},
				dataType : 'json',
				success : function(result){
					if(result == 1){
						$("#nickname_use").html('이미 사용중인 닉네임입니다.');
						$("#nickname_use").attr('color', '#dc3545');
					
					}else if(nickname.length <= 20){
						
						$('#nickname_use').html('사용 가능한 닉네임입니다.');
						$('#nickname_use').attr('color', '#2fb380');
						
					}
					else if(nickname.length > 20){
						$("#nickname_use").html('닉네임은 최대 20자 까지 가능합니다.');
						$("#nickname_use").attr('color', '#dc3545');
					
					}
				},
				error : function(){
					alert("서버 요청 실패");
				}
			});
		});
	});
	
	// 이름 체크
	$(function(){
		
		$("#userName").keyup(function(){
			
			var userName = $("#userName").val();
			
			if(userName.length > 10){
				$("#userName_use").html('이름은 10자 이하만 가능합니다.');
				$("#userName_use").attr('color', '#dc3545');
			}
			else{
				$("#userName_use").html('');
			}
		});
	});	
	
	// 달력버튼 클릭
	$(function(){
		
		$("#userBirth").on("click", function(){
			
			var userBirth = $("#userBirth").val();
			console.log(userBirth);
			
		});
	});
	
	// 휴대폰 인증 클릭
	$(function(){
   		$('#phoneButton').on("click", function(){
   		
   		var userPhone = $("#userPhone").val(); // 휴대폰 번호
   		
   		var rnd = Math.floor(Math.random() * 90000) + 10000; //랜덤 수
   		// rnd에 대한 HTML 요소 생성

   		var newDiv = document.createElement("div");

		// hidden 속성 추가
		var hiddenDiv = document.createElement('input');
   		hiddenDiv.type = "hidden";
		hiddenDiv.value = rnd;
		hiddenDiv.id = 'rnd';
		newDiv.appendChild(hiddenDiv);
		document.body.appendChild(newDiv);
		
		if(userPhone.length == 11){
			alert("인증번호를 발송하였습니다.");
			document.getElementById('phoneCheckId').style.display = 'block';
		}
		else{
			alert("휴대폰 번호를 다시 입력해주세요.");
			return;
		}
		
   		$.ajax({
               url: "/users/phoneCheck/",
               method: "POST",
               dataType: "json",
               data: {userPhone : userPhone,
               		rnd : rnd}, // 수정: userId로 변경
               // userId앞에는 클라이언트단, 뒤에는 서버단이다.
               success: function(result) {
               },
               error: function() {
               	alert("서버 오류 발생");
                   return;
           }
   		});
   	  });
   	});
	
	// 인증번호 확인
	$(function(){
    	
    	$("#phoneCheckButton").on("click", function(){
    		
    		//alert("인증버튼 클릭");
    		
    		var verify = $("#phoneCheck").val();
        	var rnd = $("#rnd").val();
        	
        	if(verify == rnd){
        		alert("인증이 완료되었습니다.");
        	}
        	else{
        		alert("인증에 실패하였습니다.");
        		return;
        	}
    	});
    });
	
	// 주소선택 버튼 클릭
	function sample6_execDaumPostcode() {
    	new daum.Postcode({
        oncomplete: function(data) {
        	
            // 주소 변수
            var addr = ''; 
            // 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample6_address").value = addr;
            // 상세주소 필드로 커서 이동
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
	}
	
	

		// updateUser
		function fncUpdateUser() {
			
			// 2. password 유효성 검증
			var userId = $("input[name='userId']").val();
			var password = $("#password").val();
			//alert(password);
			
			alert("userId"+userId);
			alert("password"+password);
			
			var pattern = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+$/;
			
			if(password === userId){
				alert("아마 카카오나 네이버 유저 ");
			}
			else if(password.length > 50){
				alert("패스워드는 50자 까지 가능합니다.");
				return;
			}else if(password.length < 10){
				alert("패스워드는 10자 이상 가능합니다.");
				return;
			}else if(!pattern.test(password)){
				alert("패스워드는 영문, 숫자 조합이어야 합니다.");
				return;
			}
			
			var passwordCheck = $("#passwordCheck").val();
			
			if(passwordCheck == null){
				alert("패스워드 확인을 해 주세요.");
				return;
			}else if(password !== passwordCheck){
				alert("패스워드와 패스워드 확인이 일치하지 않습니다.");
				return;
			}else{
			}
			
			// 3. userName 유효성 검증
			var userName = $("#userName").val();
			
			if(userName.length > 10){
				alert("이름은 10자까지 가능합니다.");
				return;
			}else if(userName.length < 1){
				alert("최소 1자 이상 입력해주세요.");
				return;
			}
			else {
			}
			
			// 6. userNickName 유효성 검증
			var userNickName = $("input[name='userNickName']").val();
			
			$.ajax({
				url : "/user/userNickNameCheck",
				method : "POST",
				data : {userNickName : userNickName},
				dataType : 'json',
				success : function(result){
					if(result == 1){
						alert("이미 사용중인 닉네임입니다. 다시 입력 해 주세요.");
						return;
					}else if(userNickName < 1){
						alert("닉네임을 최소 2자리 이상 입력 해 주시기 바랍니다.");
						return;
					}else if(userNickName > 20){
						alert("닉네임은 최대 20자리까지 가능합니다.");
						return;
					}
				},
				error : function(){
					alert("서버 요청 실패");
				}
			});
			
			// 4. userPhone 유효성 검증
			var userPhone = $("#userPhone").val();
			
			if(userPhone.length == 11){
				console.log("검증완료");
			}else{
				alert("'-'를 제외하고 11자리를 입력해 주시기 바랍니다.");
				return;
			}
			// phoneCheck 유효성 검증
			var phoneCheck = $("#phoneCheck").val();
			
			$.ajax({
				url : "/user/userPhoneCheck",
				method : "POST",
				data : {userPhone : userPhone},
				dataType : 'json',
				success : function(result){
					
					if(result == 0){
					console.log("당신의 휴대폰입니다.");
					}
					else{
						console.log("휴대폰이 다른 상태...");
						if(phoneCheck.length == 5){
							//alert("phoneCheck 통과");
						}else{
							alert("휴대폰 체크를 다시 해 주시기 바랍니다.");
							return;
						}
					}
				},
				error : function(){
					alert("서버 요청 실패");
				}
			});
				
			// 5. userBirth 유효성 검증
			var userBirth=$("#birthday").val();
			
			if(userBirth == null){
				alert("생일을 입력 해 주세요.");
				return;
				
			}else{
				var value = userBirth.replace(/-/g, "");
				$("#userBirth").val(value);
			}
			
			// 8. gender 유효성 검증
			// PATH!!
			
			// 7. userAddr 유효성 검증
			var addr1 = $("input[name='addr1']").val();
	 		var addr2 = $("input[name='addr2']").val();
			var addr = addr1+"   "+addr2;
			$("#userAddr").val(addr);
			
			if(addr.length < 2){
				alert("주소를 입력해 주시기 바랍니다.");
				return;
			}else{
				//alert("7. userAddr 통과");
			}
			
			
			
			// 9. userEmail 유효성 검증
			var userEmail = $("#userEmail").val();
			var emailCheck = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			
			if(emailCheck.test(userEmail)){
			}else if(userEmail.length > 40 ){
				alert("이메일은 최대 40자 까지 입력 가능합니다.");
				return;
			}else{
				alert("유효하지 않은 이메일입니다.");
				return;
			}
			
			// 10. 구단코드 유효성 검증
			// PATH!!!
			
			// 11. 프로필 사진 유효성 검증
			// PATH!!!
			
			// ajax(User) -> Controller
			
/* 			var userImageSearch = $("#userImage").val();
			
			if(userImageSearch == null){
				userImageSearch = $("input[name]")
			} */
			
			var user = {
				userId : $("input[name='userId']").val(),
				password : $("#password").val(),
				userName : $("#userName").val(),
				userPhone : $("#userPhone").val(),
				phoneCheck : $("#phoneCheck").val(),
				userBirth : $("#userBirth").val(),
				userAddr : $("#userAddr").val(),
				gender : $("input[name='gender']:checked").val(),
				userEmail : $("#userEmail").val(),
				userNickName : $("input[name='userNickName']").val(),
				teamCode : $("#teamCode").val(),
				userImage : $("input[name='userImage']").val()
			};

			$.ajax({
				url:"/users/updateUser",
				method:"POST",
				data: JSON.stringify(user),
				contentType: "application/json",
  				success: function(response) {
    				window.location.href="/users/getUser";
  				},
  				error: function(xhr, status, error) {
    			// 요청 처리 중 에러가 발생한 경우 실행할 로직
    			console.log("서버 오류 발생:", error);
  				}
			});
		};
	 
	// 업데이트 버튼
    $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "#userUpdate" ).on("click" , function() {
			fncUpdateUser();
		});
	});
	
/* 	// 뒤로 가기 버튼
	$(function(){
		
		$("#backback").on("click", function(){
			
			//alert("가입 취소");
			window.location.href="/user/loginTest(new).jsp";
			
		});
	}); */
	
	$(function(){
		
		//drag & drop
		var dropZone = $('#drop-area');
		//dropZone.hide();
		
		$(document).on('dragenter', function(event) {
			dropZone.addClass('active');
			console.log("작동중");
			dropZone.show();
		});
		
		dropZone.on('dragover', function(event) {
			console.log("작동중 11111");
			event.preventDefault();
		});
		
		dropZone.on('drop', function(event){
			event.preventDefault();
	 		handleFileSelect(event.originalEvent);
	 		//dropZone.hide();
	 	});
	 	
		$(document).on('dragleave', function(event) {
			if (event.originalEvent.pageX <= 0 || event.originalEvent.pageY <= 0) {
				event.preventDefault();
				dropZone.removeClass('active');
				dropZone.hide();
			}
		});
		 
		function handleFileSelect(event) {
			    event.stopPropagation();
			    event.preventDefault();
			    dropZone.removeClass('active');
			    
			    var files = event.target.files || event.dataTransfer.files;
			    // 파일 업로드 처리 로직을 여기에 구현하세요.
			    if (files.length > 0) {
			    	var formData = new FormData();
			        formData.append('image', files[0]);
			        $.ajax({
			            url: "http://223.130.133.54:3000/image/user",
			            type: "POST",
			            processData: false,
			            contentType: false,
			            data: formData,
			            dataType: "json",
			            success: function(data, status) {
			            	console.log(data);
			            	if(data == null){
				            	//alert("다시 드롭 해 주세요.");
			            	}else{
			            		console.log(data.image_path);
			            		
			            		// 바꾼 이미지 재등록
			            		document.getElementById("userImage").value = "";
			            		var newValue = data.image_path;
			            		
			            		document.getElementById("userImage").value = newValue;
			            		
			            		// hidden 속성 추가
			            		/* var newDiv = document.createElement("div");
			            		var hiddenDiv = document.createElement('input');
			               		hiddenDiv.type = "hidden";
			            		hiddenDiv.value = data.image_path;
			            		hiddenDiv.id = 'userImage';
			            		newDiv.appendChild(hiddenDiv);
			            		document.body.appendChild(newDiv); */
			            		
			            		
			            		// 이미지 미리보기
			            		var previewImage = data.image_path;
			            		
			            		var img = document.createElement("img");
			            		img.src = previewImage;
			            		img.alt = "이미지 미리보기";
			            		img.style.border = "none";
			            		img.style.width = "157px";
			            		img.style.height = "103px";
			            		
			            		// 이미지 미리보기 컨테이너 exampleText 자식으로 생성
			            		var previewContainer = document.getElementById("drop-area");
			            		previewContainer.appendChild(img);
			            		
			            		
			            		// 이미지 미리보기
			            		$("#previewImage").empty();
			            		var imgElement = $("#previewImage");
			            		imgElement.attr('src', previewImage);
			            		$("#exampleText").text('');
			            			
			            	}
			            }
			          });
			    }
			}
		
		});
	
	</script>
<jsp:include page="/common/topBar.jsp"></jsp:include>
<body id="mainBody" class="bgother">
<div id="wrap" class="wrap naverid">
    <!-- skip navigation -->
    <div class="u_skip"><a href="https://nid.naver.com/user2/help/myInfoV2?lang=ko_KR#container">본문 바로가기</a></div>
    <!-- //skip navigation -->

<header class="header" role="banner">
    <div class="header_home">

    <!--N로고/네이버ID-->
    <div class="gnb_area">
        	<a href="/main.jsp"></a>
            <span class="blind">야구ROUTE</span>
    </div>


    <!--프로필-사진,아이디,메일주소,2단계인증알림-->
    <div class="profile_area">
        <div class="profile_inner">
            <a href="#" onclick="updateUserFunction()" class="photo">
                <img src="${user.userImage}" onerror="this.src=&#39;/images/user/defaultProfile.png&#39;" width="84" height="84" alt="프로필 이미지">
                <span class="photo_edit"></span>
            </a>
            <div class="profile">
                <p class="useid">${user.userNickName}</p>
                <p class="userId" id="userId">${user.userId}</p>
            </div>
        </div>
        
        <input type="hidden" name="userImage" id="userImage" value="${user.userImage}">
        
        <a href="/users/logout" style="text-align: center; width: 10px; color: gray;
    border-radius: 28px;
    display: inline-block;
    cursor: pointer;
    font-family: Arial;
    font-size: 16px;
    padding: 6px 15px;
    text-decoration: none;
    border: 1px solid #cdd3d8;
    width: 120px;
    font-family: 'Gwangyang';">로그아웃</a>
    </div>

    <div id="headerLeft" class="header_left" aria-hidden="false">

        <ul class="left_menu" role="menu">
        	<li>
                <a href="#" class="left_item" role="menuitem" onclick="getUserFunction()" aria-current="">
                    <div class="menu_text "><b>내 정보 보기</b></div>
                </a>
            </li>
            <li>
                <a href="#" class="left_item" role="menuitem" onclick="updateUserFunction()" aria-current="">
                    <div class="menu_text "><b>내 정보 수정</b></div>
                </a>
            </li>
            <!-- <li>
                <a href="https://nid.naver.com/user2/help/myInfoV2?m=viewSecurity&amp;lang=ko_KR" class="left_item" role="menuitem" onclick="nclk(this,&#39;lnb.protect&#39;,&#39;&#39;,&#39;&#39;,event)" aria-current="">
                    <div class="menu_text ">이전 화면</div>
                </a>
            </li> -->
            <li>
                <a href="#" class="left_item" role="menuitem" onclick="withDrawFunction()" aria-current="">
                    <div class="menu_text "><b>회원탈퇴</b></div>
                </a>
            </li>
            <li>
                <a href="#" class="left_item" role="menuitem" onclick="mainGoFunction()" aria-current="">
                    <div class="menu_text "><b>메인으로</b></div>
                </a>
            </li>
        </ul>
        <ul class="left_link">
           <!--  <li><a href="https://nca.naver.com/chat/account/view" class="left_item" onclick="nclk(this,&#39;fot.smartbot&#39;,&#39;&#39;,&#39;&#39;,event)">
                    <div class="link_text">스마트봇 상담</div>
                </a></li>
            <li><a href="https://talk.naver.com/ct/wc4bsu#nafullscreen" class="left_item" onclick="nclk(this,&#39;fot.membertalktalk&#39;,&#39;&#39;,&#39;&#39;,event)">
                    <div class="link_text">회원톡톡</div>
                </a></li> -->
        </ul>

        <!-- footerLeft -->
        <footer class="left_footer" role="contentinfo">
            <ul class="footer_list">
                <li>
                    <a href="/user/private.html" class="footer_item" onclick="nclk(this,&#39;fot.privarypolicy&#39;,&#39;&#39;,&#39;&#39;,event)">
                        <span class="footer_text bold">개인정보처리방침</span>
                    </a>
                </li>
                <li>
                    <a href="/user/TermsofUse.html" class="footer_item" onclick="nclk(this,&#39;fot.termsofuse&#39;,&#39;&#39;,&#39;&#39;,event)">
                        <span class="footer_text">이용약관</span>
                    </a>
                </li>
                <li>
                    <a href="/images/user/rockseongface.jpg" class="footer_item" onclick="nclk(this,&#39;fot.termsofuse&#39;,&#39;&#39;,&#39;&#39;,event)">
                        <span class="footer_text"><b>야구Route CEO소개</b></span>
                    </a>
                </li>
            </ul>
        </footer>
        <!-- //footerLeft -->

    </div>
    <!--//-->

    </div>
</header>
    <div id="container" class="container">
        <!-- container -->
        <div id="content" class="content">
            <div class="naverid_wrap" role="main" style="width: 450px;">
</script>
    <div id="container" class="container">
        <!-- container -->
        <div id="content" class="content">
            <div class="subindex_wrap" role="main">

                <div id="headerTop" class="path_area">
                    <div id="gnb" class="" style="float:right;">
                    </div>
                </div>
                
      <div class="container_1">
            <div class="col-md-6">
                <div class="subject" style="text-align: center !important; margin-bottom: 25px; font-weight: bold;">
                    <div class="wrap">
                        <h3>내 정보 수정</h3>
                    </div>
                </div>
		</div>
</div>
<!--CONTACT WRAP BEGIN-->
    	<div class="container_1">
        	<div class="row">
                    		<form>
                                <div class="form-inline">
                                    <label for="userId" id="userIdNone" style="display: block">
                                    	<a class="weaving" style="margin-bottom: 10px; font-weight: bold; font-size: medium; ">아이디 <br>
                                        <input type="text" name="userId" style="width: 405px; height: 40px;"  placeholder="아이디" readonly="readonly" value="${user.userId}">
                                        </a>
                                    </label>
                                    	<font id="id_use" size="2"></font>
                                </div>
                                <div class="form-inline" id="passwordNone" style="display: block">
								<label for="password">
									<a class="weaving" style="margin-bottom: 10px; font-weight: bold; font-size: medium;">패스워드 <br>
									<input type="password" name="password" id="password" style="border: 1px solid #0e55c6; width: 405px; height: 40px; "  placeholder="패스워드" value="${user.password}">
									</a>
								</label>
									<font id="password_use" size="2"></font>
								</div>
								<div class="form-inline" id="passwordCheckNone" style="display: block">
                                    <label for="passwordCheck" style="display: block">
                                    	<a class="weaving" style="margin-bottom: 10px; font-weight: bold; font-size: medium; ">패스워드 체크<br>
                                        <input type="password" name="passwordCheck" id="passwordCheck" style="width: 405px; height: 40px; border: 1px solid #0e55c6;" disabled placeholder="패스워드 확인" value="${user.password }">
                                        </a>
                                    </label>
                                    	<font id="passwordCheck_use" size="2"></font>
                                </div> 
                            	<div class="form-inline">
                                    <label for="passwordCheck" id="userNameNone" style="display: block">
                                    	<a class="weaving" style="margin-bottom: 10px; font-weight: bold; font-size: medium; height: 40px;">이름<br>
                                        <input type="text" id="userName" name="userName" style="width: 405px; height: 35px;" placeholder="이름" value="${user.userName}">
                                        </a>
                                    </label>
                                    	<font id="userName_use" size="2"></font>
                            	</div>
								
								<div class="form-inline">
                                    <label for="nickname">
                                    	<a class="weaving" style="margin-bottom: 10px; font-weight: bold; font-size: medium;">닉네임<br>
                                        <input type="text" id="nicknameCheck" name="userNickName" style="width: 405px; height: 35px;" placeholder="닉네임" value="${user.userNickName}"/>
                                        </a>
                                    </label>
                                    	<font id="nickname_use" size="2"></font>
                            	</div>	
                                <div class="form-inline" style="color: #1a146f; font-size: medium; font-weight: bold;">
                                		<label for="userBirth" id="birthdayNone" style="display: block">
                                    	생년월일&nbsp;
                                        <input type="date" name="birthday" id="birthday" style="width: 200px; height: 35px; border: groove;" placeholder="생년월일" value="">
                                        <input type="hidden" name="userBirth" id="userBirth">
                                        &nbsp;&nbsp;
                                        </label>
                                        <label for="gender" id="genderNone" style="display: block">
                                        <a class="sungbyul">
                                        <label class="byul">남성
                                        <input type="radio" name="gender" value="M" ${user.gender == 'M' ? 'checked' : ''}>
                                        </label>
                                        <label class="byul">여성
                                        <input type="radio" name="gender" value="W" ${user.gender == 'W' ? 'checked' : ''}>
                                        </label>
                                        </a>
                                        </label>
                                </div>
                                <div class="form-inline">
                            		<label for="userPhone" id="phoneNone" style="display: block;">
                            		<a class="weaving" style="margin-bottom: 10px; font-weight: bold; font-size: medium;">휴대폰 번호<br>
		    						<input type="text" name="userPhone" id="userPhone" style="width: 270px; height: 35px; margin-bottom: 10px; margin-block: auto;" placeholder="휴대폰 번호" value="${user.userPhone}"/>&nbsp;&nbsp;
		    						</a>
		    						<button type="button" id="phoneButton" style=" background-color: #2c74bb; border-radius: 21px;" >인증번호 발송</button>
		    						</label>
                            	</div>
                            	<div class="form-inline">
                            		<label>
                            		<a id="phoneCheckId" style="display: none;">
		    						<input type="text" id="phoneCheck" name="userPhoneCheck" style="width: 270px; height: 35px; margin-bottom: 10px;" placeholder="인증번호를 입력해주세요."/>&nbsp;&nbsp;
		    						<button type="button" id="phoneCheckButton" style="background-color: slategray;">인증번호 확인</button>
		    						</a>
		    						</label>
                            	</div>
                            	<div class="form-inline">
                            		<label for="email" id="emailNone" style="display: block;">
                            		<a class="weaving" style="margin-bottom: 10px; font-weight: bold; font-size: medium;">이메일<br>
		    						<input type="text" name="userEmail" id="userEmail" style="width: 405px; height: 35px; margin-bottom: 10px;" placeholder="이메일" value="${user.userEmail}"/>
		    						</a>
		    						</label>
                            	</div> 
                            	<div class="form-inline">
                            		<label>
                            		<a class="weaving" style="margin-bottom: 10px; font-weight: bold; font-size: medium;">주소<br>
		    						<input readonly disabled type="text" id="sample6_address" name="addr1" style="width: 270px; height: 35px; margin-bottom: 10px; margin-block: auto;" value="${user.userAddr}" placeholder="주소">&nbsp;&nbsp;
		    						<button type="button" onclick="sample6_execDaumPostcode()" style="margin-bottom: 10px; background-color: #2c74bb; border-radius: 21px;">주소&nbsp;선택</button>
		    						<input type ="hidden" id="userAddr" name="userAddr"> 
									</a>
		    						</label>
                            	</div>
                            	<div class="form-inline">
                            		<label>
		    						<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr2" style="width: 405px; height: 35px;">
		    						</label>
                            	</div>
                            	<a class="weaving" style="margin-bottom: 10px; font-weight: bold; font-size: medium;">선호구단<br>
                            	<div class="form-inline">
                            	<label>
                            		<select class="dropdown" id="teamCode" name="teamCode" style="width: 400px; border: 1px solid #0e55c6;">
                            			<option value="NN" ${user.teamCode == 'NN' ? 'selected' : ''}>선택하지 않음</option>
      									<option value="LG" ${user.teamCode == 'LG' ? 'selected' : ''}>LG 트윈스</option>
      									<option value="SS" ${user.teamCode == 'SS' ? 'selected' : ''}>삼성 라이온즈</option>
      									<option value="LT" ${user.teamCode == 'LT' ? 'selected' : ''}>롯데 자이언츠</option> 
                                    	<option value="OB" ${user.teamCode == 'OB' ? 'selected' : ''}>두산 베어스</option>
                                    	<option value="NC" ${user.teamCode == 'NC' ? 'selected' : ''}>NC 다이노스</option>
                                    	<option value="HT" ${user.teamCode == 'HT' ? 'selected' : ''}>KIA 타이거즈</option> 
                                    	<option value="SK" ${user.teamCode == 'SS' ? 'selected' : ''}>SSG 랜더스</option> 
                                    	<option value="WO" ${user.teamCode == 'WO' ? 'selected' : ''}>키움 히어로즈</option> 
                                    	<option value="HH" ${user.teamCode == 'HH' ? 'selected' : ''}>한화 이글스</option> 
                                    	<option value="KT" ${user.teamCode == 'KT' ? 'selected' : ''}>KT Wiz</option> 
                                    </select>
                                    </label>
                                    </div>
                                    </a>
                                    
                                <a style="font-weight: 600">프로필 사진<br> </a>
								  <div class="dropp">
								    <div class="drop-area" id="drop-area" style="display: block !important;">
								      <!-- <img src="" id="previewImage"> -->
								      <p class="text" id="exampleText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;png, jpg, jpeg &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1MB이하 첨부</p>
								    </div>
								  </div>
								  <!-- <button id="btn-upload-file">서버전송</button> -->
 								
 								<input type="hidden" name="userPoint" id="userPoint" value="${user.userPoint}" readonly>
 								
                            	<div class="form-group">
                            	<label>
                                <button type="button" class="btn-upload-file" id="userUpdate">수정</button>
                                </label>
                                </div>
                               </form>
<script type="text/javascript" src="/js/library/jquery.js"></script>
<script type="text/javascript" src="/js/library/jquery-ui.js"></script>
<script type="text/javascript" src="/js/library/bootstrap.js"></script>
<script type="text/javascript" src="/js/library/jquery.sticky.js"></script>
<script type="text/javascript" src="/js/library/jquery.jcarousel.js"></script>
<script type="text/javascript" src="/js/library/jcarousel.connected-carousels.js"></script>
<script type="text/javascript" src="/js/library/owl.carousel.js"></script>
<script type="text/javascript" src="/js/library/progressbar.js"></script>
<script type="text/javascript" src="/js/library/jquery.bracket.min.js"></script>
<script type="text/javascript" src="/js/library/chartist.js"></script>
<script type="text/javascript" src="/js/library/Chart.js"></script>
<script type="text/javascript" src="/js/library/fancySelect.js"></script>
<script type="text/javascript" src="/js/library/isotope.pkgd.js"></script>
<script type="text/javascript" src="/js/library/imagesloaded.pkgd.js"></script>

<script type="text/javascript" src="/js/jquery.team-coundown.js"></script>
<script type="text/javascript" src="/js/matches-slider.js"></script>
<script type="text/javascript" src="/js/header.js"></script>
<script type="text/javascript" src="/js/matches_broadcast_listing.js"></script>
<script type="text/javascript" src="/js/news-line.js"></script>
<script type="text/javascript" src="/js/match_galery.js"></script>
<script type="text/javascript" src="/js/main-club-gallery.js"></script>
<script type="text/javascript" src="/js/product-slider.js"></script>
<script type="text/javascript" src="/js/circle-bar.js"></script>
<script type="text/javascript" src="/js/standings.js"></script>
<script type="text/javascript" src="/js/shop-price-filter.js"></script>
<script type="text/javascript" src="/js/timeseries.js"></script>
<script type="text/javascript" src="/js/radar.js"></script>
<script type="text/javascript" src="/js/slider.js"></script>
<script type="text/javascript" src="/js/preloader.js"></script>
<script type="text/javascript" src="/js/diagram.js"></script>
<script type="text/javascript" src="/js/bi-polar-diagram.js"></script>
<script type="text/javascript" src="/js/label-placement-diagram.js"></script>
<script type="text/javascript" src="/js/donut-chart.js"></script>
<script type="text/javascript" src="/js/animate-donut.js"></script>
<script type="text/javascript" src="/js/advanced-smil.js"></script>
<script type="text/javascript" src="/js/svg-path.js"></script>
<script type="text/javascript" src="/js/pick-circle.js"></script>
<script type="text/javascript" src="/js/horizontal-bar.js"></script>
<script type="text/javascript" src="/js/gauge-chart.js"></script>
<script type="text/javascript" src="/js/stacked-bar.js"></script>

<script type="text/javascript" src="/js/library/chartist-plugin-legend.js"></script>
<script type="text/javascript" src="/js/library/chartist-plugin-threshold.js"></script>
<script type="text/javascript" src="/js/library/chartist-plugin-pointlabels.js"></script>

<script type="text/javascript" src="/js/treshold.js"></script>
<script type="text/javascript" src="/js/visible.js"></script>
<script type="text/javascript" src="/js/anchor.js"></script>
<script type="text/javascript" src="/js/landing_carousel.js"></script>
<script type="text/javascript" src="/js/landing_sport_standings.js"></script>
<script type="text/javascript" src="/js/twitterslider.js"></script>
<script type="text/javascript" src="/js/champions.js"></script>
<script type="text/javascript" src="/js/landing_mainnews_slider.js"></script>
<script type="text/javascript" src="/js/carousel.js"></script>
<script type="text/javascript" src="/js/video_slider.js"></script>
<script type="text/javascript" src="/js/footer_slides.js"></script>
<script type="text/javascript" src="/js/player_test.js"></script>

<script type="text/javascript" src="/js/main.js"></script>
</body>

</html>