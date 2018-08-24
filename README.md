# Pass
## To do list ##
1. Interface (API) 정의
  * Path 
  1. User
    1. Post: 유저 회원가입
    * request: {email:String, password:String, group:"user" | "manager" | "admin"}, 
    * response: {success:Boolean}
    2. Get: 유저 로그인
    * request: {email:String, password:String}
    * response: {success:Boolean}
  2. Market
    1. Post: 사업장생성
    request: {userId:String, name:String, bankname:String, accountNumber:String, lat:Double, lng:Double}
    response: {success:Boolean}
    2. Get: 사업장정보가져오기
    request: {marketId:String}
    response: {id:String, creationDate:Int, name:String, backName:String, accountNumber:String, lat:Double, lng:Double, userId: String}
    3. Patch: 가까운 사업장 리스트 가져오기 (market id list)
    request: {lat:Double, lng:Double}
    response: {items: [String, ...]
  3. Pass
    1. Post: 결제 이벤트 발생
    request: {userId:String, marketId:String, money:Int, tableName:String}
    response: {success:Boolean}
    2. Patch: 결제 기록 리스트 가져오기
    request: {marketId:String}
    response: {items: [String, ...]}
    3. Get: 결제 기록 가져오기
    request: {passId: String}
    response: {items: [String, ...]}
2. 클라이언트 API 정의 후 구현 ( 0 % )
3. 서버 API 정의 후 구현 ( 0 % )
