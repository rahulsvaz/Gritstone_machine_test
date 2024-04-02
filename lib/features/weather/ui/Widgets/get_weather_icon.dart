

import 'package:flutter/material.dart';

class HelperWidgets{



 static Widget getWeatherIcon(int code, double height) {
		switch (code) {
		  case >= 200 && < 300 :
		    return Image.asset(
					'assets/images/7.png'
				);
			case >= 300 && < 400 :
		    return Image.asset(
          height: height * 0.34,
					'assets/images/2.png'
				);
			case >= 500 && < 600 :
		    return Image.asset(
           height: height * 0.34,
					'assets/images/3.png'
				);
			case >= 600 && < 700 :
		    return Image.asset(
           height: height * 0.34,
					'assets/images/7.png'
				);
			case >= 700 && < 800 :
		    return Image.asset(
           height: height * 0.34,
					'assets/images/5.png'
				);
			case == 800 :
		    return Image.asset(
           height: height * 0.34,
					'assets/images/6.png'
				);
			case > 800 && <= 804 :
		    return Image.asset(
           height: height * 0.34,
					'assets/images/4.png'
				);
		  default:
			return Image.asset(
         height: height * 0.34,
				'assets/images/8.png'
			);
		}
	}
}