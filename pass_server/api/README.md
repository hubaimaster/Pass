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
    * request: Http params
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
      "data":"List of JSON"
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
              "__v": 0
            }
          }
        ]}
        ```

  * 사장님(manager)의 식당 리스트 요청
    * route: /market/users
    * method: PATCH
    * request: JSON
    ```json
    {    
      "userId":"String"            
    }
    ```
      Request Example
      ```json
      {
        "userId":"8df38cd5-43b7-46e6-b932-2b5b035b982c"
      }
      ```
    * response: JSON
    ```json
    {
      "success":"Boolean",
      "message":"Null",
      "error":"Null",
      "data":"List of JSON"
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
          },
          {
            "data": {
              "location": {
                "coordinates": [
                  127.06567881794948,
                  37.489
                ],
                "type": "Point"
              },
              "creationDate": 1535179417717,
              "_id": "a7022d1b-733a-4a13-b9cd-e1cf9dc86c2a",
              "name": "고오급분식",
              "desc": "분식",
              "userId": "8df38cd5-43b7-46e6-b932-2b5b035b982c",
              "bankName": "짜잔은행",
              "accountNumber": "1234567890",
              "__v": 0
            }
          },
          {
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
              "__v": 0
            }
          }
        ]
      }
      ```

### Pass
  * Pass 트랜젝션 생성
    * route: /pass
    * method: POST
    * request: JSON
    ```json
    {
      "userId":"String",
      "marketId":"String",
      "tableName":"String",
      "money":"Number"
    }
    ```
    Request Example
    ```json
    {
      "userId":"8df38cd5-43b7-46e6-b932-2b5b035b982c",
      "marketId":"d1b076dc-6e75-4d67-9245-bc85060feb2a",
      "tableName":"999",
      "money":15000
    }
    ```
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
        "creationDate": 1535186067822,
        "userId": "8df38cd5-43b7-46e6-b932-2b5b035b982c",
        "marketId": "d1b076dc-6e75-4d67-9245-bc85060feb2a",
        "tableName": "999",
        "money": 15000,
        "_id": "c22d0852-553d-4bf0-9a16-47b609ac3cb8",
        "__v": 0
      }
    }
    ```
  * Pass 기록 요청
    * route: /pass
    * method: GET
    * request: Http params
    Request Example
    /pass?marketId=test
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
        "creationDate": 1535156351674,
        "_id": "903125ae-2f28-4cf5-82e3-2c05d618e7df",
        "userId": "test",
        "marketId": "test",
        "money": 10000,
        "__v": 0
      }
    }          
    ```

  * Pass 기록 목록 요청(latest)
    * route: /pass
    * method: PATCH
    * request: JSON
    ```json
    {
      "marketId":"String"
    }
    ```
    Request Example
    ```json
    {
      "marketId":"5b80cc86-ffb3-421e-be16-d3590aeb5dad"
    }
    ```
    * response: JSON
    ```json
    {
      "success":"Boolean",
      "message":"Null",
      "error":"Null",
      "data":"List of JSON"
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
            "creationDate": 1535186067822,
            "_id": "10065593-09e8-48a2-b5a7-5e140d39e64e",
            "userId": "8df38cd5-43b7-46e6-b932-2b5b035b982c",
            "marketId": "5b80cc86-ffb3-421e-be16-d3590aeb5dad",
            "tableName": "999",
            "money": 1000,
            "__v": 0
          }
        },
        {
          "data": {
            "creationDate": 1535186067822,
            "_id": "75a63f46-9881-4caa-9a5b-42289b8eca41",
            "userId": "8df38cd5-43b7-46e6-b932-2b5b035b982c",
            "marketId": "5b80cc86-ffb3-421e-be16-d3590aeb5dad",
            "tableName": "999",
            "money": 5000,
            "__v": 0
          }
        }
      ]
    }
    ```

  * Pass 트랜젝션 삭제
    * route: /pass
    * method: DELETE
    * request: JSON
    ```json
    {
      "passId":"String"
    }
    ```
    Request Example
    ```json
    {
      "passId":"b88ea39b-a4d1-4553-a2bf-68b44e2b4ed7"
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
### User
