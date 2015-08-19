/*
		Checks whether the return value is in allowable range or not.

		return value = -1 -- Value is null
		return value = 0 -- Value is in allowable limit
		return value = 1 -- Value is less than the minimum size specified
		return value = 2 -- Value is greater than the maximum size specified			
	*/
	function isValueInAllowableLimit(fieldValue,maxSize,minSize)
	{
		var fieldStatus = 0;
		fieldValue = trim(fieldValue);
		var size = fieldValue.length;
		if(isNull(fieldValue))
		{
			fieldStatus = -1;
		}
		else if(size<minSize)
		{
			fieldStatus = 1;
		}
		else if(size>maxSize)
		{
			fieldStatus = 2;
		}
		return fieldStatus;
	}
	/*
		Removes white spaces at both the ends
	*/
	function trim(str)
	{
		return str.replace(/^\s*|\s*$/g,"");
	}
	/*
		Returns true if the data is null or empty
		else returns false
	*/
	function isNull(fieldValue)
	{
		if(!fieldValue || trim(fieldValue) =="")
			return true;
		return false;
	}
	/*
		Returns true if the data is null or empty or not a valid number
		else returns false
		if isDecimal is false then checks for an ineteger
	*/
	function isNumber(fieldValue,isDecimal)
	{
		if(!isNull(fieldValue))
		{
			if(isDecimal == false)
			{
				if(fieldValue.indexOf('.')!=-1)
					return false;
			}		
			return !isNaN(fieldValue);
		}
		return false;		
	}
	function isValidAmount(fieldValue,isDecimal)
	{
		if(!isNull(fieldValue) && isNumber(fieldValue,isDecimal))
		{
			var decimalpointindex = fieldValue.indexOf(".");
			var decimalNumber = "";
			if(decimalpointindex > -1)
			{
				decimalNumber = fieldValue.substring(decimalpointindex);
				if(decimalNumber.length>4)
					return false;
			}
		}
		return false;		
	}
	/*
		Returns true if the data is null or empty or not alphanumeric
		else returns false		
	*/
	function isAphaNumeric(fieldValue)
	{
		var reAlphanumeric = /^[a-zA-Z0-9]+$/;
		if(!isNull(fieldValue))
		{
			return reAlphanumeric.test(fieldValue);
		}
		return false;
	}
	function hasOnlyCharacters(fieldValue)
	{
		var reChars = /^[a-zA-Z]+$/;
		if(!isNull(fieldValue))
		{
			return reChars.test(fieldValue);
		}
		return false;
	}

//	function compareDates1(fromDate,toDate,parseDateRequired,format)
//	{
//	    alert("Hi1");
//		//Parse Date Required = true specifies that the date format is MMM-dd-yyyy
		//False specifies that date format doesn't contain any alphabets 
//		if(!format)
//		{
//		    alert("Hi2");
//			format = "dd/mm/yyyy";
//		}
//		if(parseDateRequired==true)
//		{
//			fromDate = fromDate.replace(/(-)/g,' ');
//			toDate = toDate.replace(/(-)/g,' ');
//			fromDate = Date.parse(fromDate);
//			toDate = Date.parse(toDate);
//
	//		if(isNaN(fromDate))
		//	{
		//		//alert("From date is a not a valid date \n Date format should be MMM-dd-yyyy");
		//		return false;
			//}
//			if(isNaN(toDate))
	///		{
		//		//alert("To date is a not a valid date \n Date format should be MMM-dd-yyyy");
//				return false;
	//		}
	//	}
	///	else 
	//	{
		//    alert("Hi3");
			//fromDate = getDateFromFormat(fromDate,format);
//			toDate = getDateFromFormat(toDate,format);
  //			alert("fromDate:" + fromDate + "toDate :" + toDate);
	//	}
		//alert("Hi4");
//		if (fromDate >toDate) 
	//	{
		//    alert("Hi5");
			//alert("From date should not be greater than to date");
//			return false;
	//	}
	///	return true;
//	}


	///////////////////////////////////////////////////////////////////////////////
	//									Date.js									 //
	///////////////////////////////////////////////////////////////////////////////	

var MONTH_NAMES=new Array('January','February','March','April','May','June','July','August','September','October','November','December','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
var DAY_NAMES=new Array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sun','Mon','Tue','Wed','Thu','Fri','Sat');
function LZ(x) {return(x<0||x>9?"":"0")+x}

// ------------------------------------------------------------------
// isDate ( date_string, format_string )
// Returns true if date string matches format of format string and
// is a valid date. Else returns false.
// It is recommended that you trim whitespace around the value before
// passing it to this function, as whitespace is NOT ignored!
// ------------------------------------------------------------------
function isDate(val,format) {
	var date=getDateFromFormat(val,format);
	if (date==0) { return false; }
	return true;
	}

// -------------------------------------------------------------------
// compareDates(date1,date1format,date2,date2format)
//   Compare two date strings to see which is greater.
//   Returns:
//   1 if date1 is greater than date2
//   0 if date2 is greater than date1 of if they are the same
//  -1 if either of the dates is in an invalid format
// -------------------------------------------------------------------
function compareDates(date1,dateformat1,date2,dateformat2) {
	var d1=getDateFromFormat(date1,dateformat1);
	var d2=getDateFromFormat(date2,dateformat2);
	if (d1==0 || d2==0) {
		return -1;
		}
	else if (d1 > d2) {
		return 1;
		}
	return 0;
	}

// ------------------------------------------------------------------
// formatDate (date_object, format)
// Returns a date in the output format specified.
// The format string uses the same abbreviations as in getDateFromFormat()
// ------------------------------------------------------------------
function formatDate(date,format) {
	format=format+"";
	var result="";
	var i_format=0;
	var c="";
	var token="";
	var y=date.getYear()+"";
	var M=date.getMonth()+1;
	var d=date.getDate();
	var E=date.getDay();
	var H=date.getHours();
	var m=date.getMinutes();
	var s=date.getSeconds();
	var yyyy,yy,MMM,MM,dd,hh,h,mm,ss,ampm,HH,H,KK,K,kk,k;
	// Convert real date parts into formatted versions
	var value=new Object();
	if (y.length < 4) {y=""+(y-0+1900);}
	value["y"]=""+y;
	value["yyyy"]=y;
	value["yy"]=y.substring(2,4);
	value["M"]=M;
	value["MM"]=LZ(M);
	value["MMM"]=MONTH_NAMES[M-1];
	value["NNN"]=MONTH_NAMES[M+11];
	value["d"]=d;
	value["dd"]=LZ(d);
	value["E"]=DAY_NAMES[E+7];
	value["EE"]=DAY_NAMES[E];
	value["H"]=H;
	value["HH"]=LZ(H);
	if (H==0){value["h"]=12;}
	else if (H>12){value["h"]=H-12;}
	else {value["h"]=H;}
	value["hh"]=LZ(value["h"]);
	if (H>11){value["K"]=H-12;} else {value["K"]=H;}
	value["k"]=H+1;
	value["KK"]=LZ(value["K"]);
	value["kk"]=LZ(value["k"]);
	if (H > 11) { value["a"]="PM"; }
	else { value["a"]="AM"; }
	value["m"]=m;
	value["mm"]=LZ(m);
	value["s"]=s;
	value["ss"]=LZ(s);
	while (i_format < format.length) {
		c=format.charAt(i_format);
		token="";
		while ((format.charAt(i_format)==c) && (i_format < format.length)) {
			token += format.charAt(i_format++);
			}
		if (value[token] != null) { result=result + value[token]; }
		else { result=result + token; }
		}
	return result;
	}
	
// ------------------------------------------------------------------
// Utility functions for parsing in getDateFromFormat()
// ------------------------------------------------------------------
function _isInteger(val) {
	var digits="1234567890";
	for (var i=0; i < val.length; i++) {
		if (digits.indexOf(val.charAt(i))==-1) { return false; }
		}
	return true;
	}
function _getInt(str,i,minlength,maxlength) {
	for (var x=maxlength; x>=minlength; x--) {
		var token=str.substring(i,i+x);
		if (token.length < minlength) { return null; }
		if (_isInteger(token)) { return token; }
		}
	return null;
	}
	
// ------------------------------------------------------------------
// getDateFromFormat( date_string , format_string )
//
// This function takes a date string and a format string. It matches
// If the date string matches the format string, it returns the 
// getTime() of the date. If it does not match, it returns 0.
// ------------------------------------------------------------------
function getDateFromFormat(val,format) {
	val=val+"";
	format=format+"";
	var i_val=0;
	var i_format=0;
	var c="";
	var token="";
	var token2="";
	var x,y;
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth()+1;
	var date=1;
	var hh=now.getHours();
	var mm=now.getMinutes();
	var ss=now.getSeconds();
	var ampm="";
	
	while (i_format < format.length) {
		// Get next token from format string
		c=format.charAt(i_format);
		token="";
		while ((format.charAt(i_format)==c) && (i_format < format.length)) {
			token += format.charAt(i_format++);
			}
		// Extract contents of value based on format token
		if (token=="yyyy" || token=="yy" || token=="y") {
			if (token=="yyyy") { x=4;y=4; }
			if (token=="yy")   { x=2;y=2; }
			if (token=="y")    { x=2;y=4; }
			year=_getInt(val,i_val,x,y);
			if (year==null) { return 0; }
			i_val += year.length;
			if (year.length==2) {
				if (year > 70) { year=1900+(year-0); }
				else { year=2000+(year-0); }
				}
			}
		else if (token=="MMM"||token=="NNN"){
			month=0;
			for (var i=0; i<MONTH_NAMES.length; i++) {
				var month_name=MONTH_NAMES[i];
				if (val.substring(i_val,i_val+month_name.length).toLowerCase()==month_name.toLowerCase()) {
					if (token=="MMM"||(token=="NNN"&&i>11)) {
						month=i+1;
						if (month>12) { month -= 12; }
						i_val += month_name.length;
						break;
						}
					}
				}
			if ((month < 1)||(month>12)){return 0;}
			}
		else if (token=="EE"||token=="E"){
			for (var i=0; i<DAY_NAMES.length; i++) {
				var day_name=DAY_NAMES[i];
				if (val.substring(i_val,i_val+day_name.length).toLowerCase()==day_name.toLowerCase()) {
					i_val += day_name.length;
					break;
					}
				}
			}
		else if (token=="MM"||token=="M") {
			month=_getInt(val,i_val,token.length,2);
			if(month==null||(month<1)||(month>12)){return 0;}
			i_val+=month.length;}
		else if (token=="dd"||token=="d") {
			date=_getInt(val,i_val,token.length,2);
			if(date==null||(date<1)||(date>31)){return 0;}
			i_val+=date.length;}
		else if (token=="hh"||token=="h") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<1)||(hh>12)){return 0;}
			i_val+=hh.length;}
		else if (token=="HH"||token=="H") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<0)||(hh>23)){return 0;}
			i_val+=hh.length;}
		else if (token=="KK"||token=="K") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<0)||(hh>11)){return 0;}
			i_val+=hh.length;}
		else if (token=="kk"||token=="k") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<1)||(hh>24)){return 0;}
			i_val+=hh.length;hh--;}
		else if (token=="mm"||token=="m") {
			mm=_getInt(val,i_val,token.length,2);
			if(mm==null||(mm<0)||(mm>59)){return 0;}
			i_val+=mm.length;}
		else if (token=="ss"||token=="s") {
			ss=_getInt(val,i_val,token.length,2);
			if(ss==null||(ss<0)||(ss>59)){return 0;}
			i_val+=ss.length;}
		else if (token=="a") {
			if (val.substring(i_val,i_val+2).toLowerCase()=="am") {ampm="AM";}
			else if (val.substring(i_val,i_val+2).toLowerCase()=="pm") {ampm="PM";}
			else {return 0;}
			i_val+=2;}
		else {
			if (val.substring(i_val,i_val+token.length)!=token) {return 0;}
			else {i_val+=token.length;}
			}
		}
	// If there are any trailing characters left in the value, it doesn't match
	if (i_val != val.length) { return 0; }
	// Is date valid for month?
	if (month==2) {
		// Check for leap year
		if ( ( (year%4==0)&&(year%100 != 0) ) || (year%400==0) ) { // leap year
			if (date > 29){ return 0; }
			}
		else { if (date > 28) { return 0; } }
		}
	if ((month==4)||(month==6)||(month==9)||(month==11)) {
		if (date > 30) { return 0; }
		}
	// Correct hours value
	if (hh<12 && ampm=="PM") { hh=hh-0+12; }
	else if (hh>11 && ampm=="AM") { hh-=12; }
	var newdate=new Date(year,month-1,date,hh,mm,ss);
	return newdate.getTime();
	}

// ------------------------------------------------------------------
// parseDate( date_string [, prefer_euro_format] )
//
// This function takes a date string and tries to match it to a
// number of possible date formats to get the value. It will try to
// match against the following international formats, in this order:
// y-M-d   MMM d, y   MMM d,y   y-MMM-d   d-MMM-y  MMM d
// M/d/y   M-d-y      M.d.y     MMM-d     M/d      M-d
// d/M/y   d-M-y      d.M.y     d-MMM     d/M      d-M
// A second argument may be passed to instruct the method to search
// for formats like d/M/y (european format) before M/d/y (American).
// Returns a Date object or null if no patterns match.
// ------------------------------------------------------------------
function parseDate(val) {
	var preferEuro=(arguments.length==2)?arguments[1]:false;
	generalFormats=new Array('y-M-d','MMM d, y','MMM d,y','y-MMM-d','d-MMM-y','MMM d');
	monthFirst=new Array('M/d/y','M-d-y','M.d.y','MMM-d','M/d','M-d');
	dateFirst =new Array('d/M/y','d-M-y','d.M.y','d-MMM','d/M','d-M');
	var checkList=new Array('generalFormats',preferEuro?'dateFirst':'monthFirst',preferEuro?'monthFirst':'dateFirst');
	var d=null;
	for (var i=0; i<checkList.length; i++) {
		var l=window[checkList[i]];
		for (var j=0; j<l.length; j++) {
			d=getDateFromFormat(val,l[j]);
			if (d!=0) { return new Date(d); }
			}
		}
	return null;
	}
// returns a string that consists of the a Multiple number of Symbols.
      // for example, BuildString(x,5) returns "xxxxx"
    function BuildString (Symbol, Multiple)      
    {
    var CompoundString="";
      while (IsEqualTo(Multiple,"0") == "FALSE")
        {
          CompoundString = CompoundString + Symbol;
          Multiple = Subtraction(Multiple,"1");
        }
      return CompoundString;
    }

    function ZeroTrim(BloatyAnswer) // trim trailing zeroes after the decimal and leading zeroes before
    {
      if (BloatyAnswer.search(/\./i) == -1)
        {
        BloatyAnswer = BloatyAnswer + ".0";
        }
      if (BloatyAnswer.charAt(0) == ".")
        {
        BloatyAnswer = "0" + BloatyAnswer;
        }
      while (BloatyAnswer.charAt(BloatyAnswer.length - 1) == "0")
        {
          BloatyAnswer = BloatyAnswer.substring(0,BloatyAnswer.length - 1);
          // trim that last character off if it's a zero
        }
        if (BloatyAnswer.charAt(BloatyAnswer.length - 1) == ".")
          // trim off that last decimal point, if it's there
          {
            BloatyAnswer = BloatyAnswer.substring(0,BloatyAnswer.length - 1);
          }
      // trim leading zeroes, but if the answer is simply "0", then stop.
         while ((BloatyAnswer.length>1) && (BloatyAnswer.charAt(0)=="0") && (BloatyAnswer.charAt(1)!="."))
           {
             BloatyAnswer = BloatyAnswer.substring(1,BloatyAnswer.length);
           }
      return BloatyAnswer;
    }

    function SwitchSign(Arg)
    {
      if (Arg.charAt(0)=="-")
        Arg = Arg.substring(1,Arg.length);
      else
        {
          Arg="-"+Arg;
        }
      return Arg;
    }

    function IsLessThan(Arg1,Arg2) // Is Arg1 less than Arg2?
    {
      var Result = "";
      // If Arg1 is negative and Arg2 is positive, then the answer is automatically true
        if (Arg1.charAt(0) == "-" && Arg2.charAt(0) !="-") {Result = "TRUE"}
      // If Arg1 is positive and Arg2 is negative, then the answer is automatically false
        if (Arg1.charAt(0) != "-" && Arg2.charAt(0) =="-") {Result = "FALSE"}
      // If Arg1 = Arg2, then the answer is automatically false
        if (IsEqualTo(Arg1,Arg2) == "TRUE") {Result = "FALSE"}
      // If Arg1 and Arg2 are both negative, then we swap them, switch signs, and try again.
        if (Arg1.charAt(0) == "-" && Arg2.charAt(0) =="-") {Result = IsLessThan(SwitchSign(Arg2),SwitchSign(Arg1))}
      // If Arg1 and Arg2 are both positive
        if (Result == "")
          {
            // Pad them with zeroes to line up the decimal (if it exists)
               var type = "";
               var AnswerArray1 = Arg1.split("."); // Split into an array
               var AnswerArray2 = Arg2.split("."); // Split into an array
               // make sure arrays have '0' instead of 'undefined' or '' as elements
               // split produces a mixed response, an empty string on the left of the split
               // and undefined on the right of the split.  This is further complicated by
               // the fact that Navigator understands "undefined" in comparisions, but
               // IE doesn't, so I have to create a variable and assign it to a typeof.
                  if (AnswerArray1[0] == "") {AnswerArray1[0] = "0"}
                  type = typeof AnswerArray1[1];
                  if (type == "undefined") {AnswerArray1[1] = "0"}
                  if (AnswerArray2[0] == "") {AnswerArray2[0] = "0"}
                  type = typeof AnswerArray2[1];
                  if (type == "undefined") {AnswerArray2[1] = "0"}

               // Rebuild operands as strings with decimals.
                  Arg1 = AnswerArray1[0] + "." + AnswerArray1[1];
                  Arg2 = AnswerArray2[0] + "." + AnswerArray2[1];
               // if decimal split !=, then equalize by adding trailing zeroes to the short decimal
                  if (AnswerArray1[1].length > AnswerArray2[1].length)
                    {
                      Arg2 += BuildString("0",AnswerArray1[1].length-AnswerArray2[1].length+"");
                    }
                  if (AnswerArray2[1].length > AnswerArray1[1].length)
                    {
                      Arg1 += BuildString("0",AnswerArray2[1].length-AnswerArray1[1].length+"");
                    }

               // if integer split != then equalize by adding leading zeroes to the short integer
                  if (AnswerArray1[0].length > AnswerArray2[0].length)
                    {
                      Arg2 = BuildString("0",AnswerArray1[0].length-AnswerArray2[0].length+"") + Arg2;
                    }
                  if (AnswerArray2[0].length > AnswerArray1[0].length)
                    {
                      Arg1 = BuildString("0",AnswerArray2[0].length-AnswerArray1[0].length+"") + Arg1;
                    }
            var counter = 0;
            while ((Result=="") && (counter < Arg1.length))
            {
              if (Arg2.charAt(counter) < Arg1.charAt(counter)) {Result = "FALSE"}
              if (Arg2.charAt(counter) > Arg1.charAt(counter)) {Result = "TRUE"}
              counter++;
            }
          }
      // Return Result
        return Result;
    }


    function IsEqualTo(Arg1,Arg2)
    {
      var Result = "FALSE";
      if (Arg1.length == Arg2.length)
        {
          Result = "TRUE";
          for (counter = 0; counter < Arg1.length; counter++)
            {
              if (Arg1.charAt(counter) != Arg2.charAt(counter)) {Result = "FALSE"}
            }
        }

      // Return Result
        return Result;
    }

    function Subtraction(Minuend,Subtrahend) // Minuend - Subtrahend = Difference
    {
      var Difference = "";
      // Pad them with zeroes to line up the decimal (if it exists)
         var type="";
         var AnswerArray1 = Minuend.split("."); // Split into an array
         var AnswerArray2 = Subtrahend.split("."); // Split into an array
         // make sure arrays have '0' instead of 'undefined' or '' as elements
         // split produces a mixed response, an empty string on the left of the split
         // and undefined on the right of the split.  This is further complicated by
         // the fact that Navigator understands "undefined" in comparisions, but
         // IE doesn't, so I have to create a variable and assign it to a typeof.
            if (AnswerArray1[0] == "") {AnswerArray1[0] = "0"}
            type = typeof AnswerArray1[1];
            if (type == "undefined") {AnswerArray1[1] = "0"}
            if (AnswerArray2[0] == "") {AnswerArray2[0] = "0"}
            type = typeof AnswerArray2[1];
            if (type == "undefined") {AnswerArray2[1] = "0"}

         // Rebuild operands as strings with decimals.
            Minuend = AnswerArray1[0] + "." + AnswerArray1[1];
            Subtrahend = AnswerArray2[0] + "." + AnswerArray2[1];
         // if decimal split !=, then equalize by adding trailing zeroes to the short decimal
            if (AnswerArray1[1].length > AnswerArray2[1].length)
              {
                Subtrahend += BuildString("0",AnswerArray1[1].length-AnswerArray2[1].length+"");
              }
            if (AnswerArray2[1].length > AnswerArray1[1].length)
              {
                Minuend += BuildString("0",AnswerArray2[1].length-AnswerArray1[1].length+"");
              }
         // if integer split != then equalize by adding leading zeroes to the short integer
            if (AnswerArray1[0].length > AnswerArray2[0].length)
              {
                Subtrahend = BuildString("0",AnswerArray1[0].length-AnswerArray2[0].length+"") + Subtrahend;
              }
            if (AnswerArray2[0].length > AnswerArray1[0].length)
              {
                Minuend = BuildString("0",AnswerArray2[0].length-AnswerArray1[0].length+"") + Minuend;
              }
      // If Minuend == Subtrahend, then the answer is simply 0
         if (!Difference && (IsEqualTo(Minuend,Subtrahend)=="TRUE")) {Difference= "0"}
      // If Minuend is positive and Subtrahend is negative,
      // then this is an addition problem
         if (!Difference && Minuend.charAt(0)!="-" && Subtrahend.charAt(0)=="-")
           {
             Subtrahend=Subtrahend.substring(1,Subtrahend.length);
             Difference = CalculatorAdd(Minuend,Subtrahend);
           }
      // If Minuend and Subtrahend are negative, invert both
      //  signs and reverse operands -- continue
         if (!Difference && Minuend.charAt(0)=="-" && Subtrahend.charAt(0)=="-")
           {
             Subtrahend=Subtrahend.substring(1,Subtrahend.length);
             Minuend=Minuend.substring(1,Minuend.length);
             var TemporaryVariable = Subtrahend;
             Subtrahend = Minuend;
             Minuend = TemporaryVariable;
           }
      // If Minuend is negative and Subtrahend is positive, then
      // remove Minuend sign, process as an addition, and then
      // append negative sign.
         if (!Difference && Minuend.charAt(0) == "-" && Subtrahend.charAt(0) !="-")
           {
             Minuend=Minuend.substring(1,Minuend.length);
             Difference = "-" + CalculatorAdd(Minuend,Subtrahend);
           }
      // Minuend and Subtrahend are both positive numbers,
      // either because they started out that way, or they started
      // out as both negative numbers and were converted by an
      // earlier process.  For all other cases, Difference has
      // already been assigned a value
         if (!Difference)
           {
             // If the Minuend is smaller than the Subtrahend, then the
             // result will be a negative number, so set a "negative"
             // tag (NegativeTag = "-" instead of ""), reverse the
             // operands, and continue.
                var NegativeTag = "";
                if (IsLessThan(Minuend,Subtrahend)=="TRUE")
                {
                  var TempVariable = Minuend;
                  Minuend = Subtrahend;
                  Subtrahend = TempVariable;
                  NegativeTag="-";
                }
             // Perform the digit-by-digit subtraction
                var BorrowFlag="0";
                for (counter = Minuend.length-1; counter > -1; counter--)
                {
                  if (Minuend.charAt(counter) ==".") // then it's a decimal point
                    Difference = "." + Difference
                  else // it's a genuine number
                    {
                      // because it's a number, perform the subtraction and append it to Difference
                      var MinuendPiece = parseInt(Minuend.charAt(counter));
                      var SubtrahendPiece = parseInt(Subtrahend.charAt(counter));
                      if (BorrowFlag == 1) {BorrowFlag = 0; MinuendPiece = MinuendPiece -1}
                      if (MinuendPiece < 0) {MinuendPiece = 9; BorrowFlag = 1}
                      if (MinuendPiece < SubtrahendPiece)
                        {
                          MinuendPiece = MinuendPiece + 10;
                          BorrowFlag = 1;
                        }
                      Difference = (MinuendPiece - SubtrahendPiece) + Difference;
                    }
                }
             // Remove trailing and leading zeroes
                Difference = ZeroTrim(Difference);
             // Append to the NegativeTag
                Difference = NegativeTag + Difference;
           }
        // Return Difference
      return Difference;
    }

    function CalculatorAdd(operand1,operand2)
    {
      var answer = "";

      if (operand1.charAt(0)!="-" && operand2.charAt(0)=="-") {answer = Subtraction(operand1,SwitchSign(operand2))}
      if (operand1.charAt(0)=="-" && operand2.charAt(0)!="-") {answer = Subtraction(operand2,SwitchSign(operand1))}
      if (operand1.charAt(0)=="-" && operand2.charAt(0)=="-") {answer = Subtraction(operand1,SwitchSign(operand2))}
      if (answer=="")
      {
        // Equalize both sides of the decimals
           var Operand1LeftPad = "";
           var Operand2LeftPad = "";
           var Operand1RightPad = "";
           var Operand2RightPad = "";
           var Operand1RightSide = "";
           var Operand2RightSide = "";
           var Operand1LeftSide = "";
           var Operand2LeftSide = "";

           if (operand1.search(/\./) == -1) // then there is no decimal in operand1
             {
               Operand1RightSide = "0";
               Operand1LeftSide = operand1;
             }
             else // there is a decimal and we must determine the values of the sides
               {
                 Operand1RightSide=RegExp.rightContext;
                 Operand1LeftSide=RegExp.leftContext;
               }
           if (operand2.search(/\./) == -1) // then there is no decimal in operand2
             {
               Operand2RightSide = "0";
               Operand2LeftSide = operand2;
             }
             else // there is a decimal and we must determine the values of the sides
               {
                 Operand2RightSide=RegExp.rightContext;
                 Operand2LeftSide=RegExp.leftContext;
               }
           if (Operand1LeftSide.length > Operand2LeftSide.length)
             { Operand2LeftPad = BuildString("0",(Operand1LeftSide.length - Operand2LeftSide.length+"")+""); }
           if (Operand1LeftSide.length < Operand2LeftSide.length)
             { Operand1LeftPad = BuildString("0",(Operand2LeftSide.length - Operand1LeftSide.length)+""); }

           if (Operand1RightSide.length > Operand2RightSide.length)
             { Operand2RightPad = BuildString("0",(Operand1RightSide.length - Operand2RightSide.length)+""); }
           if (Operand1RightSide.length < Operand2RightSide.length)
             { Operand1RightPad = BuildString("0",(Operand2RightSide.length - Operand1RightSide.length)+""); }

           operand1 = Operand1LeftPad + Operand1LeftSide + "." + Operand1RightSide + Operand1RightPad;
           operand2 = Operand2LeftPad + Operand2LeftSide + "." + Operand2RightSide + Operand2RightPad;

      // perform digit-by-digit addition
         var CarryFlag = 0;
             answer = "";
         for (counter=operand1.length-1; counter > (-1); counter--)
           {
             var temp = parseInt(operand1.charAt(counter)) + parseInt(operand2.charAt(counter)) + parseInt(CarryFlag);
             if ((temp > (-1)) && (temp < 20))
               {
               if (temp > 9)
                 {
                   CarryFlag = 1;
                   answer = temp-10 + answer;
                 }
               else
                 {
                   CarryFlag = 0;
                   answer = temp + answer;
                 }
               }
             else
               {
                 answer = "." + answer;
                 
               }
           }
         
         if (CarryFlag == 1) {answer = "1" + answer}

          answer = ZeroTrim(answer);
      }
      return answer;
    }