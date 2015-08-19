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

var _Debug_ = false;

function report_error (s)
{
  if (_Debug_)
	alert (s);
  else
	document.write ('<div class="error">' + s + '</div>');
}

function reload_as_top ()
{
  if (window != top) top.location.href = location.href;
}

function pad_10 (value)
{
  return ((value < 10) ? '0' + value : value);
}

function parseBool (value)
{
  if (value == 'true')
	return true;
  else
	return false;
}

var Layer_model_none	= 0;
var Layer_model_ns4		= 1;
var Layer_model_ie4		= 2;
var Layer_model_dom		= 3;
var Layer_model			= determine_layer_model ();

function determine_layer_model ()
	// determine which type of layer support is available
	// Check for the existence of the function or object
	// used to access the layer in each object model. If
	// it is there, then use that model.
	
	// Even if Netscape 4 has some DOM support, we still
	// use native layer support because Netscape 4's DOM
	// support is not good. However, any version of IE that
	// claims DOM support uses that instead of native MS-DOM
	// layers
{
	if (document.layers)
		return Layer_model_ns4;
	else if (document.getElementById)
		return Layer_model_dom;
	else if (document.all)
		return Layer_model_ie4;
	else
		return Layer_model_none;
}

function page_width ()
{
	if (Layer_model == Layer_model_dom)
		return (document.body.clientWidth ? document.body.clientWidth : window.innerWidth);
	else if (Layer_model == Layer_model_ns4)
		return window.innerWidth;
	else if (Layer_model == Layer_model_ie4)
		return document.body.clientWidth;
	else
		report_error ("Cannot determine page width");

	return 0;
}

function page_height ()
{
	if (Layer_model == Layer_model_dom)
		return (document.body.clientHeight ? document.body.clientHeight : window.innerHeight);
	else if (Layer_model == Layer_model_ns4)
		return window.innerHeight;
	else if (Layer_model == Layer_model_ie4)
		return document.body.clientHeight;
	else
		report_error ("Cannot determine page width");

	return 0;
}

function convert_style_value (value)
{
	if (! value)
		return 0;		

	if (value >= 0)
		return value;
	else
	{
		var len = value.length;

		if (len)
		{
			if ((value.substring(len - 2, len) == "px"))
				return value.substring (0, len - 2);
			else
				return value;
		}
		else
			return 0;
	}
}

function QUERY_STRING ()
{
  this._table = new Array ();
  this.count = 0;

  // Strip leading '?'

  var input = unescape (location.search.substring (1));

  // Split string into name/value pairs at '&' and '='

  if (input)
  {
	var pairs = input.split ('&');
	var pair = new Array ();
	var len = pairs.length;
	
	for (i = 0; i < len; i++)
		// Put the name = value pairs into the array
	{
		pair = pairs [i].split ('=');
		this._table [pair [0]] = pair [1]
		this.count++;
	}
  }	
}

QUERY_STRING.prototype.item = function (s)
{
  return this._table [s];
}

var Query_string = new QUERY_STRING ();
