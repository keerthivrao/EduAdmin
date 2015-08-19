/****************************************************************************

Copyright (c) 2002 Marco Von Ballmoos

This file is part of earthli WebCore.

earthli WebCore is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

earthli WebCore is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with earthli WebCore; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

For more information about the earthli WebCore, visit:

http://www.earthli.com/software/webcore

****************************************************************************/

/** 2-digit years after this one are considered part of the 20th century. */
var Date_century_break = 30;

/** Requests output in US date format (1/1/2004). */
var Date_format_us = 'm/d/Y';
/** Requests output in Euro date format (1.1.2004). */
var Date_format_iso = 'Y-m-d';
/** Requests output in ISO date format (2004-1-1). */
var Date_format_euro = 'd.m.Y';

var Date_format_h = 'd-M-Y';

/** Regular expression for validating positive integers. */
var Date_is_number = new RegExp ("^\d+$");
/** Regular expression for reading US-formatted dates.
 * Reads expressions like 1/1/2004 12:00:00
 * Time is optional. Leading zeros are optional. */
var Date_ereg_us = new RegExp ('^(([0-9]{1,2})/([0-9]{1,2})/([0-9]{2,4}))?[ ]?(([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2}))?$');
/** Regular expression for reading Euro-formatted dates.
 * Reads expressions like 1.1.2004 12:00:00
 * Time is optional. Leading zeros are optional. */
var Date_ereg_euro = new RegExp ('^(([0-9]{1,2})\.([0-9]{1,2})\.([0-9]{2,4}))?[ ]?(([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2}))?$');
/** Regular expression for reading US-formatted dates.
 * Reads expressions like 2004-1-1 12:00:00
 * Time is optional. Leading zeros are optional. */
var Date_ereg_iso = new RegExp ('^(([0-9]{2,4})-([0-9]{1,2})-([0-9]{1,2}))?[ ]?(([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2}))?$');

var Month_names = new Array ("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
var Month_short_names = new Array ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
var Weekday_names = new Array ("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
var Weekday_short_names = new Array ("Su", "Mo", "Tu", "We", "Th", "Fr", "Sa");

var Short_date_and_time = 1;
var Short_month_and_year = 2;
var Slashed_date = 3;

/** Format 'd' using 'fmt'; uses PHP formatting directives.
 * @param Date d
 * @param string fmt
 * @return string */
function format_date_time (d, fmt)
{
  var result = '';
  var ch = '';
  var escape_active = false;

  var len = fmt.length;
  for (var iFmt = 0; iFmt < len; iFmt++)
  {
	  ch = fmt.charAt(iFmt);
	  if (! escape_active)
	  {
		  switch (ch)
		  {
		  case '\\':
			  escape_active = true;
			  break;
		  case 'Y':
			  result += d.getFullYear ();
			  break;
		  case 'm':
			  result += pad_10 (d.getMonth () + 1);
			  break;
		  case 'l':
			  result += Weekday_names [d.getDay ()];
			  break;
		  case 'M':
			  result += Month_names [d.getMonth ()];
			  break;
		  case 'n':
			  result += d.getMonth () + 1;
			  break;
		  case 'j':
			  result += d.getDate ();
			  break;
		  case 'd':
			  result += pad_10 (d.getDate ());
			  break;
		  case 'H':
			  result += pad_10 (d.getHours());
			  break;
		  case 'i':
			  result += pad_10 (d.getMinutes());
			  break;
		  case 's':
			  result += pad_10 (d.getSeconds());
			  break;
		  default:
			  result += ch;
		  }
	  }
	  else
	  {
		  result += ch;
		  escape_active = false;
	  }
  }

  return result;

}

/** Format a date from number of seconds.
 * @param integer secs
 * @param string fmt
 * @return string
 * @see format_date_time */
function local_time (secs, fmt)
{
  return format_date_time (new Date (secs * 1000), fmt);
}

/** Expand 2-digit year to 4 digits.
 * Use the 'century_break' to decide whether to map the year into the 20th or 21st century.
 * @param integer y
 * @param integer century_break
 * @return integer */
function expand_year (y, century_break)
{
  Result = parseInt (y);

  if (Result < 100)
  {
	if (! century_break)
	  century_break = Date_century_break;
	
	if (Result <= century_break)
	  Result += 2000;
	else
	  Result += 1900;
  }

  return Result;
}

/** Convert a string to a date/time, if possible.
 * @param string s
 * @return Date */
function date_time_from_string (s, century_break)
{
  if (! century_break)
	century_break = Date_century_break;

  var Result = null;
  var arr = Date_ereg_us.exec (s);
  if (arr)
  {
	y = arr [4];
	m = arr [2];
	d = arr [3];
  }
  else
  {
	arr = Date_ereg_iso.exec (s);
	if (arr)
	{
	  y = arr [2];
	  m = arr [3];
	  d = arr [4];
	}
	else
	{
	  arr = Date_ereg_euro.exec (s);
	  if (arr)
	  {
		y = arr [4];
		m = arr [3];
		d = arr [2];
	  }
	}
  }

  if (arr)
  {
	if (arr [6])
	  Result = new Date (expand_year (y, century_break), m - 1, d, arr [6], arr [7], arr [8]);
	else
	  Result = new Date (expand_year (y, century_break), m - 1, d);
  }

  return Result;
}
