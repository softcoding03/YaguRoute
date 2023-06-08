
/*---------------------------------------------------------------------------------------------
@ �뚯씪 �대쫫: common_util_0803.js
@ �뚯씪 �ㅻ챸: �ㅼ쓬 湲곕뒫 �ㅼ쓣 紐⑥븘�볦� js include �뚯씪 ( UI �� �낅┰�곸씤 湲곕뒫�ㅼ쓽 紐⑥쓬 )
 - validation check 湲곕뒫
 - isNumeric, isHangul �� �곗씠�� 泥댄겕 湲곕뒫
 - popup �꾩슦湲�, popup resize 湲곕뒫
@ �묒꽦��: 源�媛뺤뿴 edited by �꾨�寃�
  ---------------------------------------------------------------------------------------------*/
// for flicker err. by faustkim 2008.05.15
//try { if (navigator.appVersion.indexOf("MSIE") && (navigator.appName.indexOf("Opera")==-1) ) { document.execCommand("BackgroundImageCache",false,true); } } catch(err) {}

// Validation Check �� 愿��⑤맂 UI �� �낅┰�곸씤 �⑥닔�� 紐⑥쓬  ###########################################################################
function isValid_corp_no(no)
{
	var regStr = /^[0-9]{13}$/;
    if( !regStr.test(no) ) {
         return false;
    }

    if( '0000000000000' == no
     ) { return false; }

     // 2009.02.12 踰뺤씤�깅줉踰덊샇 �좏슚�� 泥댄겕 濡쒖쭅 disable
     return true;

    var str = no.toString();
     a = str.substring(0, 1);
     b = str.substring(1, 2);
     c = str.substring(2, 3);
     d = str.substring(3, 4);
     e = str.substring(4, 5);
     f = str.substring(5, 6);
     g = str.substring(6, 7);
     h = str.substring(7, 8);
     i = str.substring(8, 9);
     j = str.substring(9, 10);
     k = str.substring(10, 11);
     l = str.substring(11, 12);
     m = str.substring(12, 13);

     var sum=a*1+b*2+c*1+d*2+e*1+f*2+g*1+h*2+i*1+j*2+k*1+l*2;
     var tmp = 0;

     tmp = 10 - (sum%10);
     if( 10 == tmp) tmp = 0;

     if( tmp == m) { return true; }
     else { return false; }
}

function isValid_bizr_no(no)
{
     var regStr = /^[0-9]{10}$/;
     if( !regStr.test(no) ) {
         return false;
     }

     if( '0000000000' == no
      || '4444444444' == no
      || '8888888888' == no
     ) { return false; }

	var str = no.toString();
	a = str.substring(0, 1);
	b = str.substring(1, 2);
	c = str.substring(2, 3);
	d = str.substring(3, 4);
	e = str.substring(4, 5);
	f = str.substring(5, 6);
	g = str.substring(6, 7);
	h = str.substring(7, 8);
	i = str.substring(8, 9);
	j = str.substring(9, 10);

    var sum = 0;
    sum += a*1%10;
    sum += b*3%10;
    sum += c*7%10;
    sum += d*1%10;
    sum += e*3%10;
    sum += f*7%10;
    sum += g*1%10;
    sum += h*3%10;
    sum += i*5%10 + Math.floor(i*5/10);
    sum += j*1%10;

    if( sum %10 == 0 ) { return true; }
    else { return false; }
}

function isValid_uniq_no(no)
{
	return isValid_bizr_no(no);
}


// 二쇰�踰덊샇 7踰덉㎏ �먮━�� 洹쒖튃 ########################
// 1800�꾨�: �⑥옄 9, �ъ옄 0
// 1900�꾨�: �⑥옄 1, �ъ옄 2
// 2000�꾨�: �⑥옄 3, �ъ옄 4
// 2100�꾨�: �⑥옄 5, �ъ옄 6
// �멸뎅�� �깅줉踰덊샇: �⑥옄 7, �ъ옄 8

// 二쇰�踰덊샇, �멸뎅�� �깅줉踰덊샇��  validation 泥댄겕 �⑥닔
function isValid_socno(socno)
{
	var socnoStr = socno.toString();
     a = socnoStr.substring(0, 1);
     b = socnoStr.substring(1, 2);
     c = socnoStr.substring(2, 3);
     d = socnoStr.substring(3, 4);
     e = socnoStr.substring(4, 5);
     f = socnoStr.substring(5, 6);
     g = socnoStr.substring(6, 7);
     h = socnoStr.substring(7, 8);
     i = socnoStr.substring(8, 9);
     j = socnoStr.substring(9, 10);
     k = socnoStr.substring(10, 11);
     l = socnoStr.substring(11, 12);
     m = socnoStr.substring(12, 13);
	 month = socnoStr.substring(2,4);
	 day = socnoStr.substring(4,6);
	 socnoStr1 = socnoStr.substring(0, 7);
	 socnoStr2 = socnoStr.substring(7, 13);

	 // ��,�� Validation Check
	 if(month <= 0 || month > 12) { return false; }
	 if(day <= 0 || day > 31) { return false; }

	 // 二쇰��깅줉踰덊샇�� 怨듬갚�� �ㅼ뼱媛��� 媛��낆씠 �섎뒗 寃쎌슦媛� 諛쒖깮�섏� �딅룄濡� �쒕떎.
	 if (isNaN(socnoStr1) || isNaN(socnoStr2))  { return false; }

     temp=a*2+b*3+c*4+d*5+e*6+f*7+g*8+h*9+i*2+j*3+k*4+l*5;
     temp=temp%11;
     temp=11-temp;
     temp=temp%10;

     if(temp == m) {
        return true;
     } else {
        return false;
     }
}

function isValid_fgnno(socno)
{
	var total =0;
	var parity = 0;

	var fgnNo = new Array(13);

	for(i=0;i < 13;i++) fgnNo[i] = parseInt(socno.charAt(i));

//	if(fgnNo[11] < 6) return false;

	if((parity = fgnNo[7]*10 + fgnNo[8])&1) return false;


	var weight = 2;

	for(i=0,total=0;i < 12;i++)
	{
		var sum = fgnNo[i] * weight;
		total += sum;

		if(++weight > 9) weight=2;
	}

	if((total = 11 - (total%11)) >= 10) total -= 10;
	if((total += 2) >= 10) total -= 10;
	if(total != fgnNo[12]) return false;

	return true;
}

function isValid_id( str )
{
     // check whether input value is included space or not
     if( str == ""){
     	alert("�꾩씠�붾� �낅젰�섏꽭��.");
     	return false;
     }

	// �꾩씠�� 媛��대뜲 鍮� 怨듦컙�� �녿룄濡� 泥댄겕�쒕떎.
     var retVal = checkSpace( str );
     if( retVal ) {
         alert("�꾩씠�붾뒗 鍮� 怨듦컙 �놁씠 �곗냽�� �곷Ц �뚮Ц�먯� �レ옄留� �ъ슜�� �� �덉뒿�덈떎.");
         return false;
     }

     // �꾩씠�붾뒗 '-' 濡� �쒖옉�� �� �녿떎.
	if( str.charAt(0) == '_') {
		alert("�꾩씠�붿쓽 泥ルЦ�먮뒗 '_'濡� �쒖옉�좎닔 �놁뒿�덈떎.");
		return false;
	}

     // 湲몄씠�� �덉슜 臾몄옄瑜� 泥댄겕�쒕떎.
    //var isID = /^[a-z0-9_]{5,12}$/;
    var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
     if( !isID.test(str) ) {
         alert("�꾩씠�붾뒗 5~20�먯쓽 �곷Ц �뚮Ц�먯� �レ옄,�뱀닔湲고샇(_),(-)留� �ъ슜�� �� �덉뒿�덈떎.");
         return false;
     }

	 var isNum = /\d/;
     var i;
     var cnt = 0;
     for( i=0; i < str.length; i++) {
     	if( isNum.test( str.substring( i, i+1 ) ) ) {
     		cnt++;
     	}
     	if( cnt > 7 ) {
     		alert("�レ옄媛� 8媛� �댁긽 �ъ슜�섎㈃ �덈맗�덈떎.");
     		return false;
     	}
     }

     return true;
}

function isValid_passwd( str )
{
     var cnt = 0;
     if( str == ""){
     	alert("鍮꾨�踰덊샇瑜� �낅젰�섏꽭��.");
     	return false;
     }

    /* check whether input value is included space or not  */
     var retVal = checkSpace( str );
     if( retVal ) {
         alert("鍮꾨�踰덊샇�먮뒗 怨듬갚�� �덉쑝硫� �덈맗�덈떎.");
         return false;
     }
			if( str.length < 8 || str.length > 16 ){
				alert("鍮꾨�踰덊샇�� 8~16�먯쓽 �곷Ц ���뚮Ц�먯� �レ옄, �뱀닔臾몄옄瑜� �ъ슜�� �� �덉뒿�덈떎.");
				return false;
			}
     for( var i=0; i < str.length; ++i)
     {
         if( str.charAt(0) == str.substring( i, i+1 ) ) ++cnt;
     }
     if( cnt == str.length ) {
         alert("蹂댁븞 �곸쓽 �댁쑀濡� �� 臾몄옄濡� �곗냽�� 鍮꾨�踰덊샇�� �덉슜�섏� �딆뒿�덈떎.");
         return false;
     }

     var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
	 if( !isPW.test(str) ) {
         alert("鍮꾨�踰덊샇�� 8~16�먯쓽 �곷Ц ���뚮Ц�먯� �レ옄, �뱀닔臾몄옄瑜� �ъ슜�� �� �덉뒿�덈떎.");
         return false;
     }
     return true;
}


function isValid_passwd_ajax( str, obj )
{
     var cnt = 0;
     if( str == ""){
     	document.getElementById(obj).innerHTML = "鍮꾨�踰덊샇瑜� �낅젰�섏꽭��.";
     	return false;
     }

    /* check whether input value is included space or not  */
     var retVal = checkSpace( str );
     if( retVal ) {
         document.getElementById(obj).innerHTML = "鍮꾨�踰덊샇�먮뒗 怨듬갚�� �덉쑝硫� �덈맗�덈떎.";
         return false;
     }
			if( str.length < 8 || str.length > 16 ){
				document.getElementById(obj).innerHTML = "鍮꾨�踰덊샇�� 8~16�먯쓽 �곷Ц ���뚮Ц�먯� �レ옄, �뱀닔臾몄옄瑜� �ъ슜�� �� �덉뒿�덈떎.";
				return false;
			}
     for( var i=0; i < str.length; ++i)
     {
         if( str.charAt(0) == str.substring( i, i+1 ) ) ++cnt;
     }
     if( cnt == str.length ) {
         document.getElementById(obj).innerHTML = "蹂댁븞 �곸쓽 �댁쑀濡� �� 臾몄옄濡� �곗냽�� 鍮꾨�踰덊샇�� �덉슜�섏� �딆뒿�덈떎.";
         return false;
     }

     var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
	 if( !isPW.test(str) ) {
         document.getElementById(obj).innerHTML = "鍮꾨�踰덊샇�� 8~16�먯쓽 �곷Ц ���뚮Ц�먯� �レ옄, �뱀닔臾몄옄瑜� �ъ슜�� �� �덉뒿�덈떎.";
         return false;
     }
     return true;
}


function isValid_email( str )
{
     /* check whether inqput value is included space or not  */
     if(str == ""){
     	alert("�대찓�� 二쇱냼瑜� �낅젰�섏꽭��.");
     	return false;
     }
     var retVal = checkSpace( str );
     if( retVal ) {
         alert("�대찓�� 二쇱냼瑜� 鍮덇났媛� �놁씠 �ｌ쑝�몄슂.");
         return false;
     }

     if( -1 == str.indexOf('.') ) {
     	alert("�대찓�� �뺤떇�� �섎せ �섏뿀�듬땲��.");
        return false;
     }
     
     var list = str.split("@",2);  
     if(list.length > 1 && -1 == list[1].indexOf('.') ) {
     	alert("�대찓�� �뺤떇�� �섎せ �섏뿀�듬땲��.");
        return false;
     }

     /* checkFormat */
     var isEmail = /[-_.0-9a-zA-Z]+(\.[-_.0-9a-zA-Z]+)*@[-_.0-9a-zA-Z]+(\.[0-9a-zA-Z]+)*/;
     if( !isEmail.test(str) ) {
         alert("�대찓�� �뺤떇�� �섎せ �섏뿀�듬땲��.");
         return false;
     }
     if( str.length > 60 ) {
         alert("�대찓�� 二쇱냼�� 60�먭퉴吏� �좏슚�⑸땲��.");
         return false;
     }

     return true;
}

function isValid_email_myinfo( str, obj )
{
     /* check whether input value is included space or not  */
     if(str == ""){
     	document.getElementById(obj).innerHTML = "�대찓�� 二쇱냼瑜� �낅젰�섏꽭��.";
     	return false;
     }
     var retVal = checkSpace( str );
     if( retVal ) {
         document.getElementById(obj).innerHTML = "�대찓�� 二쇱냼瑜� 鍮덇났媛� �놁씠 �ｌ쑝�몄슂.";
         return false;
     }

     if( -1 == str.indexOf('.') ) {
    	 document.getElementById(obj).innerHTML = "�대찓�� �뺤떇�� �섎せ �섏뿀�듬땲��.";
        return false;
     }
     
     var list = str.split("@",2);  
     if(list.length > 1 && -1 == list[1].indexOf('.') ) {
    	document.getElementById(obj).innerHTML = "�대찓�� �뺤떇�� �섎せ �섏뿀�듬땲��.";
        return false;
     }

     /* checkFormat */
     var isEmail = /[-_.0-9a-zA-Z]+(\.[-_.0-9a-zA-Z]+)*@[-_.0-9a-zA-Z]+(\.[0-9a-zA-Z]+)*/;
     if( !isEmail.test(str) ) {
    	 document.getElementById(obj).innerHTML = "�대찓�� �뺤떇�� �섎せ �섏뿀�듬땲��.";
         return false;
     }
     if( str.length > 60 ) {
    	 document.getElementById(obj).innerHTML = "�대찓�� 二쇱냼�� 60�먭퉴吏� �좏슚�⑸땲��.";
         return false;
     }

     return true;
}

function isValid_pswdEmail( str , obj)
{
     /* check whether input value is included space or not  */
     if( -1 == str.indexOf('.') ) {
    	document.getElementById(obj).innerHTML = "�대찓�� �뺤떇�� �섎せ �섏뿀�듬땲��.";
        return false;
     }
     
     var list = str.split("@",2);  
     if(list.length > 1 && -1 == list[1].indexOf('.') ) {
    	document.getElementById(obj).innerHTML = "�대찓�� �뺤떇�� �섎せ �섏뿀�듬땲��.";
        return false;
     }

     /* checkFormat */
     var isEmail = /[-_.0-9a-zA-Z]+(\.[-_.0-9a-zA-Z]+)*@[-_.0-9a-zA-Z]+(\.[0-9a-zA-Z]+)*/;
     if( !isEmail.test(str) ) {
    	 document.getElementById(obj).innerHTML = "�대찓�� �뺤떇�� �섎せ �섏뿀�듬땲��.";
         return false;
     }
     if( str.length > 60 ) {
    	 document.getElementById(obj).innerHTML = "�대찓�� 二쇱냼�� 60�먭퉴吏� �좏슚�⑸땲��.";
         return false;
     }

     return true;
}


function isValid_email_local( str )
{
     /* check whether input value is included space or not  */
     if(str == ""){
     	alert("�대찓�� 二쇱냼瑜� �낅젰�섏꽭��.");
     	return false;
     }
     var retVal = checkSpace( str );
     if( retVal ) {
         alert("�대찓�� 二쇱냼瑜� 鍮덇났媛� �놁씠 �ｌ쑝�몄슂.");
         return false;
     }

     if( -1 == str.indexOf('.') ) {
     	alert("�대찓�� �뺤떇�� �섎せ �섏뿀�듬땲��.");
        return false;
     }
     
     var list = str.split("@",2);  
     if(list.length > 1 && -1 == list[1].indexOf('.') ) {
     	alert("�대찓�� �뺤떇�� �섎せ �섏뿀�듬땲��.");
        return false;
     }

     if( str.length > 60 ) {
         alert("�대찓�� 二쇱냼�� 60�먭퉴吏� �좏슚�⑸땲��.");
         return false;
     }

     return true;
}


function isValid_email2(word){
	for (var i=0; i< word.length; i++){
		var checkStr = word.charAt(i);

		if("@" == checkStr){
			return false;
		}
	}
	return true;
}

function isValid_name(str)
{
    str = str.replace(/(^\s*)|(\s*$)/g, "");
     if( str == '' ){
     	 alert("�대쫫�� �낅젰�섏꽭��.");
         return false;
     }

     var retVal = checkSpace( str );
     if( retVal ){
         alert("�대쫫�� �꾩뼱�곌린 �놁씠 �낅젰�섏꽭��.");
         return false;
     }
     if( !isHangul(str) ) {
         alert("�대쫫�� �쒓�濡� �낅젰�섏꽭��.");
         return false;
     }
     if( str.length > 10 ) {
         alert("�대쫫�� 10�먭퉴吏�留� �ъ슜�� �� �덉뒿�덈떎.");
         return false;
     }
     return true;
}

function isValid_ForeignName( str )
{
    /* check format */
    var isENAME = /^[A-Z  ]{3,40}$/;

    if( !isENAME.test( str ) ) { return false; }

    return true;
}
function isValid_Passport( str )
{
	/* check format */
    var isPASSPORT = /^[a-zA-Z0-9_]{4,40}$/;

    if( !isPASSPORT.test( str ) ) { return false; }

    return true;
}
// Validation Check �� 愿��⑤맂 UI �� �낅┰�곸씤 �⑥닔�� 紐⑥쓬  ###########################################################################

// �곗씠�� �먮떒�� �꾪븳 UI �� �낅┰�곸씤 �⑥닔�� 紐⑥쓬 ######################################################################################
function isXP()
{
	var agent = window.navigator.userAgent;
	if(agent.indexOf("MSIE")!= -1 && agent.indexOf("5.1") !=-1)
	    return true;     //SP1
    else
        return false;
}

function isXPSP2()
{
    var tmp_MSIE = window.navigator.userAgent.indexOf("MSIE");
    if(tmp_MSIE && window.navigator.userAgent.indexOf("SV1") > tmp_MSIE){
        return true;     //SP2
    }else{
        return false;
    }
}

function isIE7()
{
	var agent = window.navigator.userAgent;
	if(agent.indexOf("MSIE 7")!= -1)
	    return true;
    else
        return false;
}

function isIE8()
{
	var agent = window.navigator.userAgent;
	if(agent.indexOf("MSIE 8")!= -1)
	    return true;
    else
        return false;
}

function isIE()
{
	var agent = window.navigator.userAgent;
	if(agent.indexOf("MSIE")!= -1)
	    return true;
    else
        return false;
}

function isHangul(s)
{
     var len;
     len = s.length;

     for (var i = 0; i < len; i++)  {
         if (s.charCodeAt(i) != 32 && (s.charCodeAt(i) < 44032 || s.charCodeAt(i) > 55203))
         		return false;
     }

     return true;
}

// space 媛� �덉쑝硫� true, �놁쑝硫� false
function checkSpace( str )
{
     if(str.search(/\s/) != -1){
     	return true;
     } else {
        return false;
     }
}
//�곗씠�� �먮떒�� �꾪븳 UI �� �낅┰�곸씤 �⑥닔�� 紐⑥쓬 ######################################################################################

//�앹뾽�� 愿��⑤맂 UI �� �낅┰�곸씤 �⑥닔�� 紐⑥쓬  ################################################################################
 function winOpenAtCenter(sURL, sWindowName, w, h, sScroll) {
	  // �붾㈃ 以묒븰�쇰줈 Popup �꾩슦湲�.. �ㅽ겕濡ㅻ컮�� �듭뀡..
	  // ex)
	  //      openWin("test.asp", "winTest", 400, 300);     �� �ㅽ겕濡ㅻ컮 �놁쓬
	  //      openWin("test.asp", "winTest", 400, 300, "yes");  �� �ㅽ겕濡ㅻ컮 �덉쓬
	  //      openWin("test.asp", "winTest", 400, 300, "auto"); �� �ㅽ겕濡ㅻ컮 �먮룞

	  var x = (screen.width - w) / 2;
	  var y = (screen.height - h) / 2;

	  if (sScroll==null) sScroll = "no";

	  var sOption = "";
	  sOption = sOption + "toolbar=no, channelmode=no, location=no, directories=no, resizable=no, menubar=no";
	  sOption = sOption + ", scrollbars=" + sScroll + ", left=" + x + ", top=" + y + ", width=" + w + ", height=" + h;

	  var win = window.open(sURL, sWindowName, sOption);
	  return win;
}

function winOpenAtCenter2(sURL, sWindowName, w, h, sScroll) {
	var win2 = winOpenAtCenter(sURL, sWindowName, w, h, sScroll);
};

function window_resize(winWidth, winHeight) {

	// �ㅽ겕濡� �놁븷湲�
	document.body.style.overflow='hidden';

	var clintAgent = navigator.userAgent;
	var foxHeight = 80;
	var ieHeight = 60;
	var ie7Height = 80;
	var ie8Height = 70;

	if ( clintAgent.indexOf("MSIE") != -1 )	// IE �� 寃쎌슦
	{
		var res = isIE7();
		if( isIE7() ) {	window.resizeTo(winWidth, winHeight + ie7Height); }
		else if( isIE8() ) { window.resizeTo(winWidth, winHeight + ie8Height); }
		else { window.resizeTo(winWidth, winHeight + ieHeight); }
	}
	else	// IE 媛� �꾨땺 寃쎌슦
	{
		window.resizeTo(winWidth, winHeight + foxHeight);
	}

	
}

function resizePopup(w,h) {
	var foxHeight = 80;
	document.body.style.overflow='hidden';
	var clintAgent = navigator.userAgent;
    if ( clintAgent.indexOf("MSIE") != -1 ) {
        //window.resizeBy(w-document.body.clientWidth, h-document.body.clientHeight);
    	window.resizeTo(w, h);
    } else {
    	window.resizeTo(w, h + foxHeight);
    }
}

function resizeToBodySize()
{
	try{
	  window.innerWidth=parseInt(document.body.scrollWidth);
	  window.innerHeight=parseInt(document.body.scrollHeight);
	} catch(e) {	
	}	
}
// �앹뾽�� 愿��⑤맂 UI �� �낅┰�곸씤 �⑥닔�� 紐⑥쓬  ################################################################################

// 湲고� 誘몃텇瑜� �⑥닔�� 紐⑥쓬 ##############################################################################################
function setCookie(name, value, expiredays, domain) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	if ( domain=="" ) domain=".nid.naver.com";
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	                  + (domain ? "domain="+domain : "" ) + ";"
}

function getCookie( name ) {
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length ) {
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie ) {
	        if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
	            endOfCookie = document.cookie.length;
	        return unescape( document.cookie.substring( y, endOfCookie ) );
		}
		x = document.cookie.indexOf( " ", x ) + 1;
		if ( x == 0 )
		        break;
	}
	return "";
}


//二쇰�踰덊샇 �낅젰�� �� �먮룞�쇰줈 �ㅼ쓬 input �쇰줈 �대룞�쒕떎.
//�묎렐�깆쓣 怨좊젮�댁꽌 留뚮뱺 �ㅽ겕由쏀듃 �대떎. - 2008.03.19
var next_go = true;
var cur_val = null;
function moveNext(id_from,id_to,maxSize) {

	var cur = document.getElementById(id_from).value;
	curSize = cur.length;
	numFlag = isNumeric(cur);

	if ( !numFlag && curSize >= 1 && cur != '00' &&  cur != '000') {
		alert('�レ옄瑜� �낅젰�� 二쇱꽭��.');
		document.getElementById(id_from).value='';
		document.getElementById(id_from).focus();
		return false;
	}
	if (curSize == maxSize) {
		if(next_go || cur_val != cur)
		{
			cur_val = cur;
			next_go = false;
			document.getElementById(id_to).focus();
		}
		return true;
	}
	next_go = true;
}


var nextGo = true;
var curVal = null;
function moveNextNoCheckNum(id_from,id_to,maxSize) {

	var cur = document.getElementById(id_from).value;
	curSize = cur.length;
	numFlag = isNumeric(cur);

	if (curSize == maxSize) {
		if(nextGo || curVal != cur)
		{
			curVal = cur;
			nextGo = false;
			document.getElementById(id_to).focus();
		}
		return true;
	}
	nextGo = true;
}


// �꾪솕踰덊샇瑜� �낅젰�� �� �レ옄 ��, Tab, Enter �깅쭔 �낅젰�섎룄濡� �� �대깽�몃� 臾댄슚�� �쒕떎. - 2008.01.07
function num_only( Ev ){
    var evCode = ( window.netscape ) ? Ev.which : event.keyCode ;

    /// FF�� 寃쎌슦 Ev.which 媛믪쓣,
    //  IE�� 寃쎌슦 event.keyCode 媛믪쓣 evCode�� ����
    //  enter 媛� �숈옉�섎룄濡� evCode 13�� 異붽�
    if ( ! ( evCode == 0 || evCode == 8 || ( evCode >= 48 && evCode <= 57 ) || (evCode == 13) ) ) {
    // �뚮윭吏� �� 肄붾뱶媛� �レ옄媛� �꾨땶 寃쎌슦
    //    ( '0'�� FF�먯꽌 Tab ��,
    //      '8'�� FF�먯꽌 BackSpace媛� 癒뱁엳吏� �딆븘 �쎌엯)
        if ( window.netscape ) {        // FF�� 寃쎌슦
            Ev.preventDefault() ;       // �대깽�� 臾댄슚��
        } else {                        // IE�� 寃쎌슦
            event.returnValue=false;    // �대깽�� 臾댄슚��
        }
    }
}


function trim(string)
{
	for(;string.indexOf(" ")!= -1;)
	{
	 	string = string.replace(" ","");
	}

	return string;
}

function containsCharsOnly(input,chars)
{
  for(var i=0; i< input.length; i++) {
    if(chars.indexOf(input.charAt(i)) == -1)
    return false;
  }
  return  true;
}

function isNumeric(input)
{
  var chars = "0123456789";
  return containsCharsOnly(input,chars);
}

var db = new Array("1","2","3","4");
var agent = window.navigator.userAgent;
var busy = false;
function check_num(frm, sel) {
  if( !busy && db[sel] != document.getElementById(frm).value && document.getElementById(frm).value !="") {
    busy = true;

      var str = document.getElementById(frm).value;

        if( !isNumeric(str)) {
          if(agent.indexOf("Macintosh") != -1 || (navigator.userAgentData && navigator.userAgentData.platform.indexOf("macOS") !== -1))
            {
        	    document.getElementById(frm).value="";
                alert("�レ옄瑜� �낅젰�� 二쇱꽭��.");
                document.getElementById(frm).value="";
								db[sel] = "";
            }
            else {
                alert("�レ옄瑜� �낅젰�� 二쇱꽭��.");
                document.getElementById(frm).value="";
            }
        } else { db[sel] = document.getElementById(frm).value; }

    busy = false;
    }
  else { setTimeout("check_num('"+frm+"','"+sel+"')",10); }
}

function check_num_ajax(frm, sel, obj) {
	  if( !busy && db[sel] != document.getElementById(frm).value && document.getElementById(frm).value !="") {
	    busy = true;

	      var str = document.getElementById(frm).value;

	        if( !isNumeric(str)) {
	          if(agent.indexOf("Macintosh") != -1)
	            {
	        	    document.getElementById(frm).value="";
	                document.getElementById(obj).innerHTML="�レ옄瑜� �낅젰�� 二쇱꽭��.";
	                document.getElementById(frm).value="";
									db[sel] = "";
	            }
	            else {
	            	document.getElementById(obj).innerHTML="�レ옄瑜� �낅젰�� 二쇱꽭��.";
	                document.getElementById(frm).value="";
	            }
	        } else { db[sel] = document.getElementById(frm).value; }

	    busy = false;
	    }
	  else { setTimeout("check_num_ajax('"+frm+"','"+sel+"','"+obj+"')",10); }
	}

function check_num_ajax2(frm, sel, obj, obj2) {
	  if( !busy && db[sel] != document.getElementById(frm).value && document.getElementById(frm).value !="") {
	    busy = true;

	      var str = document.getElementById(frm).value;

	        if( !isNumeric(str)) {
	          if(agent.indexOf("Macintosh") != -1)
	            {
	        	    document.getElementById(frm).value="";
	        	    document.getElementById(obj).innerHTML="�レ옄瑜� �낅젰�� 二쇱꽭��.";
	        	    document.getElementById(obj2).innerHTML="";
	                document.getElementById(frm).value="";
					db[sel] = "";
	            }
	            else {
	            	document.getElementById(obj).innerHTML="�レ옄瑜� �낅젰�� 二쇱꽭��.";
	            	document.getElementById(obj2).innerHTML="";
	                document.getElementById(frm).value="";
	            }
	        } else { db[sel] = document.getElementById(frm).value; }

	    busy = false;
	    }
	  else { setTimeout("check_num_ajax('"+frm+"','"+sel+"','"+obj+"')",10); }
	}

    function check_num_ajax3(frm, sel, obj) {
	  if( !busy && db[sel] != document.getElementById(frm).value && document.getElementById(frm).value !="") {
	    busy = true;

	      var str = document.getElementById(frm).value;

	        if( !isNumeric(str)) {
	          if(agent.indexOf("Macintosh") != -1)
	            {
	        	    document.getElementById(frm).value="";
	        	    document.getElementById(obj).innerHTML="�レ옄瑜� �낅젰�� 二쇱꽭��.";
                    document.getElementById(obj).className = "popup_error";
	                document.getElementById(frm).value="";
                    document.getElementById(frm).classList.remove("verify");
					db[sel] = "";
	            }
	            else {
	            	document.getElementById(obj).innerHTML="�レ옄瑜� �낅젰�� 二쇱꽭��.";
                    document.getElementById(obj).className = "popup_error";
	                document.getElementById(frm).value="";
                    document.getElementById(frm).classList.remove("verify");
	            }
	        } else { db[sel] = document.getElementById(frm).value; }

	    busy = false;
	    }
	  else { setTimeout("check_num_ajax3('"+frm+"','"+sel+"','"+obj+"')",10); }
	}

function toggleObject(base, target){
	var baseObj = document.getElementById(base);
	var targetObj = document.getElementById(target);
	
	baseObj.style.display = "none";
	targetObj.style.display = "block";
	
	setContainerHeight(document.getElementById('content').clientHeight);
}

function toggleSingleObj(target){
	var targetObj = document.getElementById(target);
	if(targetObj.style.display == "block"){
		targetObj.style.display	= "none";
	}else{
		targetObj.style.display	= "block";
	}
	
	setContainerHeight(document.getElementById('content').clientHeight + 30);
}

function toggleObjectForPopUp(base, target){
	var baseObj = document.getElementById(base);
	var targetObj = document.getElementById(target);
	
	baseObj.style.display = "none";
	targetObj.style.display = "block";
}

function displayObj(target){
	var targetObj = document.getElementById(target);
    if(targetObj) {
        targetObj.style.display = "block";
    }
}

function hiddenObj(target){
	var targetObj = document.getElementById(target);
    if(targetObj) {
        targetObj.style.display = "none";
    }
}

function checkUninterruptNumber(str, limit){ 
	//c:�꾩옱臾몄옄 �꾩뒪�� 肄붾뱶 
	//o:c�� �댁쟾�곹깭 諛깆뾽, �댁쟾臾몄옄�� �꾩뒪�� 肄붾뱶媛� �쒕떎. 
	//p:c�� o�� �꾩뒪�� 肄붾뱶 李⑥씠媛믪쑝濡� �닿컪�� -1, 0, 1�대㈃ �댁썐�� �� 臾몄옄媛� �곗냽�대씪�� �섎� 
	//d:p�� �댁쟾�곹깭 諛깆뾽 p�� d媛� �숈씪�섎떎硫� �곗냽�� 怨꾩냽�쒕떎�� �섎��꾩쑝濡� 移댁슫�명븳��. 
	//n:p�� d媛� 媛숈쓣�뚮쭏�� 移댁슫�명븳 媛믪쑝濡�, p�� d媛� �ㅻⅤ硫� 0�쇰줈 珥덇린�뷀븳��. 
	//l:�곗냽�쇰줈 �깆옣�대룄 �섎뒗 �쒗븳媛믪씠怨� �ъ슜�먭� �낅젰移� �딆쑝硫� 4媛� 濡� �명듃.
	var o, d, p, n = 0, l = limit==null ? 4 : limit;
    for(var i=0; i < str.length; i++){ 
        var c = str.charCodeAt(i); 
        if(i > 0 && (p = o - c) >-2 && p < 2 && (n = p == d ? n+1 : 0) > l-3) return false; 
        d = p, o = c; 
    } 
    return true; 
}

function checkSameNumber(str, limit){ 
	//c:�꾩옱臾몄옄 �꾩뒪�� 肄붾뱶 
	//o:c�� �댁쟾�곹깭 諛깆뾽, �댁쟾臾몄옄�� �꾩뒪�� 肄붾뱶媛� �쒕떎. 
	//p:c�� o�� �꾩뒪�� 肄붾뱶 李⑥씠媛믪쑝濡� �닿컪�� 0�대㈃ �숈씪�� 臾몄옄瑜� �섎� 
	//d:p�� �댁쟾�곹깭 諛깆뾽 p�� d媛� �숈씪�섎떎硫� �곗냽�� 怨꾩냽�쒕떎�� �섎��꾩쑝濡� 移댁슫�명븳��. 
	//n:p�� d媛� 媛숈쓣�뚮쭏�� 移댁슫�명븳 媛믪쑝濡�, p�� d媛� �ㅻⅤ硫� 0�쇰줈 珥덇린�뷀븳��. 
	//l:�곗냽�쇰줈 �깆옣�대룄 �섎뒗 �쒗븳媛믪씠怨� �ъ슜�먭� �낅젰移� �딆쑝硫� 4媛� 濡� �명듃.
	var o, d, p, n = 0, l = limit==null ? 4 : limit;
    for(var i=0; i < str.length; i++){ 
        var c = str.charCodeAt(i); 
        if(i > 0 && (p = o - c) == 0 && (n = p == d ? n+1 : 0) > l-3) return false; 
        d = p, o = c; 
    } 
    return true; 
}

// 湲고� 誘몃텇瑜� �⑥닔�� 紐⑥쓬 ##############################################################################################