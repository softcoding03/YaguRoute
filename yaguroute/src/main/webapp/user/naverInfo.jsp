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
	.youBirth {
		text-align: center;
	}
	.pointgogo {
		padding-right: 20px !important;
	}
</style>

<script type="text/javascript">
	
</script>

<body onclick="clearDocs();gnbClose();" id="mainBody" class="bgother">
<div id="wrap" class="wrap naverid">
    <!-- skip navigation -->
    <div class="u_skip"><a href="https://nid.naver.com/user2/help/myInfoV2?lang=ko_KR#container">본문 바로가기</a></div>
    <!-- //skip navigation -->

<header class="header" role="banner">
    <div class="header_home">

    <!--N로고/네이버ID-->
    <div class="gnb_area">
        <img src="/images/baseball/yaguRoute.png" class="logo" style="width: 90px; height: 90px;"></img>
        	<a href="/main.jsp"></a>
            <span class="blind">야구ROUTE</span>
    </div>


    <!--프로필-사진,아이디,메일주소,2단계인증알림-->
    <div class="profile_area">
        <div class="profile_inner">
            <a href="https://nid.naver.com/user2/help/myInfoV2?lang=ko_KR#" onclick="changeImage()" class="photo">
                <img src="/images/user/rockseongface.jpg" width="84" height="84" alt="프로필 이미지">
                <span class="photo_edit"></span>
            </a>
            <div class="profile">
                <p class="useid">ROCKSEONG</p>
                <p class="usemail">happykimdw[아이디]</p>
            </div>
        </div>
    </div>

    <div id="headerLeft" class="header_left" aria-hidden="false">

        <ul class="left_menu" role="menu">
            <li>
                <a href="https://nid.naver.com/user2/help/myInfoV2?m=viewProfile&amp;lang=ko_KR" class="left_item" role="menuitem" onclick="nclk(this,&#39;lnb.info&#39;,&#39;&#39;,&#39;&#39;,event)" aria-current="">
                    <div class="menu_text "><b>내 정보 수정</b></div>
                </a>
            </li>
            <!-- <li>
                <a href="https://nid.naver.com/user2/help/myInfoV2?m=viewSecurity&amp;lang=ko_KR" class="left_item" role="menuitem" onclick="nclk(this,&#39;lnb.protect&#39;,&#39;&#39;,&#39;&#39;,event)" aria-current="">
                    <div class="menu_text ">이전 화면</div>
                </a>
            </li> -->
            <li>
                <a href="https://nid.naver.com/user2/help/myInfoV2?m=viewManageHistory&amp;lang=ko_KR" class="left_item" role="menuitem" onclick="nclk(this,&#39;lnb.history&#39;,&#39;&#39;,&#39;&#39;,event)" aria-current="">
                    <div class="menu_text "><b>회원탈퇴</b></div>
                </a>
            </li>
        </ul>
        <ul class="left_link">
            <li><a href="https://nca.naver.com/chat/account/view" class="left_item" onclick="nclk(this,&#39;fot.smartbot&#39;,&#39;&#39;,&#39;&#39;,event)">
                    <div class="link_text">스마트봇 상담</div>
                </a></li>
            <li><a href="https://talk.naver.com/ct/wc4bsu#nafullscreen" class="left_item" onclick="nclk(this,&#39;fot.membertalktalk&#39;,&#39;&#39;,&#39;&#39;,event)">
                    <div class="link_text">회원톡톡</div>
                </a></li>
        </ul>

        <!-- footerLeft -->
        <footer class="left_footer" role="contentinfo">
            <ul class="footer_list">
                <li>
                    <a href="https://policy.naver.com/rules/privacy.html" class="footer_item" onclick="nclk(this,&#39;fot.privarypolicy&#39;,&#39;&#39;,&#39;&#39;,event)">
                        <span class="footer_text bold">개인정보처리방침</span>
                    </a>
                </li>
                <li>
                    <a href="https://policy.naver.com/rules/service.html" class="footer_item" onclick="nclk(this,&#39;fot.termsofuse&#39;,&#39;&#39;,&#39;&#39;,event)">
                        <span class="footer_text">이용약관</span>
                    </a>
                </li>
                <li>
                    <a href="https://policy.naver.com/rules/service.html" class="footer_item" onclick="nclk(this,&#39;fot.termsofuse&#39;,&#39;&#39;,&#39;&#39;,event)">
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
<script>
    var rurl = encodeURIComponent(document.location.href);
    var rawRurl = document.location.href;
    var myInfoV2HomeUrl = encodeURIComponent("https://nid.naver.com/user2/help/myInfoV2?lang=" + "ko_KR");

    // 작은 화면 - 영문일 때 메뉴 텍스트 길이 짤리지 않도록
    if (window.innerWidth <= 385) {
        var lnbAreaScrollLeft = $('#lnbArea').scrollLeft();
    }

    function changeImage() {
        nclk(this,'nid.prfedit','','',event);
        document.location.href = "/mobile/user/help/naverProfile?m=initModifyProfile&lang=ko_KR&returnUrl=" + rurl;
    }

    function landscapeHandler() {
        if (window.innerWidth <= window.innerHeight) {
            $('body').removeClass('landscape');
            $('div .container').addClass('floating');
        } else {
            $('body').addClass('landscape');
            $('div .container').removeClass('floating');
        }
    }

    function logout() {
        nclk(this,'fot.logout','','',event);
        if (confirm("로그아웃 하시겠습니까?") == true) {
            var returnUrl;
            returnUrl = "https://nid.naver.com/nidlogin.logout?svctype=262144&url=" + myInfoV2HomeUrl;
            $(location).attr('href', returnUrl);
        }
    }

    function goHelpPage() {
        nclk(this,'fot.help','','',event);
        document.location.href = "https://m.help.naver.com/support/alias/membership/p.membership/5640.naver";
    }

    function changeLanguage() {
        var baseUrl = "/user2/help/myInfoV2?";


        nclk(this,'fot.english','','',event);
        baseUrl += "lang=en_US";
        document.location.href = baseUrl;
    }

    function goNaverMain() {
        nclk(this,'fot.naver','','',event);
        document.location.href = "https://m.naver.com";
    }

    function goSimpleSignIn() {
        nclk(this,'fot.simplesignin','','',event);
        document.location.href = "https://nid.naver.com/nidlogin.login?svctype=262144&url=" + myInfoV2HomeUrl;
    }
</script>
    <div id="container" class="container">
        <!-- container -->
        <div id="content" class="content">
            <div class="naverid_wrap" role="main">
</script>
    <div id="container" class="container">
        <!-- container -->
        <div id="content" class="content">
            <div class="subindex_wrap" role="main">

                <div id="headerTop" class="path_area">
                    <div id="gnb" class="" style="float:right;">
                        <script type='text/javascript' charset='utf-8'
                                src='https://static.nid.naver.com/template/gnb_utf8.nhn?2023. 6. 7'>
                        </script>
                    </div>
                </div>
                <div class="subindex_item">
    <div class="subindex_greenbox">
        <div class="myprofile">
            <div class="info_title">
                <h3 class="title_text">기본정보</h3>
                <a href="javascript:;" id="info1" class="link_info" aria-expanded="false"><span
                            class="blind">도움말</span></a>

                <div id="info1ToolTip" class="info_tooltip" aria-hidden="true" style="display: none;">
                    <strong class="info_head">사용자 이름</strong>
                    <p class="info_desc">유료, 게임 등의 일부 서비스를 이용하려면 “본인확인”을 통한 실명 정보 확인이 필요합니다. 이름, 생년월일, 성별 정보가 변경되었다면 수정도 할 수 있습니다.</p>
                    <strong class="info_head">연락처 이메일</strong>
                    <p class="info_desc">네이버 서비스의 변경/종료 등 대부분의 네이버 안내에 사용합니다.</p>
                    <strong class="info_head">본인확인 이메일</strong>
                    <p class="info_desc">아이디, 비밀번호 찾기, 로그인이 안되는 경우 등 본인확인이 필요한 경우 사용합니다.</p>
                    <button type="button" id="infoExit1" class="btn_exit"><span class="blind">닫기</span></button>
                </div>

            </div>
            <ul class="myinfo_area">
                <li>
                    <div class="myphoto">
                        <img src="/images/teamEmblem/KT.png"
                             width="56" height="56" alt="내 프로필 이미지">
                    </div>
                </li>
                <li>
                    <div class="myaccount">
                        <div class="myname">
                            <div class="name_text">최성락</div>
                            <div style="text-align: left;"> [남] </div>
                            <button type="button" class="btn_edit" onclick="changeName()">
                                <span class="text">내 정보 수정</span>
                            </button>
                        </div>
                        <div class="myaddress">happykimdw@naver.com</div>
                    </div>
                </li>
            </ul>
        </div>

        <ul class="subindex_row">
            <li>
                <div id="phoneNoRegDiv" class="row_item phone ">
                    <span id="phoneNoRegSpan"
                          class="item_text"> 010-9866-9138</span>
                </div>
            </li>

            <li>
                <div class="row_item mail ">
                    <span id="myLetterEmailRegSpan"
                          class="item_text"> happykimdw@naver.com </span>
                </div>
                <div id="pswdEmailRegDiv" class="row_item mail not">
                    <span id="pswdEmailRegSpan"
                          class="item_text" style="color: #000000;">본인확인 이메일 없음</span>
                </div>
            </li>
        </ul>
    </div>
</div>
<!--//-->

<!--프로모션 정보수신 동의-->
<div class="subindex_item">
    <div class="head_title">
        <h2 class="subindex_title">프로모션 정보수신 동의</h2>
        <a href="javascript:;" id="info2" class="link_info" aria-expanded="false"><span class="blind">도움말</span></a>

        <div id="info2ToolTip" class="info_tooltip" aria-hidden="true" style="display: none;">
            <strong class="info_head">네이버 서비스 및 제휴 이벤트, 혜택, 맞춤형 정보를 보내 드려요.</strong>
            <p class="info_desc">
								주요 공지, 보안, 이벤트 당첨에 대해서는 <em class="accent">수신 동의 여부와 관계 없이 알려 드려요.</em>
							</p>
            <p class="info_desc">본 동의는 네이버 공통 서비스에 한해 유효하며, 개별로 수신 동의를 받는 일부 서비스는 해당 서비스의 동의 상태를 따릅니다. 수신 동의 상태는 최대 2일 이내에 반영됩니다.</p>
            <button type="button" id="infoExit2" class="btn_exit"><span class="blind">닫기</span></button>
        </div>

    </div>
    <div class="subindex_box">
        <ul class="subindex_row">
            <li>
                <div class="row_item phone">
                    <span class="item_text">포인트</span>
                    <a style="font-size: 17px; font-weight: bolder;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;50,000</a>&nbsp;Point
                    <div class="btn_switch">
                        <input type="checkbox" id="adMobileCheck" class="switch_checkbox">
                        <!-- <label for="adMobileCheck" class="switch_btn">
                            <span id="adMobileCheck_toggle_switch_on" class="switch_on" role="checkbox"
                                  aria-checked="false">ON</span>
                            <span id="adMobileCheck_toggle_switch_off" class="switch_off" role="checkbox"
                                  aria-checked="true">OFF</span>
                        </label> -->
                    </div>
                </div>
            </li>

            <!-- <li>
                <div class="row_item mail">
                    <span class="item_text">가입일자</span>
                    <div class="btn_switch">
                        <input type="checkbox" id="adEmailCheck" class="switch_checkbox"
                               checked>
                        <label for="adEmailCheck" class="switch_btn">
                            <span id="adEmailCheck_toggle_switch_on" class="switch_on" role="checkbox"
                                  aria-checked="true">ON</span>
                            <span id="adEmailCheck_toggle_switch_off" class="switch_off" role="checkbox"
                                  aria-checked="false">OFF</span>
                        </label>
                    </div>
                </div>
            </li> -->
        </ul>
    </div>
</div>

<!--생일 관리-->
<div class="subindex_item">
	<h2 class="subindex_title">최성락님의 생일</h2>
    <div class="subindex_onebox">	
        <div class="onebox_title desc">  
        </div>
        <div class="youBirth"> <h4>최성락님의 생일은 <b>8월14일</b>입니다.<br> 항상 좋은 하루 보내시고 건강하세요~</h4></div>
    </div>
</div>

<!--배송지 관리-->
<!-- <div class="subindex_item">
    <div class="subindex_onebox">
        <div class="onebox_title desc">
            <h2 class="subindex_title">배송지 관리</h2>
        </div>
        <a href="https://new-m.pay.naver.com/member/shipping/list" class="link_right" onclick="nclk(this,'imn.addcheck','','',event)">
                    <span class="case">총4건</span>
        </a>
        <div class="subindex_desc">쇼핑, 예약 등에서 사용하신 배송지를 관리할 수 있어요.</div>
    </div>
</div> -->

<!--개인정보 이용내역-->
<!-- <div class="subindex_item">
    <div class="subindex_onebox">
        <div class="onebox_title">
            <h2 class="subindex_title">개인정보 이용내역</h2>
            <a href="javascript:;" id="info3" class="link_info" aria-expanded="false"><span class="blind">도움말</span></a>
            <div id="info3ToolTip" class="info_tooltip" aria-hidden="true" style="display: none;">
                <p class="info_desc">내 개인정보가 어떻게 이용되고 있는지 확인할 수 있어요.</p>
                <button type="button" id="infoExit3" class="btn_exit"><span class="blind">닫기</span></button>
            </div>

        </div>
        <button type="button" id="personalInfoHistoryButton" class="btn_edit" onclick="nclk(this,'imn.privacychk','','',event)">
            <span class="text">조회</span>
        </button>
    </div>
</div> -->

<!--회원탈퇴-->
<!-- <div class="subindex_link">
    <div class="drop_link">
        <a href="javascript:;" class="btn_link" onclick="goMemberDelete()">
            <span class="text">회원탈퇴</span>
        </a>
    </div>
		</div>  
		</div>
      </div>
        //container
    </div>
</div> -->
<form id="fm" name="fm">
    <input type="hidden" name="token_help" id="token_help" value="UB2gb2EwTHhhtB31">
    <input type="hidden" name="isEmailYn" id="isEmailYn" value="N">
    <input type="hidden" name="isPhoneYn" id="isPhoneYn" value="Y">
    <input type="hidden" name="phoneAuthYn" id="phoneAuthYn" value="N">
    <input type="hidden" name="mobileYn" id="mobileYn" value="Y">
    <!--팝업딥드-->
    <div id="dimmed" class="dimmed" aria-hidden="true" style="display:none;"></div>
    <!--팝업내용-->
    <div id="phoneNumberChangePopUpLayer" class="layer" style="display:none;">
        <div class="popup_layer">
            <div class="popup_layer_inner">
                </div>
            </div>
        </div>
    </div>
</form>
<form name="formAuth" method="post" action="https://nid.naver.com/user2/help/changeUserInfo?m=actionUserMobile">
    <input type="hidden" name="authRes" value="">
    <input type="hidden" name="token_help" value="UB2gb2EwTHhhtB31">
</form>

<script>
    var isValid = '';
    var emailType = '';

    $(document).ready(function () {
        $('#myLetterEmailAuthGuide, #pswdEmailAuthGuide').click(function () {
            var authGuideTxt = '#' + $(this).attr('id')
                + 'Txt';
            var $authGuideTxt = $(authGuideTxt);
            if ($authGuideTxt.css('display') === 'none') {
                $authGuideTxt.css('display', 'block');
            } else {
                $authGuideTxt.css('display', 'none');
            }
        });

        if (isValid !== "Y") return;

        if (emailType === "myLetterEmail") {
            showMyLetterEmailChangePopUp();
            return;
        }

        showPswdEmailChangePopUp();
    });

    function showPhoneNumberChangePopUp() {
        var clickCode = "imn";
            clickCode = "nid";

        displayObj('dimmed');
        displayObj('phoneNumberChangePopUpLayer');
        document.getElementById("wrap").classList.add("is_fixed");
        resetInternationalCode();
        if (document.getElementById("isPhoneYn").value === "Y") {
            nclk(this, clickCode + '.mphoneedit', '', '', event)
            document.getElementById("phoneNoForm").style.display = "block";
        } else {
            nclk(this, clickCode + '.mphoneregister', '', '', event)
            document.getElementById("phoneNoForm").style.display = "none";
        }
    }

    function hidePhoneNumberChangePopUp() {
        hiddenObj('dimmed');
        hiddenObj('phoneNumberChangePopUpLayer');
        document.getElementById("wrap").classList.remove("is_fixed");
        resetInternationalCode();
        document.getElementById("phoneNo").value = '';
        document.getElementById("authNo").value = '';
        document.getElementById("authNo").className = "popup_input";
        document.getElementById("e_phoneNo").innerHTML = "";
        document.getElementById("authNo").disabled = true;
    }

    function resetInternationalCode() {
        var internationalCode = document.getElementById('internationalCode');
        for (var i = 0; i < internationalCode.length; i++) {
            if (internationalCode.options[i].value === '82') {
                internationalCode.options[i].selected = true;
            } else {
                internationalCode.options[i].selected = false;
            }
        }
    }

    var sendSmsForChangePhoneNoFlag = false;

    function sendSmsForChangePhoneNo() {
        if (sendSmsForChangePhoneNoFlag === true) {
            return;
        }

        if (document.getElementById("phoneNo").value == "") {
            document.getElementById("e_phoneNo").className = "popup_error";
            document.getElementById("e_phoneNo").innerHTML = "전화번호를 입력하세요.";
            return;
        }

        nclk(this, 'inf.mphoneverify', '', '', window.event);

        sendAuthNo(sendSmsForChangePhoneNoFlag);
    }

    var CHANGE_USER_INFO_URL = "/user2/help/changeUserInfo";

    function sendAuthNo(submitFlag) {
        if (submitFlag === true) {
            return;
        } else {
            submitFlag = true;
        }

        var token = 'UB2gb2EwTHhhtB31';
        var phoneNo = document.getElementById("phoneNo").value;
        var mobileYn = document.getElementById("mobileYn").value;

        var index = document.getElementById("internationalCode").selectedIndex;
        var internationalCode = document.getElementById("internationalCode").options[index].value;
        var urls = CHANGE_USER_INFO_URL + "?m=sendAuthNo&token_help=" + token + "&phoneNo=" + encodeURIComponent(phoneNo) + "&internationalCode=" + encodeURIComponent(internationalCode);

        $.ajax({
            type: "GET",
            url: urls,
            success: function (data) {
                msgKey = data.substr(4, 999);

                var list = msgKey.split("|", 3);
                if (msgKey.length > 300) {
                    alert("유효 시간이 초과 되었습니다. 다시 시도해 주세요.");
                    document.location.href = rawRurl;
                } else {
                    var resultCode = list[0];
                    var resultMessage = list[1];
                    if (resultCode == "0") {
                        document.getElementById("e_phoneNo").className = "popup_error green";
                        document.getElementById("e_phoneNo").innerHTML = resultMessage;
                        document.getElementById("authNo").disabled = false;
                        document.getElementById("authNo").value = "";
                        document.getElementById("authNo").focus();
                    } else if (resultCode == "-2") {
                        var message = "인증하신 휴대전화 번호는 이미 다른 아이디에 등록되어 추가로 등록이 불가합니다. 등록을 원하시면 다른 아이디에 등록된 휴대전화 번호를 삭제해야 합니다. 삭제 하시겠습니까?";
                        if (confirm(message)) {
                            if (mobileYn == "Y") {
                                document.location.href = "/user2/help/deleteContacts?m=informDeletePhoneNo&lang=ko_KR&returnUrl=" + rurl;
                            } else {
                                window.open("/user2/help/deleteContacts?m=informDeletePhoneNo&lang=ko_KR&returnUrl=" + rurl, 'deleteContacts');
                            }
                        }
                    } else {
                        document.getElementById("e_phoneNo").className = "popup_error";
                        document.getElementById("e_phoneNo").innerHTML = resultMessage;
                    }
                }
            },
            error: function (xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                $(location).attr("href", rawRurl);
            },
            complete: function () {
                submitFlag = false;
            }
        });
    }

    var checkAuthNoForChangePhoneNoFlag = false;

    function checkAuthNoForChangePhoneNo() {
        if (checkAuthNoForChangePhoneNoFlag === true) {
            return;
        }

        if (document.getElementById("isPhoneYn").value == "Y") {
            nclk(this, 'inf.mphoneok', '', '', window.event);
        } else {
            nclk(this, 'inf.mphoneregok', '', '', window.event);
        }

        if ((document.getElementById("phoneNo").value != "" && document.getElementById("phoneNo").value.length >= 7) && document.getElementById("authNo").disabled == true) {
            document.getElementById("e_phoneNo").className = "popup_error";
            document.getElementById("e_phoneNo").innerHTML = "[인증] 버튼을 클릭하여, 인증번호를 받아주세요.";
            return;
        }

        if (document.getElementById("phoneNo").value == "" && document.getElementById("authNo").disabled == true) {
            document.getElementById("e_phoneNo").className = "popup_error";
            document.getElementById("e_phoneNo").innerHTML = "전화번호를 입력하세요.";
            document.getElementById("phoneNo").focus();
            return;
        }

        if (document.getElementById("phoneAuthYn").value == "N" && document.getElementById("phoneNo").value.length < 7 && document.getElementById("phoneNo").value.length != 0) {
            document.getElementById("e_phoneNo").className = "popup_error";
            document.getElementById("e_phoneNo").innerHTML = "전화번호 형식에 맞게 입력해 주세요.";
            document.getElementById("phoneNo").focus();
            return;
        }

        if (document.getElementById("authNo").disabled == false && document.getElementById("authNo").value.length < 6) {
            if (document.getElementById("authNo").value.length == 0) {
                document.getElementById("e_phoneNo").className = "popup_error";
                document.getElementById("e_phoneNo").innerHTML = "인증번호를 입력해 주세요.";
            } else {
                document.getElementById("e_phoneNo").className = "popup_error";
                document.getElementById("e_phoneNo").innerHTML = "인증번호를 정확하게 입력해 주세요.";
            }
            document.getElementById("authNo").focus();
            return;
        }

        checkAuthNo(checkAuthNoForChangePhoneNoFlag);
    }

    function checkAuthNo(submitFlag) {
        if (submitFlag === true) {
            return;
        } else {
            submitFlag = true;
        }

        var token = 'UB2gb2EwTHhhtB31';
        var authNo = document.getElementById("authNo").value;
        var mobileYn = document.getElementById("mobileYn").value;

        var urls = CHANGE_USER_INFO_URL + "?m=checkAuthNo&token_help=" + token + "&authNo=" + encodeURIComponent(authNo);

        $.ajax({
            type: "GET",
            url: urls,
            success: function (data) {
                msgKey = data.substr(4, 999);

                var list = msgKey.split("|", 2);
                if (msgKey.length > 300) {
                    alert("유효 시간이 초과 되었습니다. 다시 시도해 주세요.");
                    document.location.href = rawRurl;
                } else {
                    if (list[0] == "-1") {
                        document.getElementById("e_phoneNo").className = "popup_error";
                        document.getElementById("e_phoneNo").innerHTML = list[1];
                    } else {
                        document.getElementById("p_txt_phoneNo").innerHTML = list[1];
                        document.getElementById("p_txt_phoneNo_changeYn").innerHTML = (list[1] == "" ? "등록" : "수정");
                        document.getElementById("b_txt_phoneNo_reg").innerHTML = (list[1] == "" ? "등록" : "변경");
                        if (list[1] == "") {
                            document.getElementById("phoneNoRegDiv").classList.remove("phone");
                            document.getElementById("phoneNoRegDiv").classList.add("not");
                            document.getElementById("phoneNoRegBtn").className = "btn_accent"
                        } else {
                            document.getElementById("phoneNoRegDiv").classList.remove("not");
                            document.getElementById("phoneNoRegDiv").classList.add("phone");
                            document.getElementById("phoneNoRegBtn").className = "btn_edit"
                        }
                        document.getElementById("phoneNoRegSpan").innerHTML = (list[1] == "" ? "전화번호 없음" : list[1]);
                        document.getElementById("phoneNoRegBtnTxt").innerHTML = (list[1] == "" ? "등록" : "수정");
                        hidePhoneNumberChangePopUp();

                        if (list[1] == "") {
                            document.getElementById("isPhoneYn").value = "N";
                            document.getElementById("phoneAuthYn").value = "Y";
                        } else {
                            document.getElementById("isPhoneYn").value = "Y";
                        }
                    }
                }
            },
            error: function (xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                $(location).attr("href", rawRurl);
            },
            complete: function () {
                submitFlag = false;
            }
        });
    }

    function showMyLetterEmailChangePopUp() {
        var clickCode = "imn";
            clickCode = "nid";

        displayObj('dimmed');
        displayObj('myLetterEmailChangePopUpLayer');
        document.getElementById("wrap").classList.add("is_fixed");
        if (isValid === "Y" && emailType === "myLetterEmail") {
            document.getElementById("myLetterEmailForm").style.display = "none";
            document.getElementById("p_txt_myLetterEmailForm").style.display = "none";
            document.getElementById("myLetterEmailPhoneVerify").style.display = "none";
            document.getElementById("myLetterEmail").disabled = false;
        } else {
            nclk(this, clickCode + '.primaryedit', '', '', event)
            document.getElementById("myLetterEmailForm").style.display = "block";
            document.getElementById("p_txt_myLetterEmailForm").style.display = "block";
            document.getElementById("myLetterEmailPhoneVerify").style.display = "block";
            document.getElementById("myLetterEmail").disabled = true;
        }
    }

    function hideMyLetterEmailChangePopUp() {
        hiddenObj('dimmed');
        hiddenObj('myLetterEmailChangePopUpLayer');
        document.getElementById("wrap").classList.remove("is_fixed");
        document.getElementById("confirmMyLetterEmail").value = "";
        document.getElementById("myLetterEmail").value = "";
        document.getElementById("myLetterEmailAuthNo").value = "";
        document.getElementById("myLetterEmailAuthNo").className = "popup_input";
        document.getElementById("e_myLetterEmail").innerHTML = "";
        document.getElementById("myLetterEmail").disabled = true;
        document.getElementById("myLetterEmailAuthNo").disabled = true;
        document.getElementById("myLetterEmailAuthGuideTxt").style.display = "none"
    }

    var element_e_myLetterEmail = document.getElementById("e_myLetterEmail");
    var element_confirmMyLetterEmail = document.getElementById("confirmMyLetterEmail");
    var element_myLetterEmail = document.getElementById("myLetterEmail");
    var element_myLetterEmailAuthNo = document.getElementById("myLetterEmailAuthNo");

    var element_confirmPswdEmail = document.getElementById("confirmPswdEmail");
    var element_pswdEmail = document.getElementById("pswdEmail");
    var element_pswdEmailAuthNo = document.getElementById("pswdEmailAuthNo");
    var element_e_pswdEmail = document.getElementById("e_pswdEmail");
    var element_isEmailYn = document.getElementById("isEmailYn");

    var doConfirmMyLetterEmailFlag = false;

    function doConfirmMyLetterEmail() {
        if (doConfirmMyLetterEmailFlag === true) {
            return;
        }

        nclk(this, 'inf.primaryconfirm', '', '', window.event);

        if (element_confirmMyLetterEmail.value == "" || element_confirmMyLetterEmail.value.replace(/^\s+/, "") == "") {
            element_e_myLetterEmail.innerHTML = "이메일 주소를 입력해 주세요.";
            element_confirmMyLetterEmail.focus();
            element_confirmMyLetterEmail.value = "";
            return;
        }

        if (!isValid_email_myinfo(element_confirmMyLetterEmail.value.replace(/^\s+/, ""), "e_myLetterEmail")) {
            element_e_myLetterEmail.innerHTML = "이메일 형식이 올바르지 않습니다.";
            element_confirmMyLetterEmail.focus();
            element_confirmMyLetterEmail.value = "";
            return;
        }

        confirmMyLetterEmail(doConfirmMyLetterEmailFlag);
    }

    function confirmMyLetterEmail(submitFlag) {
        if (submitFlag === true) {
            return;
        } else {
            submitFlag = true;
        }

        var token = 'UB2gb2EwTHhhtB31';
        var myLetterEmail = element_confirmMyLetterEmail.value;

        var urls = CHANGE_USER_INFO_URL + "?m=checkMyLetterEmail&token_help=" + token;

        $.ajax({
            type: "POST",
            url: urls,
            data: {"myLetterEmail": myLetterEmail},
            success: function (data) {
                handleSessionExpiredErr(data);

                var result = JSON.parse(data);
                if (result.resultCode == 0) {
                    element_e_myLetterEmail.className = "popup_error green";
                    element_e_myLetterEmail.innerHTML = "현재 정보가 확인되었습니다. 변경할 이메일을 입력해주세요.";
                    element_myLetterEmail.disabled = false;
                    element_myLetterEmail.focus();
                } else {
                    element_e_myLetterEmail.className = "popup_error";
                    element_e_myLetterEmail.innerHTML = result.resultMsg;
                }
            },
            error: function (xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                $(location).attr("href", rawRurl);
            },
            complete: function () {
                submitFlag = false;
            }
        });
    }

    function handleSessionExpiredErr(data) {
        if (data && data.indexOf("-9|") === 0) {
            alertReturnMessage(data.split("|")[1]);
            document.location.reload();
        }
    }

    function alertReturnMessage(resultMessage) {
        if (resultMessage) {
            alert(resultMessage.replace("\\n", "\n"));
        }
    }

    var sendAuthNoForEmailAuthFlag = false;

    function sendAuthNoForEmailAuth(obj) {
        if (sendAuthNoForEmailAuthFlag === true) {
            return;
        }

        if (document.getElementById(obj).disabled == true) {
            document.getElementById("e_" + obj).innerHTML = "현재 이메일 주소가 정확한지 확인해 주세요.";
            element_confirmMyLetterEmail.focus();
            return;
        }

        if (obj == 'myLetterEmail') {
            nclk(this, 'inf.primarychangeverify', '', '', window.event);

            element_e_myLetterEmail.innerHTML = "";
            element_e_myLetterEmail.className = "popup_error";
            element_myLetterEmailAuthNo.value = "";
            element_myLetterEmailAuthNo.className = "popup_input";

            if (element_myLetterEmail.value == "" || element_myLetterEmail.value.replace(/^\s+/, "") == "") {
                element_e_myLetterEmail.innerHTML = "이메일 주소를 입력해 주세요.";
                element_myLetterEmail.focus();
                element_myLetterEmail.value = "";
                return;
            }
        } else {
            nclk(this, 'inf.recoverychangeverify', '', '', window.event);

            element_e_pswdEmail.innerHTML = "";
            element_e_pswdEmail.className = "popup_error";
            element_pswdEmailAuthNo.value = "";
            element_pswdEmailAuthNo.className = "popup_input";

            if (element_pswdEmail.value == "" || element_pswdEmail.value.replace(/^\s+/, "") == "") {
                element_e_pswdEmail.innerHTML = "이메일 주소를 입력해 주세요.";
                element_pswdEmail.focus();
                element_pswdEmail.value = "";
                return;
            }
        }

        if (!isValid_email_myinfo(document.getElementById(obj).value.replace(/^\s+/, ""), "e_" + obj)) {
            document.getElementById("e_" + obj).innerHTML = "이메일 형식이 올바르지 않습니다.";
            document.getElementById(obj).focus();
            document.getElementById(obj).value = "";
            return;
        }

        getAjaxSendAuthNoForEmailAuth(obj, sendAuthNoForEmailAuthFlag);
    }

    function getAjaxSendAuthNoForEmailAuth(obj, submitFlag) {
        if (submitFlag === true) {
            return;
        } else {
            submitFlag = true;
        }

        var token = 'UB2gb2EwTHhhtB31';
        var email = document.getElementById(obj).value;
        var urls = CHANGE_USER_INFO_URL + "?m=sendAuthNoForEmail&token_help=" + token;

        $.ajax({
            type: "POST",
            url: urls,
            data: {"email": email},
            success: function (data) {
                handleSessionExpiredErr(data);

                var result = JSON.parse(data);
                if (result.resultCode == 0) {
                    document.getElementById(obj + 'AuthNo').disabled = false;
                    document.getElementById(obj + 'AuthNo').focus();
                    document.getElementById("e_" + obj).className = "popup_error green";
                } else {
                    document.getElementById("e_" + obj).className = "popup_error";
                }
                document.getElementById("e_" + obj).innerHTML = result.resultMsg;
            },
            error: function (xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                $(location).attr("href", rawRurl);
            },
            complete: function () {
                submitFlag = false;
            }
        });
    }

    var setEmailFlag = false;

    function setEmail() {
        if (setEmailFlag === true) {
            return;
        }

        nclk(this, 'inf.primaryok', '', '', window.event);

        element_e_myLetterEmail.className = "popup_error";
        element_e_myLetterEmail.innerHTML = "";

        if (element_myLetterEmail.disabled == true) {
            element_e_myLetterEmail.innerHTML = "현재 이메일 주소가 정확한지 확인해 주세요.";
            element_confirmMyLetterEmail.focus();
            return;
        }

        if (element_myLetterEmail.value == "" || element_myLetterEmail.value.replace(/^\s+/, "") == "") {
            element_e_myLetterEmail.innerHTML = "이메일 주소를 입력해 주세요.";
            element_myLetterEmail.focus();
            element_myLetterEmail.value = "";
            return;
        }

        if (!isValid_email_myinfo(element_myLetterEmail.value.replace(/^\s+/, ""), "e_myLetterEmail")) {
            element_e_myLetterEmail.innerHTML = "이메일 형식이 올바르지 않습니다.";
            element_myLetterEmail.focus();
            element_myLetterEmail.value = "";
            return;
        }

        if (element_myLetterEmail.value != "" && element_myLetterEmailAuthNo.disabled == true) {
            element_e_myLetterEmail.innerHTML = "[인증] 버튼을 클릭하여, 인증번호를 받아주세요.";
            return;
        }

        if (element_myLetterEmailAuthNo.disabled == false && element_myLetterEmailAuthNo.value.length != 6) {
            if (element_myLetterEmailAuthNo.value.length == 0) {
                element_e_myLetterEmail.innerHTML = "인증번호를 입력해 주세요.";
            } else {
                element_e_myLetterEmail.innerHTML = "인증번호를 정확하게 입력해 주세요.";
            }
            element_myLetterEmailAuthNo.focus();
            return;
        }

        setMyLetterEmail(setEmailFlag);
        return;
    }

    function setMyLetterEmail(submitFlag) {
        if (submitFlag === true) {
            return;
        } else {
            submitFlag = true;
        }

        var token = 'UB2gb2EwTHhhtB31';
        var myLetterEmail = element_myLetterEmail.value;
        var authNo = element_myLetterEmailAuthNo.value;

        var urls = CHANGE_USER_INFO_URL + "?m=setMyLetterEmailWithVerification&token_help=" + token;

        $.ajax({
            type: "POST",
            url: urls,
            data: {"myLetterEmail": myLetterEmail, "authNo": authNo},
            success: function (data) {
                handleSessionExpiredErr(data);

                var result = JSON.parse(data);
                if (result.resultCode == 0) {
                    document.getElementById("p_txt_myLetterEmail").innerHTML = result.resultMsg;
                    document.getElementById("myLetterEmailRegSpan").innerHTML = result.resultMsg;
                    isValid = "N";
                    hideMyLetterEmailChangePopUp();
                } else if (result.resultCode == -2) {
                    element_e_myLetterEmail.innerHTML = result.resultMsg;
                } else {
                    element_e_myLetterEmail.innerHTML = result.resultMsg;
                }
            },
            error: function (xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                $(location).attr("href", rawRurl);
            },
            complete: function () {
                submitFlag = false;
            }
        });
    }

    function showPswdEmailChangePopUp() {
        var clickCode = "imn";
            clickCode = "nid";

        displayObj('dimmed');
        displayObj('pswdEmailChangePopUpLayer');
        document.getElementById("wrap").classList.add("is_fixed");
        if (!(isValid === "Y" && emailType === "pswdEmail") && element_isEmailYn.value === "Y") {
            document.getElementById("pswdEmailForm").style.display = "block";
            document.getElementById("p_txt_pswdEmailForm").style.display = "block";
            document.getElementById("pswdEmailPhoneVerify").style.display = "block";
            document.getElementById("pswdEmail").disabled = true;
        } else {
            document.getElementById("pswdEmailForm").style.display = "none";
            document.getElementById("p_txt_pswdEmailForm").style.display = "none";
            document.getElementById("pswdEmailPhoneVerify").style.display = "none";
            document.getElementById("pswdEmail").disabled = false;
        }

        if (isValid !== "Y" && element_isEmailYn.value === "Y") {
            nclk(this, clickCode + '.recoveryedit', '', '', event)
        } else {
            nclk(this, clickCode + '.recoveryregister', '', '', event)
        }
    }

    function hidePswdEmailChangePopUp() {
        hiddenObj('dimmed');
        hiddenObj('pswdEmailChangePopUpLayer');
        document.getElementById("wrap").classList.remove("is_fixed");
        document.getElementById("confirmPswdEmail").value = "";
        document.getElementById("pswdEmail").value = "";
        document.getElementById("pswdEmailAuthNo").value = "";
        document.getElementById("pswdEmailAuthNo").className = "popup_input";
        document.getElementById("e_pswdEmail").innerHTML = "";
        document.getElementById("pswdEmail").disabled = true;
        document.getElementById("pswdEmailAuthNo").disabled = true;
        document.getElementById("pswdEmailAuthGuideTxt").style.display = "none"
    }

    var doConfirmPswdEmailFlag = false;

    function doConfirmPswdEmail() {
        if (doConfirmPswdEmailFlag === true) {
            return;
        }

        nclk(this, 'inf.recoveryconfirm', '', '', window.event);

        element_e_pswdEmail.className = "popup_error";
        element_e_pswdEmail.innerHTML = "";

        if (element_isEmailYn.value == "Y") {
            if (element_confirmPswdEmail.value == "" || element_confirmPswdEmail.value.replace(/^\s+/, "") == "") {
                element_e_pswdEmail.innerHTML = "이메일 주소를 입력해 주세요.";
                element_confirmPswdEmail.focus();
                element_confirmPswdEmail.value = "";
                return;
            }

            if (!isValid_email_myinfo(element_confirmPswdEmail.value.replace(/^\s+/, ""), "e_pswdEmail")) {
                element_e_pswdEmail.innerHTML = "이메일 형식이 올바르지 않습니다.";
                element_confirmPswdEmail.focus();
                element_confirmPswdEmail.value = "";
                return;
            }

            confirmPasswdEmail(doConfirmPswdEmailFlag);
        }
    }

    function confirmPasswdEmail(submitFlag) {
        if (submitFlag === true) {
            return;
        } else {
            submitFlag = true;
        }

        var token = 'UB2gb2EwTHhhtB31';
        var pswdEmail = element_confirmPswdEmail.value;

        var urls = CHANGE_USER_INFO_URL + "?m=checkPasswdEmail&token_help=" + token;
        $.ajax({
            type: "POST",
            url: urls,
            data: {"pswdEmail": pswdEmail},
            success: function (data) {
                msgKey = data.substr(4, 999);

                var list = msgKey.split("|", 2);
                if (msgKey.length > 300) {
                    alert("유효 시간이 초과 되었습니다. 다시 시도해 주세요.");
                    document.location.href = rawRurl;
                } else {
                    if (list[0] == "0") {
                        element_e_pswdEmail.className = "popup_error green";
                        element_e_pswdEmail.innerHTML = "현재 정보가 확인되었습니다. 변경할 이메일을 입력해주세요.";
                        element_pswdEmail.disabled = false;
                        element_pswdEmail.focus();
                    } else {
                        element_e_pswdEmail.className = "popup_error";
                        element_e_pswdEmail.innerHTML = list[1];
                    }
                }
            },
            error: function (xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                $(location).attr("href", rawRurl);
            },
            complete: function () {
                submitFlag = false;
            }
        });
    }

    var setPswdEmailFlag = false;

    function setPswdEmail() {
        if (setPswdEmailFlag === true) {
            return;
        }

        if (element_isEmailYn.value == "Y") {
            nclk(this, 'inf.recoveryok', '', '', window.event);
        } else {
            nclk(this, 'inf.recoveryregok', '', '', window.event);
        }

        element_e_pswdEmail.className = "popup_error";
        element_e_pswdEmail.innerHTML = "";

        if (element_isEmailYn.value == "N" && element_pswdEmail.value == "") {
            element_e_pswdEmail.innerHTML = "삭제하실 이메일 주소가 없습니다.";
            return;
        }

        if (element_isEmailYn.value == "Y" && element_pswdEmail.disabled == true) {
            element_e_pswdEmail.innerHTML = "현재 이메일 주소가 정확한지 확인해 주세요.";
            element_confirmPswdEmail.focus();
            return;
        }

        if (element_pswdEmail.value == "" || element_pswdEmail.value.replace(/^\s+/, "") == "") {
            if (!confirm("본인확인 이메일을 삭제하시겠습니까?")) {
                element_pswdEmail.focus();
                return;
            }
        } else {
            if (element_pswdEmail.value != "" && !isValid_pswdEmail(element_pswdEmail.value.replace(/^\s+/, ""), "e_pswdEmail")) {
                element_e_pswdEmail.innerHTML = "이메일 형식이 올바르지 않습니다.";
                element_pswdEmail.focus();
                element_pswdEmail.value = "";
                return;
            }

            if (element_pswdEmailAuthNo.disabled == true) {
                element_e_pswdEmail.innerHTML = "[인증] 버튼을 클릭하여, 인증번호를 받아주세요.";
                return;
            }

            if (element_pswdEmailAuthNo.disabled == false && element_pswdEmailAuthNo.value.length != 6) {
                if (element_pswdEmailAuthNo.value.length == 0) {
                    element_e_pswdEmail.innerHTML = "인증번호를 입력해 주세요.";
                } else {
                    element_e_pswdEmail.innerHTML = "인증번호를 정확하게 입력해 주세요.";
                }
                element_pswdEmailAuthNo.focus();
                return;
            }
        }

        setPasswdEmail(setPswdEmailFlag);
        return;
    }

    function setPasswdEmail(submitFlag) {
        if (submitFlag === true) {
            return;
        } else {
            submitFlag = true;
        }

        var token = 'UB2gb2EwTHhhtB31';
        var pswdEmail = element_pswdEmail.value;
        var authNo = element_pswdEmailAuthNo.value;

        var urls = CHANGE_USER_INFO_URL + "?m=setPasswdEmailWithVerification&token_help=" + token;

        $.ajax({
            type: "POST",
            url: urls,
            data: {"pswdEmail": pswdEmail, "authNo": authNo},
            success: function (data) {
                handleSessionExpiredErr(data);

                var result = JSON.parse(data);
                if (result.resultCode == 0) {
                    var newPasswdEmail = result.resultMsg;
                    document.getElementById("p_txt_pswdEmail").innerHTML = newPasswdEmail;
                    document.getElementById("p_txt_pswdEmail_changeYn").innerHTML = (newPasswdEmail == "" ? "등록" : "수정");
                    document.getElementById("pswdEmail").placeholder = (newPasswdEmail == "" ? "등록할 이메일 입력" : "변경할 이메일 입력");
                    document.getElementById("b_txt_pswdEmail_reg").innerHTML = (newPasswdEmail == "" ? "등록" : "변경");
                    if (newPasswdEmail == "") {
                        document.getElementById("pswdEmailRegDiv").classList.add("not");
                        document.getElementById("pswdEmailRegBtn").className = "btn_accent"
                    } else {
                        document.getElementById("pswdEmailRegDiv").classList.remove("not");
                        document.getElementById("pswdEmailRegBtn").className = "btn_edit"
                    }
                    document.getElementById("pswdEmailRegSpan").innerHTML = (newPasswdEmail == "" ? "본인확인 이메일 없음" : newPasswdEmail);
                    document.getElementById("pswdEmailRegBtnTxt").innerHTML = (newPasswdEmail == "" ? "등록" : "수정");
                    element_isEmailYn.value = (newPasswdEmail == "" ? "N" : "Y");
                    isValid = "N";
                    hidePswdEmailChangePopUp();
                } else {
                    element_e_pswdEmail.innerHTML = result.resultMsg;
                }
            },
            error: function (xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                $(location).attr("href", rawRurl);
            },
            complete: function () {
                submitFlag = false;
            }
        });
    }

    function userMobile(emailType) {
        var ua = window.navigator.userAgent.toLowerCase();
        if ((/crios/.test(ua) || (navigator.userAgentData && navigator.userAgentData.platform.indexOf('iOS') !== -1 && (navigator.userAgentData.brands.some(function(v) { return /Chrome/i.test(v.brand) })))) && /ipad/.test(ua)) {
            alert("접속하신 브라우저에서는 본인 휴대전화 인증이 지원되지 않습니다. 다른 브라우저를 이용해 주세요.");
            return;
        }

        if (emailType === "myLetterEmail") {
            nclk(this, 'inf.primaryverify', '', '', event);
        } else {
            nclk(this, 'inf.recoveryverify', '', '', event);
        }

        document.location.href = "/user2/help/changeUserInfo?m=viewUserMobile&token_help=UB2gb2EwTHhhtB31&emailType=" + emailType;

        return;
    }

    function changeVerifyToPopupInput(obj) {
        var element = document.getElementById(obj);
        if (element.value.length === 0) {
            element.classList.remove("verify");
        } else {
            element.classList.add("verify");
        }
    }

    function excuteNclicksCancelAsPhoneYn() {
        if (document.getElementById("isPhoneYn").value == "Y") {
            nclk(this, 'inf.mphonecancel', '', '', event)
        } else {
            nclk(this, 'inf.mphoneregcancel', '', '', event)
        }
    }

    function excuteNclicksCloseAsPhoneYn() {
        if (document.getElementById("isPhoneYn").value == "Y") {
            nclk(this, 'inf.mphonex', '', '', event)
        } else {
            nclk(this, 'inf.mphoneregx', '', '', event)
        }
    }

    function excuteNclicksCancelAsPswdEmailYn() {
        if (document.getElementById("isEmailYn").value == "Y") {
            nclk(this, 'inf.recoverycancel', '', '', event)
        } else {
            nclk(this, 'inf.recoveryregcancel', '', '', event)
        }
    }

    function excuteNclicksCloseAsPswdEmailYn() {
        if (document.getElementById("isEmailYn").value == "Y") {
            nclk(this, 'inf.recoveryx', '', '', event)
        } else {
            nclk(this, 'inf.recoveryregx', '', '', event)
        }
    }
</script><!--팝업딥드-->
<div id="dimmed2" class="dimmed" aria-hidden="true" style="display:none;"></div>
<!--팝업내용-->
<div id="twoStepVerificationPopUpLayer" class="layer" style="display:none;">
    <div class="popup_layer">
        <div class="popup_layer_inner">
            <div class="popup_content">
                <!--팝업콘텐츠영역-->
                <div class="contact_2step_popup" style="width:329px;">
                    <h4 class="contact_edit_title">
                        새로운 <strong class="bold">2단계 인증</strong>으로 바꿔 보세요.<br>
                        "번거로운 숫자 대신, 한번의 클릭"
                    </h4>
                    <div class="contact_edit_desc">
                        보안성은 그대로, 편리함을 더한 새로운 '2단계 인증'으로 바꿔 보세요.
                        스마트 기기 알림 화면에서 '예' 버튼만 클릭하면 안전하게 로그인할 수 있습니다.
                        새로운 기능 제공으로 현재 OTP 관리 기능은 지원하지 않습니다.
                    </div>
                    <div class="contact_edit_desc">
                        <strong>OTP 로그인을 해제한 후, 2단계 인증을 설정하세요.</strong>
                    </div>
                    <div class="btn_duo_popup ratio">
                        <a href="https://nid.naver.com/mobile/user/help/2StepVerif?m=viewReleaseSettings&amp;token_help=UB2gb2EwTHhhtB31&amp;lang=ko_KR" class="btn_item on" role="button" onclick="nclk(this,&#39;2fc.otprelease&#39;,&#39;&#39;,&#39;&#39;,event)">
                            <span class="btn_text">OTP 해제하기</span>
                        </a>
                        <a href="javascript:;" class="btn_item" role="button" onclick="nclk(this,&#39;2fc.otplater&#39;,&#39;&#39;,&#39;&#39;,event);hide2StepVerificationPopUp()">
                            <span class="btn_text">나중에 하기</span>
                        </a>
                    </div>
                    <button type="button" class="close_popup" onclick="nclk(this,&#39;2fc.otprx&#39;,&#39;&#39;,&#39;&#39;,event);hide2StepVerificationPopUp()"><span class="blind">닫기</span></button>
                </div>
                <!-- // -->
            </div>
        </div>
    </div>
</div>

<script>
    function show2StepVerificationPopUp() {
        displayObj('dimmed2');
        displayObj('twoStepVerificationPopUpLayer');
        document.getElementById("wrap").classList.add("is_fixed");
    }

    function hide2StepVerificationPopUp() {
        hiddenObj('dimmed2');
        hiddenObj('twoStepVerificationPopUpLayer');
        document.getElementById("wrap").classList.remove("is_fixed");
    }

    function go2StepVerification() {
        var twoStepVerifBaseUrl = "/user2/help/2StepVerif?";

        twoStepVerifBaseUrl = "/mobile/user/help/2StepVerif?";

        twoStepVerifBaseUrl += "m=viewGuide&token_help=UB2gb2EwTHhhtB31&lang=ko_KR";

        document.location.href = twoStepVerifBaseUrl;
    }
</script>
<script type="text/javascript">
getGNB();

window.onresize = function() {
	setContainerHeight(document.getElementById('content').clientHeight);
}

function landscapeHandler() {
        var headerLeft = document.querySelector("#headerLeft")
        var headerTop = document.querySelector("#headerTop");
        if (window.innerWidth >= 1024) {
            headerLeft.ariaHidden = "false";
            headerTop.ariaHidden = "false";
        } else {
            headerLeft.ariaHidden = "true";
            headerTop.ariaHidden = "true";
        }
    }

    $(document).ready(function(){
        landscapeHandler();

        $("a[id^='info']").click(function () {
            var $this = $(this);
            if($this.attr("aria-expanded") === "true"){
                $this.attr("aria-expanded", "false");
                var info = "#" + $this.attr("id");
                var infoToolTip = $(info + "ToolTip");
                infoToolTip.attr("aria-hidden", "true");
                infoToolTip.css("display", "none");
            } else {
                $this.attr("aria-expanded", "true");
                var infoToolTip = $("#" + $this.attr("id") + "ToolTip");
                infoToolTip.attr("aria-hidden", "false");
                infoToolTip.css("display", "block");
            }
        })

        $("button[id^='infoExit']").click(function () {
            var info = "#info" + $(this).attr("id").substr(8, 1);
            $(info).attr("aria-expanded", "false");
            var infoToolTip = $(info + "ToolTip");
            infoToolTip.attr("aria-hidden", "true");
            infoToolTip.css("display", "none");
        })
    });

    var timer; // 디바운싱
    window.addEventListener('resize', function () {
        clearTimeout(timer);
        timer = setTimeout(landscapeHandler, 300);
    });

</script>


</body></html></body></html>