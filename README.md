# Pass
## To do list ##
# 1. Model 정의 #
  * ## User ##
   - id: String (UUID4)
   - creationDate: Int (Unixtime)
   - name: String 
   - password: String
   - group: String ("user" | "manager")
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
     * request: {email:String, password:String, group:"user" | "manager"}
     * response: {success:Boolean}
    - ### Get: 유저 로그인 ###
     + request: {email:String, password:String}
     + response: {success:Boolean}
  * ## Market ##
    - ### Post: 사업장생성 ###
     + request: {userId:String, name:String, bankname:String, accountNumber:String, lat:Double, lng:Double}
     + response: {success:Boolean}
    - ### Get: 사업장정보가져오기 ###
     + request: {marketId:String}
     + response: {id:String, creationDate:Int, name:String, backName:String, accountNumber:String, lat:Double, lng:Double, userId: String}
    - ### Patch: 가까운 사업장 리스트 가져오기 (market id list) ###
     + request: {lat:Double, lng:Double}
     + response: {items: [String, ...]}
  * ## Pass ##
    - ### Post: 결제 이벤트 발생 ###
     + request: {userId:String, marketId:String, money:Int, tableName:String}
     + response: {success:Boolean}
    - ### Get: 결제 기록 가져오기 (최근순) ###
     + request: {passId: String}
     + response: {items: [String, ...]}
    - ### Patch: 결제 기록 리스트 가져오기 ###
     + request: {marketId:String}
     + response: {items: [String, ...]}
    
3. 클라이언트 API 정의 후 구현 ( 0 % )
4. 서버 API 정의 후 구현 ( 0 % )
