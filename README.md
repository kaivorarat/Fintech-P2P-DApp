# Assignment : Fintech.UTCC.Dapp

เอกสารประกอบโครงการ (สร้างเป็นไฟล์ README.md ใน github)
- บทนำ แสดงวัตถุประสงค์ของโครงการ
- การวิเคราะห์และออกแบบ (Analysis & Design) เช่น การออกแบบ Smart Contract ที่ใช้งานในโครงการ, การวิเคราะห์และออกแบบ Front-End/Back-End ที่เกี่ยวข้อง เป็นต้น
- การจัดทำ (Implementation) ได้แก่ การอธิบายโค้ดเฉพาะส่วนที่สำคัญ
- ผลการทดสอบ (Testing) แสดงผลลัพธ์ที่ได้จากโครงการ

# p2p-blockchain
mini project นี้ใช้โครงสร้างของ truffle unbox Pet-Shop มาดัดแปลง
แนวคิดพัฒนา DApp สำหรับการกู้ยืมเงินระหว่างบุคคลโดยใช้ Dapp มาออกแบบเพื่อป้องกันการรับเงินกู้ที่ซ้ำซ้อนแล้วไปเกิดปัญหาการมีหนี้สินเกินตัว 
โดยมีขอบเขตดังนี้
- ส่วนของนักลงทุนเข้าไปเลือกที่จะให้เงินลงทุนกับเกษตรกร ที่มีต้นไม้ค้ำประกัน 
- เกษตรกรที่กู้ยืม สามารถถูกเลือกได้เพียงครั้งเดียว (จนกว่าจะเริ่ม deploy ใหม่)

# Analysis & Design
- ศึกษาส่วนติดต่อผู้ใช้โดยออกแบบ front end โดยในโปรเจคจะใช้ไฟล์ app2p.html  
- พัฒนา DApp ส่วนของข้อมูลเกษตรกร โดยใช้โครงสร้างของ truffle unbox pet-shop
- ทดลองการใช้งานโดยใช้ Matamask และ Ganache มาใช้จำลองเป็น private blockchain
 
# Front-End
   ไฟล์ app2p.html และ index.html ในโฟลเดอร์ src เป็นส่วนติดต่อกับผู้ใช้งาน  

# Back-End
   แก้ไขระบบหลังบ้านที่ไฟล์ app.js ให้สามารถใช้งาน private blockchain โดยเชื่อมต่อ Ganache และ Metamask 
   
# Implementation
- ติดตั้ง VisualStudioCode พร้อมกับติดตั้ง Solidity extension
- ทำการดาวน์โหลด Ganach Truffle. และใช้คำสั่ง chmod +x ganach...  
- ติดตั้ง npm  ใช้คำสั่ง  
```
sudo apt install npm

```
- ติดตั้ง truffle ใช้คำสั่ง 
```
sudo npm install -g truffle

```
- สร้าง Directory สำหรับบันทึก Project 
```
mkdir p2p
cd p2p
```
- ดาวน์โหลดโครงสร้าง pet-shop ซึ่งมีอยู่ใน Truffle Framework โดยใช้คำสั่งต่อไปนี้
```
truffle unbox pet-shop
```
---------------------------------
- แก้ไขไฟล์ Adoption.sol ให้รองรับการ adopt เกษตรกรจำนวน 16 คน
---------------------------------
```
pragma solidity ^0.5.0;

contract Adoption {
    address[16] public adopters;

    function adopt(uint borId) public returns (uint){
        require(borId >= 0 && borId <=15);
        adopters[borId] = msg.sender;
        return borId;
    }

    function getAdopters() public view returns (address[16] memory){
        return adopters;
    }
}

```

- สร้างไฟล์ app2p.html  สำหรับติดต่อผู้ใช้ เพื่อใช้งานโปรเจคง่ายขึ้น

```
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ioBiz.co P2P</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.6.1/css/bulma.min.css">
    <link rel="stylesheet" type="text/css" href="./build/home.css">
    
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.6.1/css/bulma.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="./app.js"></script>

  </head>
  <body>
   <!-- NAVBAR -->
    <nav class="navbar" role="navigation" aria-label="dropdown navigation">
      <a href="home.html" class="navbar-item">
        <b>ioBiz.co P2P</b>
      </a>
    
      <div class="navbar-item">
        <a href="#" class="navbar-item">
          Lender
        </a>
      </div>

      <div class="navbar-item">
        <a href="#" class="navbar-item">
          Borrower
        </a>
      </div>
    </nav>

  <section class="section">
    <div class="container">
      <div class="column">
        <div class="title-container">
          <h1 class="title" id="home-title">
              Peer to Peer 
          </h1>
          <p class="subtitle" id="home-subtitle">
            Built on the Ethereum blockchian
          </p>
        </div>
      </div>
      <div class="columns">
        <div class="column"> 
            <div class="card">
                <div class="card-content">
                  <p class="title">
                    ผู้ให้กู้ (Lenders)
                  </p><br>
                  <p class="subtitle">
                    นำเงินมาลงทุนเพื่อสร้างโอกาสให้เพื่อนเกษตรกร
                  </p>
                  <div class="ul-container">
                    <ul>
                        <li> <i class="fa fa-usd" aria-hidden="true"></i> มีผลตอบแทนให้</li>
                        <li> <i class="fa fa-usd" aria-hidden="true"></i> ระยะเวลายืดหยุ่น</li>
                        <li> <i class="fa fa-usd" aria-hidden="true"></i> ไร้ความเสี่ยง </li>
                    </ul>
                  </div>
                </div>
                <footer class="card-footer">
                  <p class="card-footer-item">
                    <span>
                        <a class="button is-link is-outlined" href="http://localhost:3000/"> ให้โอกาส! </a>
                    </span>
                  </p>
                </footer>
              </div>
        </div>
        <div class="column">
            <div class="card">
                <div class="card-content">
                  <p class="title">
                    ผู้กู้ยืม (Borrowers)
                  </p><br>
                  <p class="subtitle">
                    เงินทุนหมุนเวียนด่วน ใช้เพียงแค่มีต้นไม้มาค้ำประกัน
                  </p>
                  <div class="ul-container">
                    <ul>
                        <li> <i class="fa fa-usd" aria-hidden="true"></i> ไม่มีค่าธรรมเนียมแอบแฝง</li>
                        <li> <i class="fa fa-usd" aria-hidden="true"></i> ดอกเบี้ยต่ำ </li>
                        <li> <i class="fa fa-usd" aria-hidden="true"></i> รับเงินทันที </li>
                      </ul>
                  </div>
                </div>
                <footer class="card-footer">
                  <p class="card-footer-item">
                      <span>
                          <a class="button is-link is-outlined" href="https://iobiz.co/iot"> เพิ่มโอกาส! </a>
                      </span>
                  </p>
                </footer>
              </div>
        </div>
      </div>
<!-- 
      <label for="amount">Amount:</label>
      <input type="text" id="amount" placeholder="e.g., 95"></input>
      <button id="send" onclick="App.requestLoan()">Get MetaCoin</button> -->
      <br>
    </div>
  </section>
  </body>
</html>

```
 
- ไฟล์ bors.json กำหนดข้อมูลที่จำเป็นของเกษตรกรที่ขอกู้ เช่น ชื่อ, รูปภาพ, ผลตอบแทนที่ให้, ข้อมูลต้นไม้, เงินที่ต้องการกู้ยืม
 
```
 {
    "id": 0,
    "name": "Praitun Yoovidhya",
    "picture": "images/B1.jpg",
    "return": "3%",
    "idtree": "T001",
    "loan": 3000
  },
  
```
 

# Testing
ทำการทดสอบ

เปิดโปรแกรม Ganache

![Ganache](https://user-images.githubusercontent.com/74085966/104696674-37777b00-5741-11eb-858b-b745f5335c18.png)


![Ganache](https://user-images.githubusercontent.com/74085966/104696728-4e1dd200-5741-11eb-9915-de156df0ccc7.png)



ใช้คำสั่งเพื่อรันไฟล์

```
truffle migrate 

npm run dev

```
เปิดไฟล์ app2p.html จะได้ตามตัวอย่างภาพ

![Ganache](https://user-images.githubusercontent.com/74085966/104696569-1020ae00-5741-11eb-8802-0a86816bc594.png)

ทำการกด adopt และยืนยันการปล่อยกู้ให้เกษตรกร

![Ganache](https://user-images.githubusercontent.com/74085966/104696814-6a217380-5741-11eb-94be-c6742e506438.png)

เมื่อทำการเลือกที่จะปล่อยกู้ให้เกษตรกรไปแล้วจะไม่สามารถกดซ้ำได้อีก

![Ganache](https://user-images.githubusercontent.com/74085966/104696881-7f969d80-5741-11eb-8d68-336a6659332a.png)

# back-end ตรวจสอบ transaction ที่ Ganache 

![Ganache](https://user-images.githubusercontent.com/74085966/104696960-9a691200-5741-11eb-8724-fa662fc67d9a.png)



 
