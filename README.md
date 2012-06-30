
Icon Weather Forecast for Geektool
===================================

Using this script with GeekTool, you can put your original weather forecast icons on your desktop.
[Yahoo! Weather API][] is used as the forecast service.

[Yahoo! Weather API]: http://developer.yahoo.com/weather/



Install
----------------------------------------------------

1. Install some Perl modules.
	execute following commands on Terminal.app.

		$ sudo cpan -i XML::Simple
		$ sudo cpan -i LWP::Simple

2. Save the folder that you downloaded to somewhere you like.
	For example  `/Users/_YOUR_ACCOUNT_/Library/Application Support/GeekTool/`.

3. Set the locations by WOEID.
	Open weather.pl on your favorite text editor and
	modify values about at line 17 to the location where you want to get the forecast.
	

4. Make a new shell geeklet on GeekTool. 
	Input following command in the _Command_ field
	
		perl <PATH TO SCRIPT>/weather.pl
		
	and also input your refresh span time in the _Refresh every_ field.
	'Course this geeklet is only for executing Perl script, itself displays nothing.

5. After the first execute of weather.pl, forecasted weather icons will be created in results/ folder.
	Make a new image geeklet on Geektool and chose the created icon file.
	Don't forget to set its refresh span.
	

Customization of Weather Icons
----------------------------------------------------
Put the icons you made into icons/ folder.
To relate icon images to Yahoo's weather codes (condition codes), modify weather.pl at about line 24.
The left values are icon's file names and the right values are Yahoo's condition codes for them.

about condition code see web page [Yahoo! Weather API][].


Author
----------------------------------------------------
1024jp

- website: [Wolfrosch](http://wolfrosch.com/)
- github : [1024jp](https://github.com/1024jp)


 
License
-------------
Icon Weather Forecast for Geektool by 1024jp is licensed under a [Creative Commons Attribution-NonCommercial 3.0 Unported License](http://creativecommons.org/licenses/by-nc/3.0/).
