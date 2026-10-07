# Medical Appointment App (Flutter)

A modern, pixel-perfect Flutter application created directly from the Figma design:
**[Laboratoare 2026 (node-id=2-673)](https://www.figma.com/design/3HeBH74VC2MHhKwXGnqI2e/Laboratoare-2026?node-id=2-673)**.

---

## 📱 Screens & Features

### 1. Homescreen (`HomeScreen`)
* **Header & Profile:**
  * User greeting: *"Hi, Jonathan"* & *"May you always be healthy"*, avatar image and notification button.
* **Search Bar:**
  * Clean rounded search bar with search icon and settings/filter icon.
* **Appointment Banner:**
  * Prominent teal card (`#2BACBE`) showing appointment time (*"22 October, 2023"*, *"08:00 AM - 10.30 AM"*) and graphic illustration.
  * Floating white doctor card with elevation and shadow: *"Dr. Richar Kandowen"* (Child Specialist) with message action button.
  * Tapping this banner opens the **Appointment Details** screen.
* **Health Services:**
  * 4 service categories extracted from Figma: **Tooth**, **Eye**, **Lungs**, **Ear** with high-resolution icons.
* **Nearby Doctors:**
  * Interactive doctor cards with avatar, name, specialty, distance and location pin:
    * **Dr. Emmly Lestiryno** (General Practitioner, 500M)
    * **Dr. Sonja Littel** (Dental Specialist, 753M)
  * Interactive favorite heart toggle.
  * Tapping any doctor navigates to their detailed appointment profile.

### 2. Appointment Details (`AppointmentDetailsScreen`)
* **Doctor Profile:**
  * Large doctor photo, name (*Dr. Upul*), action buttons (Phone, Chat, Video).
  * Specialty tag: *denteeth* / Dentist.
  * Payment section: *Payment* & *$120.00*.
* **Details Section:**
  * Comprehensive doctor biography and consultation summary.
* **Working Hours Selector:**
  * Interactive selectable chips: `10.00 AM`, `11.00 AM` (default selected in teal), `12.00 PM`.
* **Date Selector:**
  * Interactive selectable chips: `Sun 4` (default selected in teal), `Mon 5`, `Tue 6`.
* **Book an Appointment Button:**
  * Primary button triggering a dialog confirming the appointment with selected date and time.

---

## 🚀 How to Run

1. Open a terminal in this directory:
   ```bash
   cd C:\Users\grigo\Desktop\medical_appointment_app
   ```

2. Run on your desired device/platform:
   * **Chrome (Web):**
     ```bash
     flutter run -d chrome
     ```
   * **Windows Desktop:**
     ```bash
     flutter run -d windows
     ```
   * **Android / iOS Device / Emulator:**
     ```bash
     flutter run
     ```
