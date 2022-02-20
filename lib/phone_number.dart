 class PhoneNumber {
  
  String clean(String number){
    String result = number.replaceAll(new RegExp('[^0-9]'), '');
    String exchangeCode = result.length == 11? result.substring(4):result.substring(3);
    String areaCode = result.length == 11 ? result.substring(1, 4): result.substring(0, 3);


    if(exchangeCode[0] == "0"){
      throw new FormatException("exchange code cannot start with zero");
    }
    if(exchangeCode[0] == "1"){
      throw new FormatException("exchange code cannot start with one");
    }
    if(areaCode[0] == "0"){
      throw new FormatException("area code cannot start with zero");
    }
    if(number.contains(new RegExp(r'[A-Za-z]'))){
      throw new FormatException("letters not permitted");
    } 
    if( areaCode[0] == "1" && result.length >=10){
      throw new FormatException("area code cannot start with one");
    }
    if(result.length < 11 && !number.contains(new RegExp(r'[-@:!-(). ]'))){
     throw new FormatException("incorrect number of digits");
    }
    if(result.length == 11 && result[0] == "1"){
      return result.substring(1);
    }
    if(result.length > 11){ 
      throw new FormatException("more than 11 digits");
    } 
    if(areaCode[0] != "1" && !number.contains(new RegExp(r'[-@:!-(). ]'))){
      throw new FormatException("11 digits must start with 1");
    }
    if(number.contains(new RegExp(r'[@:!]'))){
      throw new FormatException("punctuations not permitted");
    }
    if(number.contains(new RegExp(r'[(). ]'))){
      return result;
    }
  }
}
