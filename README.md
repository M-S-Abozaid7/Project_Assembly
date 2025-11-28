# Assembly Project – Login System

A simple **16-bit Assembly** program that implements a password-based login system using the **Turbo Assembler GUI** environment.

The program asks the user to enter a password and compares it with the stored one, allowing up to **five attempts**.
If the password is correct, it displays **“Login Successful”**; if incorrect, the number of remaining attempts decreases until they run out.

---

## 📌 Features

* Fully runs inside the **Turbo Assembler GUI** environment
* Password input handled **character by character**
* Supports **Backspace**, removing characters from the screen and memory
* Compares the entered password with the original one **byte by byte**
* Allows **5 attempts** before showing a failure message
* Uses:

  * `INT 21h` for input/output
  * `INT 10h` for displaying characters inside Turbo GUI

---

## 🛠 Tools Used

* **Turbo Assembler GUI (TASM / GUI Version)**
* Turbo Editor + Assembler + Linker
* DOS/BIOS interrupts for handling input/output inside the GUI environment

---

## 📂 Project Files

```
project_assembly/
│── task_ass.asm   # Assembly source code
│── TASK_ASS.EXE   # Compiled executable
│── TASK_ASS.OBJ   # Object file
```

---

## ▶️ How to Run in Turbo GUI

1. Open the project in **Turbo Assembler GUI**
2. Click:

   * **Compile** to build the code
   * **Run** to execute it inside the GUI
3. The password input screen will appear

---

## 🔐 Default Password

```
Assembly7
```

---

## 📄 Short Description

This project demonstrates how to handle input in Turbo GUI, use interrupts inside GUI-based assembly programs, compare strings, and control the cursor to build a simple login system.
