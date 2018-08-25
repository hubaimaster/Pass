# Pass
## To do list ##
# 1. Model 정의 #
  * ## User ##
   - id: String (UUID4)
   - creationDate: Int (Unixtime)
   - name: String 
   - password: String
   - group: "user" | "manager"
   - email: String (로그인할때 사용)
   - marketId: String (사장님이 가게 등록할경우 사용)
   - money: Int
  * ## Market ##
   - id: String (UUID4)
   - creationDate: Int (Unixtime)
   - name: String
   - bankName: String
   - accountNumber: String
   - lat (Double)
   - lng (Double)
   - userId (String)
  * ## Pass ##
   - id: String (UUID4)
   - creationDate: Int (Unixtime)
   - userId: String
   - marketId: String
   - money: Int
  
# 2. Interface (API) 정의 #
  * ## User ##
    - ### Post: 유저 회원가입 ###
     + route: /user/register
     * request: {email:String, password:String, group:"user" | "manager"}
     * response: {success:Boolean}
    - ### Post: 유저 로그인 ###
     + route: /user/login
     + request: {email:String, password:String}
     + response: {id: String, creationDate: Int, name: String, password: String, group: String, email: String, money: Int, marketId: String}
  * ## Market ##
    - ### Post: 사업장생성 ###
     + request: {userId:String, name:String, bankName:String, accountNumber:String, lat:Double, lng:Double}
     + response: {success:Boolean}
    - ### Get: 사업장정보가져오기 ###
     + request: {marketId:String}
     + response: {id:String, creationDate:Int, name:String, bankName:String, accountNumber:String, lat:Double, lng:Double, userId: String}
    - ### Patch: 가까운 사업장 리스트 가져오기 (market id list) ###
     + request: {lat:Double, lng:Double}
     + response: {items: [String, ...]}
  * ## Pass ##
    - ### Post: 결제 이벤트 발생 ###
     + request: {userId:String, marketId:String, money:Int, tableName:String}
     + response: {success:Boolean}
    - ### Get: 결제 기록 가져오기  ###
     + request: {passId: String}
     + response: {id: String, creationDate: Int, userId: String, marketId: String, money: Int}
    - ### Patch: 결제 기록 리스트 가져오기 (최근순) ###
     + request: {marketId:String}
     + response: {items: [String, ...]}
    - ### Delete: 결제 기록 삭제 (결제 확인) ###
     + request: {passId: String}
     + response: {success: Boolean}
    
3. 클라이언트 API 정의 후 구현 ( 0 % )
4. 서버 API 정의 후 구현 ( 0 % )
