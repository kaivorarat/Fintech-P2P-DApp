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


โดยจะได้ Directory ต่างๆ  
contracts >> Directory สำหรับเก็บ Smart Contracts ที่เขียนด้วยภาษา Solidity  
migrations >> Directory สำหรับเก็บ File JavaScript ซึ่งเป็น Code ที่ใช้ในการจัดการ Smart Contracts ให้ลงไปยัง Block Chain  
src >> Directory สำหรับเก็บ File ที่เกี่ยวข้องกับ Web Application เช่น JavaScript, CSS, HTML, images เป็นต้น  
truffle-config.js >> File ที่ใช้ในการกำหนดค่าของโปรเจ็ค  

## Develop Web-Based DApp
### 1. Create Smart Contract
ใช้ Visual Studio Code เพื่อสร้างไฟล์ชื่อ Booking.sol ใน contracts Directory โดยมีโค้ดดังนี้
```
pragma solidity ^0.5.0;

contract Booking {
    address[8] public Bookers;

    function Reserve(uint CarID) public returns (uint) {
        require(CarID >= 0 && CarID <=7);
        Bookers[CarID] = msg.sender;
        return CarID;
    }

    function getBookers() public view returns (address[8] memory) {
        return Bookers;
    }
}
```

### 2. Compile และ Migrate
ทำการ Compile Smart Contracts โดยใช้คำสั่ง
```
truffle compile
```
โปรดตรวจสอบว่า Compile Smart Contracts ได้สำเร็จก่อนทำในขั้นตอนต่อไป

เปิดโปรแกรม Ganache โดยการ Double-Click ที่ชื่อไฟล์ จากนั้น Click ที่ New Workspace ในกรณีที่ใช้งานครั้งแรก  
หรือ Click ที่ Workspace ที่ต้องการใช้งาน

![Ganache](https://user-images.githubusercontent.com/74085959/104412400-c0a27c80-559e-11eb-9f71-76b59eb9e934.png)

![Ganache2](https://user-images.githubusercontent.com/74085959/104414342-ae2a4200-55a2-11eb-89a9-7c6a497a02d4.png)

ใช้ Visual Studio Code ในการสร้างไฟล์ 2_deploy_contracts.js ใน migrations Directory ดังนี้
```
var Booking = artifacts.require("Booking");

module.exports = function(deployer) {
  deployer.deploy(Booking);
};
```
