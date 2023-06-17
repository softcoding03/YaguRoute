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

<script type="text/javascript">

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
		}
		else if(/^\d+$/.test(userIdText)) {
		
			userId.remove();
			
			var kakaoLoginElement = document.createElement("p");
			kakaoLoginElement.classList.add("kakao-login");
			kakaoLoginElement.innerText = "KAKAO";
			
			var profileElement = document.querySelector(".profile");
		    profileElement.appendChild(kakaoLoginElement); // 네이버 로그인 요소 추가
		}
	});
	
	$(function(){
		
		var gender = "${user.gender}";
		
		if(gender === 'M'){
			document.getElementById('genderSetting').textContent = '남성';
		}else{
			document.getElementById('genderSetting').textContent = '여성';
		}
	});

</script>

<style>

	/* button, input, select, textarea {
    background-color: rgb(55 57 101);
    border-radius: 28px;
    display: inline-block;
    cursor: pointer;
    color: ghostwhite;
    font-family: Arial;
    font-size: 17px;
    padding: 9px 15px;
    text-decoration: none;
    width: 120px;
	} */
	
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
    
	.youBirth {
		text-align: center;
	}
	.pointgogo {
		padding-right: 20px !important;
	}
	.subindex_greenbox {
    padding: 16px 17px 0 !important;
    border-radius: 12px !important;
    box-shadow: 2px 2px 14px 0 rgba(0,164,73,.08) !important;
    border: solid 3px rgb(49 43 145 / 80%) !important;
    background-color: #fff !important;
    box-sizing: border-box !important;
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
a {
    color: #31367b;
    text-decoration: none;
    outline: 0;
    transition: all .4s;
    font-family: 'Gwangyang';
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
		
		window.location.href="/main/getMain";
	}
	
	// 내 정보 보기로 이동
	function getUserFunction() {
		
		window.location.href="/users/getUser";
	}
	
	// 전화번호를 '-'를 붙여 출력하기
	$(function(){
		
		var userPhone = "${user.userPhone}";
		var formatNumber = userPhone.slice(0,3) + "-" + userPhone.slice(3,7) + "-" + userPhone.slice(7);
		
		$("#phoneNoRegSpan").text(formatNumber);
	});
	
	// 생일 년도(yyyy) 자르고 mm월 dd일로 출력하기
	/* $(function(){
		
		var userBirth = "${user.userBirth}";
		
	    var year = userBirth.slice(0, 4);
	    var month = userBirth.slice(4, 6) - 1;
	    var day = userBirth.slice(6, 8);

	    var birthDate = new Date(year, month, day);
	    var formattedBirth = month+1 + "월 " + day + "일";

	    // D-day를 계산하기 위한 변수 선언
	    var currentYear = new Date().getFullYear();
	    var dDay = new Date(currentYear, month, day);
	    
	    var currentDate = new Date();
	    
	    // D-day 계산
	    var timeDiff = dDay.getTime() - currentDate.getTime();
	    var daysDiff = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));  // 남은 시간을 일 단위로 변환
	 	
	    var dDayComment = "D-"+daysDiff 
	    
	    $(".youBirth").text(formattedBirth);
	   	$("#dDay").text(dDayComment);
	}); */
	
	$(function(){
	    var userBirth = "${user.userBirth}";
	    
	    var year = userBirth.slice(0, 4);
	    var month = userBirth.slice(4, 6) - 1;
	    var day = userBirth.slice(6, 8);
	    
	    var birthDate = new Date(year, month, day);
	    var formattedBirth = month+1 + "월 " + day + "일";
	    
	    // D-day를 계산하기 위한 변수 선언
	    var currentYear = new Date().getFullYear();
	    var currentMonth = new Date().getMonth();
	    var currentDate = new Date().getDate();
	    
	    var dDay = new Date(currentYear, month, day);
	    
	    // 올해 생일이 지난 경우 내년 생일로 설정
	    if (currentMonth > month || (currentMonth === month && currentDate > day)) {
	        dDay.setFullYear(currentYear + 1);
	    }
	    
	    // D-day 계산
	    var timeDiff = dDay.getTime() - new Date().getTime();
	    var daysDiff = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));  // 남은 시간을 일 단위로 변환
	    
	    var dDayComment = "D-" + daysDiff;
	    
	    $(".youBirth").text(formattedBirth);
	    $("#dDay").text(dDayComment);
	});
	
	$(function(){
		
		 var point = "${user.userPoint}";
		 var formatPoint = addCommas(point);
		 
		 document.getElementById('point').textContent = formatPoint;
		 
	});
	
	function addCommas(point) {
		  return point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	
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
                <p class="userNickName" style="font-size: 23px; font-weight: 700;">${user.userNickName}</p>
                <p class="userId" id="userId">${user.userId}</p>
            </div>
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
                <div class="title"></div>
    <div class="subindex_greenbox">
    <div class="account_box">
        <div class="myprofile">
            <!-- <div class="info_title">
                <h3 class="title_text">기본정보</h3>
                <a href="javascript:;" id="info1" class="link_info" aria-expanded="false"><span
                            class="blind">도움말</span></a>

                <div id="info1ToolTip" class="info_tooltip" aria-hidden="true" style="display: none;">
                    <strong class="info_head">사용자 닉네임</strong>
                    <p class="info_desc">승부 예측 게임 등의 일부 서비스를 이용하려면 닉네임 정보가 필요합니다. 이름, 생년월일, 성별 정보가 변경되었다면 수정도 할 수 있습니다.</p>
                    <strong class="info_head">연락처</strong>
                    <p class="info_desc">야구 루트 서비스를 이용하기 위해선 회원가입이 필요하고, 연락처로 인증을 받습니다.</p>
                    <strong class="info_head">본인확인 휴대폰</strong>
                    <p class="info_desc">아이디, 비밀번호 찾기, 로그인이 안되는 경우 등 본인확인이 필요한 경우 사용합니다.</p>
                    <button type="button" id="infoExit1" class="btn_exit"><span class="blind">닫기</span></button>
                </div>

            </div> -->
            <ul class="myinfo_area">
                <li>
                
                    <div class="myphoto">
                        <img src="${team.teamEmblem}"
                             width="56" height="56" alt="내 프로필 이미지">
                    </div>
                </li>
                <li>
                    <div class="myaccount">
                        <div class="myname">
                            <div class="name_text">${user.userName}</div>
                            <div style="text-align: left;" id="genderSetting"></div>
                            <button type="button" class="btn_edit" onclick="updateUserFunction()">
                                <span class="text">내 정보 수정</span>
                            </button>
                        </div>
                        <div class="myaddress">${user.userEmail}</div>
                    </div>
                </li>
            </ul>
        </div>
        <ul class="subindex_row">
            <li>
                <div id="phoneNoRegDiv" class="row_item phone ">
                    <span id="phoneNoRegSpan"
                          class="item_text">${user.userPhone}</span>
                </div>
            </li>

            <li>
                <div class="row_item mail ">
                    <span id="myLetterEmailRegSpan"
                          class="item_text">${user.userEmail}</span>
                </div>
            <li>
                <div class="row_item abroad">
                    <span id="phoneNoRegSpan"
                          class="item_text">${user.userAddr}</span>
                </div>

            </li>
                <!-- 어제 이거 뭘로 만들려 했더라? -->
                <!-- <div id="pswdEmailRegDiv" class="row_item mail not">
                    <span id="pswdEmailRegSpan"
                          class="item_text" style="color: #000000;">본인확인 이메일 없음</span>
                </div> -->
            </li>
        </ul>
    </div>
    </div>
</div>
<!--//-->

<!--프로모션 정보수신 동의-->
<div class="subindex_item">
    <div class="subindex_box">
        <ul class="subindex_row">
            <li>
                <div class="row_item phone">
                    <span class="item_text">포인트</span>
                    <a style="font-size: 17px; font-weight: bolder;" id="point"><%-- ${user.userPoint} --%></a>&nbsp;Point
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
	<h2 class="subindex_title">&nbsp;${user.userName}님의 생일은...</h2>
    <div class="subindex_onebox" style="height: 50px; padding: 12px 17px 18px;">	
        <div class="onebox_title desc">
        <div class="forBirth" style="font-family:'Gwangyang';"> 
         
        &nbsp; ${user.userName}님의 생일은
        <a class="youBirth"><b>${user.userBirth}</b></a>
        입니다.
        
        &emsp;
        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="18" fill="currentColor" class="bi bi-calendar-heart" viewBox="0 0 16 16" style="color: hotpink;">
  		<path fill-rule="evenodd" d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5ZM1 14V4h14v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1Zm7-6.507c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
		</svg>
        <a class="dDay" id="dDay" style="color: crimson; font-size: 20px;"></a>
        </div>
        </div>
    </div>
</div>


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