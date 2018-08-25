# Api description
### Market
  * 식당 등록
    * route: /market
    * method: POST
    * request: JSON
    ```json
    {
      "userId":"String",            
      "name":"String",              
      "desc":"String",              
      "bankName:":"String",         
      "accountNumber":"String",     
      "lat":"Double",               
      "lng":"Double"                
    }
    ```
    Request Example
    ```json
    {
	     "name":"고오급분식",
	     "desc":"마약",
	     "userId":"8df38cd5-43b7-46e6-b932-2b5b035b982c",
       "bankName":"짜잔은행",
       "accountNumber":"1234567890",
       "lat":37.489,
       "lng":127.06567881794948
     }
    ```
    * response: JSON
    ```json
    {
      "success":"Boolean",
      "message":"Null",
      "error":"Null",
      "data":""
    }
    ```
    Response Example
    ```json
    {
      "success": true,
      "message": null,
      "error": null
    }
    ```

  * 식당 정보 요청
    * route: /market
    * method: GET
    * request: JSON
    ```json
    {
      "marketId":"String"                           
    }
    ```
    Request Example
    /market?marketId=5b80cc86-ffb3-421e-be16-d3590aeb5dad
    * response: JSON
    ```json
    {
      "success":"Boolean",
      "message":"Null",
      "error":"Null",
      "data":"JSON"
    }
    ```
    Response Example
    ```json
    {
    "success": true,
    "message": null,
    "error": null,
    "data": {
        "location": {
            "coordinates": [
                127.06567881794948,
                37.48818689965271
            ],
            "type": "Point"
        },
        "creationDate": 1535178666316,
        "_id": "5b80cc86-ffb3-421e-be16-d3590aeb5dad",
        "name": "고오급레스토랑스",
        "desc": "마약",
        "userId": "8df38cd5-43b7-46e6-b932-2b5b035b982c",
        "bankName": "짜잔은행",
        "accountNumber": "1234567890",
        "__v": 0
      }
    }
    ```
  * 근처의 식당 리스트 요청
    * route: /market/near
    * method: PATCH
    * request: JSON
    ```json
    {    
      "lat":"Double",               
      "lng":"Double"                
    }
    ```
    Request Example
    ```json
    {
	    "lat":37.48818689965271,
	    "lng":127.06567881794948
    }
    ```
    * response: JSON
    ```json
    {
      "success":"Boolean",
      "message":"Null",
      "error":"Null",
      "data":""
    }
    ```
    Response Example
    ```json
    {
    "success": true,
    "message": null,
    "error": null,
    "data": [
      {
        "data": {
          "location": {
            "coordinates": [
                        127.06567881794948,
                        37.48818689965271
                  ],
                  "type": "Point"
            },
            "creationDate": 1535178666316,
            "_id": "5b80cc86-ffb3-421e-be16-d3590aeb5dad",
            "name": "고오급레스토랑스",
            "desc": "마약",
            "userId": "8df38cd5-43b7-46e6-b932-2b5b035b982c",
            "bankName": "짜잔은행",
            "accountNumber": "1234567890",
            "__v": 0      
        }
      },{
        "data": {
          "location": {
            "coordinates": [
                        127.0656767003739,
                        37.48821206635814
                    ],
                    "type": "Point"
            },
            "creationDate": 1535184474180,
            "_id": "d1b076dc-6e75-4d67-9245-bc85060feb2a",
            "accountNumber": "ㅇㅇㅇ",
            "bankName": "ㅇㅇㅇ",
            "desc": "ㅇㅇㅇ",
            "name": "ㅇㅇ",
            "userId": "8df38cd5-43b7-46e6-b932-2b5b035b982c",
            "__v":
          }
        }
    ]
    }
    ```

### Pass
### User
