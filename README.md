# 🪪 National ID Card (NIC) Decoder – Flutter App

A mobile application built using **Flutter** to decode the **Sri Lankan National Identity Card (NIC)** number and extract useful information such as **date of birth**, **gender**, **day of the week**, and **voting eligibility**.  

Developed as part of **CCS3351 - Mobile Application Development (Final Project)** at **SLTC Research University**.

---

## 📘 Project Overview

The **NIC Decoder** helps users enter their Sri Lankan NIC number (old or new format) and instantly view personal details decoded from it.

It supports both:
- **Old NIC format (9 digits + letter)** – e.g., `853400937V`
- **New NIC format (12 digits)** – e.g., `198534000937`

The app identifies the NIC type automatically and provides complete decoded information with a smooth and modern UI.

---

## 🧠 Features

✅ Detects **old** vs **new** NIC format  
✅ Displays **Date of Birth** (YYYY-MM-DD)  
✅ Displays **Gender** (Male / Female)  
✅ Shows **Day of the Week**  
✅ Shows **Voting Eligibility (V / X)**  
✅ Simple and minimal two-screen UI using **GetX**  
✅ Fast, accurate decoding algorithm  

---

## 🧩 NIC Decoding Logic

### 🔹 Old Format (9 digits + letter)
Example: `853400937V`  
Pattern: `YYDDDSSSSV`

| Section | Meaning | Example |
|----------|----------|----------|
| `YY` | Birth Year (19YY) | 85 → 1985 |
| `DDD` | Day of Year (adds 500 if female) | 340 → December 5th |
| `SSSS` | Serial Number | 0937 |
| `V/X` | Voting Eligibility | V = Yes, X = No |

### 🔹 New Format (12 digits)
Example: `198534000937`  
Pattern: `YYYYDDDSSSSS`

| Section | Meaning | Example |
|----------|----------|----------|
| `YYYY` | Birth Year | 1985 |
| `DDD` | Day of Year (adds 500 if female) | 340 → December 5th |
| `SSSSS` | Serial Number | 00937 |

---

## 🖥️ Screens

### 1️⃣ Input Screen
- Text field for entering NIC number  
- "Decode" button  
- Input validation for both formats  

### 2️⃣ Result Screen
- Displays decoded information:  
  - NIC Type (Old/New)  
  - Date of Birth  
  - Gender  
  - Day of the Week  
  - Voting Eligibility  
- “Go Back” button for navigation  

---

## 🧩 Tech Stack

- **Framework:** Flutter  
- **Language:** Dart  
- **State Management:** GetX  
- **IDE:** Android Studio / VS Code  



