# p2p-blockchain

เอกสารประกอบโครงการ (สร้างเป็นไฟล์ README.md ใน github)
- บทนำ แสดงวัตถุประสงค์ของโครงการ
- การวิเคราะห์และออกแบบ (Analysis & Design) เช่น การออกแบบ Smart Contract ที่ใช้งานในโครงการ, การวิเคราะห์และออกแบบ Front-End/Back-End ที่เกี่ยวข้อง เป็นต้น
- การจัดทำ (Implementation) ได้แก่ การอธิบายโค้ดเฉพาะส่วนที่สำคัญ
- ผลการทดสอบ (Testing) แสดงผลลัพธ์ที่ได้จากโครงการ

# บทนำ Assignment : Fintech.UTCC.Dapp
mini project นี้ใช้โครงสร้างของ truffle unbox Pet-Shop มาดัดแปลง
แนวคิดพัฒนา DApp สำหรับการกู้ยืมเงินระหว่างบุคคลโดยใช้ Dapp มาออกแบบเพื่อป้องกันการรับเงินกู้ที่ซ้ำซ้อนแล้วไปเกิดปัญหาการมีหนี้สินเกินตัว 
โดยมีขอบเขตดังนี้
- ส่วนของนักลงทุนเข้าไปเลือกที่จะให้เงินลงทุนกับเกษตรกร ที่มีต้นไม้ค้ำประกัน 
- เกษตรกรที่กู้ยืม สามารถถูกเลือกได้เพียงครั้งเดียว (จนกว่าจะเริ่ม deploy ใหม่)

# การวิเคราะห์และออกแบบ
- ศึกษาส่วนติดต่อผู้ใช้โดยออกแบบ front end โดยในโปรเจคจะใช้ไฟล์ app2p.html  
- พัฒนา DApp ส่วนของข้อมูลเกษตรกร โดยใช้โครงสร้างของ truffle unbox pet-shop
- ทดลองการใช้งานโดยใช้ Matamask และ Ganache มาใช้จำลองเป็น private blockchain
 
### Front-End
   ไฟล์ app2p.html หรือ Front-End File สำหรับสร้าง User Interface ที่ติดต่อกับผู้ใช้งาน  
    

### Back-End
   app.js หรือ Back-end File สำหรับ Coding program  
   โดยภายใต้ File นี้จะมีการเรียกใช้ File ต่างๆ และ คืนค่ากลับไปยังตัวแปรต่างๆ  
   อาทิ การเรียกใช้ไฟล์ด้วยคำสั่ง get.json เรียกใช้ Cars.json โดยมีคำสั่ง For Loop  
   เพื่อดึงข้อมูลสำหรับตั้งค่าตัวแปรต่างๆให้กับ CarsTemplate สำหรับแสดงผลใน Front-end  
   initWeb3 เป็นการระบุว่าจะใช้ Block-chain ใด (web3) ในการเชื่อมต่อกับ Smart Contract  (Metamask ,Legacy browser และ Ganache)
   markAdopted เป็น Function เชื่อมต่อไปยัง Wallet address และเมื่อมี Transaction เกิดขึ้นการแสดงผลของปุ่น Reserve จะเปลี่ยนเป็น Reserved เป็นต้น

## กำหนดค่าสิ่งแวดล้อม
สร้าง Directory สำหรับบันทึก Projectนี้ และ ใช้คำสั่งต่อไปนี้เพื่อสร้างและย้ายเข้าไปยัง Directory ชื่อ Ass3
```
mkdir Ass3
cd Ass3
```

ดาวน์โหลดโครงสร้างของโปรเจ็ค pet-shop ซึ่งมีอยู่ใน Truffle Framework โดยใช้คำสั่งต่อไปนี้
```
truffle unbox pet-shop
```
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
