<p align="center">
  <img src="https://github.com/user-attachments/assets/d50d2609-869f-44c7-b5d0-817e65e2a72f" alt="DF TICKETING (1) crop">
</p>

# 🧾 DF_Ticketing System Overview


![SRS Infographics-1](https://github.com/user-attachments/assets/cae8b492-1777-4006-926d-cf323359d907)

## 📄 Software Requirements Specification (SRS)

**System Name:** `DF_Ticketing System`  
**Version:** `1.0`  
**📅 Date:** `2025-06-19`

---

### 📚 Table of Contents
1. [🧭 Introduction](#1--introduction)
2. [🧩 Overall Description](#2--overall-description)
3. [🔧 System Features and Requirements](#3--system-features-and-requirements)
4. [👤 Module Breakdown by Role](#4--module-breakdown-by-role)
5. [⚙️ Non-Functional Requirements](#5-%EF%B8%8F-non-functional-requirements)
6. [🗂️ Deployment Architecture](#6-%EF%B8%8F-deployment-architecture)
7. [🗄️ Database Overview](#7-%EF%B8%8F-database-overview)
8. [💻 Software Requirements](#8--software-requirements)

---

## 1. 🧭 Introduction

### 1.1 🎯 Purpose
Defines the functional and non-functional requirements for the DF_Ticketing System supporting Reimbursement, Procurement, and Advance workflows.

### 1.2 👥 Intended Audience
* Employees of:
  - Deshpande Foundation
  - Deshpande Educational Trust
  - Foundation for Sandboxstartup Initiatives
  - USF Members
* Development, QA, Ops Teams  
* HR & Finance Departments  
* System Admins  

### 1.3 🛠️ Intended Use
* Raise, track, and route tickets
* Manage documents (PR, PO, WO, UTR)
* Export to Tally/Bank
* Generate PO/WO

### 1.4 🔭 Product Scope
* 🌐 Web-based on AWS EC2  
* 💻 ReactJS frontend, NodeJS backend  
* 🛢️ MySQL (on EC2 RDP)  
* 📤 Tally & Bank export  
* 👥 Role-based access and workflows

### 1.5 📘 Definitions and Acronyms

| Acronym | Description |  
|--------|-------------|  
| PR     | Purchase Request |  
| PO     | Purchase Order |  
| WO     | Work Order |  
| UTR    | Unique Transaction Reference |  
| RDP    | Remote Desktop Protocol |  
| Tally  | Accounting Software |  

---

## 2. 🧩 Overall Description

### 2.1 🙋 User Needs
* Raise/manage financial requests  
* Track ticket status  
* Upload & view documents  
* Finance can approve/pay/track  

### 2.2 🔗 Assumptions and Dependencies
* Hosted on AWS  
* Secure login  
* MySQL backend  
* Tally + Bank export supported  
* Applies to food, travel, stay, vehicles

---

## 3. 🔧 System Features and Requirements

### 3.1 ✅ Functional Requirements

#### 💸 Reimbursement
1. Upload bills → create ticket  
2. Manager approval  
3. Finance verification → approval → payment  
4. Upload UTR → ticket closed  

#### 🛒 Procurement
* **< ₹20,000:**
  - Request → approval → payment → close
* **≥ ₹20,000 (Items):**
  - PR → Vendors → Quotations → PO → Payment → UTR → Close
* **≥ ₹20,000 (Services):**
  - As above, but use WO instead of PO

#### 💰 Advance
1. Request advance → Paid  
2. Upload bills later  
3. Reconcile & settle  

#### 🧾 Finance Panel
* View pending payments  
* Upload UTRs  
* Download Excel for Tally/Bank  

#### 📂 Document Management
Upload PR, PO, WO, invoices, bills, UTRs

---

### 3.2 🌐 External Interface Requirements

* Frontend: ⚛️ ReactJS  
* Backend: 🟩 NodeJS  
* DB: 🛢️ MySQL  
* Notifications: ✉️ SMTP or AWS SES  
* Downloads: 📥 Excel for Tally, Bank  

---

### 3.3 🧰 System Features

* 🎭 Role-based access  
* 🕒 Audit trails  
* 📎 File upload  
* 📤 Tally/Bank exports  
* 📊 Dashboards + filters

---

### 3.4 📌 Use Cases

#### 3.4.1 🧍 Employee Submits Reimbursement
1. Go to `Report` → "+ New Report"  
2. Select reimbursement type  
3. Fill details + upload bills  
4. Submit → ticket created  

#### 3.4.2 👨‍💼 Manager Approves Ticket
1. Go to `MY TEAM` → select ticket  
2. Review + Approve/Reject  
3. Add comment (if approved), or reason (if rejected)  
4. Status updates accordingly  

#### 3.4.3 🏦 Finance Uploads UTR
1. Go to `FINANCE APPROVAL`/`FINANCE PANEL`  
2. Review + process  
3. Upload UTR  
4. Status: `Paid` / `Closed`  

---

## 4. 👤 Module Breakdown by Role

| Role | Modules |  
|------|---------|  
| 🧍 User | HOME, REPORT, CONTACT US |  
| 👨‍💼 Manager | HOME, REPORT, MY TEAM, CONTACT US |  
| 🏦 Finance | HOME, REPORT, FINANCE APPROVAL, FINANCE PANEL, SUMMARY, CONTACT US |  
| 👥 HR | HOME, REPORT, HRPORTAL, CONTACT US |  
| 🛠️ Admin | HOME, REPORT, HRPORTAL, MY TEAM, FINANCE APPROVAL, FINANCE PANEL, SUMMARY, CONFIG, CONTACT US |

---

## 5. ⚙️ Non-Functional Requirements

* ⚡ 500+ concurrent users  
* 🔒 Role/data-level security  
* 🔐 SSL encryption  
* ☁️ 99.5% uptime  
* 🧼 Clean codebase  
* 📱 Responsive UI  
* 🌍 Cross-browser support  

---

## 6. 🗂️ Deployment Architecture

| Component | Tech | Hosting |  
|-----------|------|---------|  
| Frontend | ⚛️ ReactJS | AWS EC2 |  
| Backend | 🟩 NodeJS | AWS EC2 |  
| DB | 🛢️ MySQL | EC2 RDP |  
| Email | ✉️ Google SMTP | External |  
| Storage | 🗃️ EC2 / AWS S3 | Optional |

### 6.1 🧱 Logical Architecture

**Frontend** → ReactJS, REST API via Axios  
**Backend** → NodeJS, Express, JWT, Multer  
**Database** → MySQL  

📊 **Workflow:**
User → API → Backend → DB → Notification/Export → Frontend Update  

---

## 7. 🗄️ Database Overview

### 7.1 📌 Core Tables
- 👤 Users & Roles: `users`, `employees`, `user_roles`, `roles`...  
- 🎫 Tickets: `tickets`, `reports`, `ticket_logs`...  
- 💵 Finance: `payments`, `payment_type`, `tally_payment`...  
- 🧾 Shared: `bills`, `vehicles`, `food`, `vendors`  
- ⚙️ Config: `departments`, `entities`, `menus`, `role_actions`  

### 7.2 📋 Table Descriptions
| Table | 📌 Description |  
|-------|----------------|  
| `tickets` | All financial tickets raised |  
| `payments` | Records payments made |  
| `bills` | Bill details uploaded by users |  
| `reports` | Grouped collection of tickets |  
| `user_roles` | Maps users to roles |  
| `departments` | Department master data |  
| `re_ticket_details` | Extra info on reimbursement |  
| `vendors` | Vendor info with GST, bank |  
| `tally_payment` | Tally integration fields |  
| … | *(See full list above)* |

---

## 8. 💻 Software Requirements

| 🛠️ Tool/Library | Purpose |  
|----------------|---------|  
| VS Code | 👨‍💻 Development |  
| Multer | 📂 File Upload |  
| REST API | 🔄 Frontend–Backend Comm. |  
| Postman | 🔬 API Testing |  
| Kelvin CSS | 🎨 Styling |  
| JWT | 🔐 Authentication |  
| Axios | 🌐 API Calls |  
| SweetAlert2 | 📣 Alerts/Modals |  
| Nodemailer | ✉️ Email Service |  
| Express.js | 🚏 Routing |  
| express-validator | ✅ Validation |  
| Bcrypt | 🔒 Password Hashing |


<br><br>
<div align="center">
  <sub>© 2025 Amlanjyoti Laha & Deshpande Foundation. All Rights Reserved.</sub>
</div>


