class Api {
  static const String ip = '192.168.11.181';

  static const String baseUrl = 'http://$ip:8000/';  
  static var token = "";         
  static List<Map<String, dynamic>> chapters = []; 
  tokenchange(String newtoken) {
    token = newtoken;
  }   
  static String user= "";
  static String userId="1";
  static bool logedIn = false;
  login(String newuser,String newuserid) {
    user = newuser;
    userId=newuserid;
    logedIn = true;
    print("logged in");
    print(userId);
  }
  logout() {
    user = "";
    userId='';
    token = "";
    logedIn = false;
    print("logged out");
  }
  // getChapters(List<Map<String, dynamic>> chapters) {
  //   this.chapters = chapters;
  // }

}
