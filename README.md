# 🖼️ Digital Image Tampering Detection (MATLAB)

A Digital Image Processing project that detects potential tampering in digital images using classical image forensics techniques.

**The system analyzes an image using:**
- Error Level Analysis (ELA)
- Gradient Flow Analysis
- Noise Extraction

Identifies suspicious regions along with a confidence score and tampering verdict.

---

## 📌 Project Overview

Digital images can be manipulated easily using modern editing tools. Detecting such modifications is important in areas like:

- **Digital Forensics**
- **Media Authentication**
- **Legal Evidence Verification**
- **Security & Surveillance**

This project implements a forensic-based detection pipeline using classical image processing techniques in MATLAB.

### Why Classical Techniques?

Instead of deep learning models, this approach is:

✅ **Lightweight** - Minimal computational overhead  
✅ **Interpretable** - Each step is understandable  
✅ **Fast** - Real-time processing possible  
✅ **Suitable for Academic Demonstration** - Great for learning  

---

## 🧠 System Architecture

Below is the architecture of the tampering detection system:

                ┌──────────────────┐
                │   Input Image    │
                └────────┬─────────┘
                         │
                         ▼
                ┌──────────────────┐
                │ Grayscale Convert │
                └────────┬─────────┘
                         │
                         ▼
                ┌──────────────────┐
                │ Error Level       │
                │ Analysis (ELA)    │
                └────────┬─────────┘
                         │
                         ▼
                ┌──────────────────┐
                │ Gradient Flow     │
                │ Analysis          │
                └────────┬─────────┘
                         │
                         ▼
                ┌──────────────────┐
                │ Noise Extraction  │
                └────────┬─────────┘
                         │
                         ▼
                ┌──────────────────┐
                │ Combined Score    │
                │ Map Generation    │
                └────────┬─────────┘
                         │
                         ▼
                ┌──────────────────┐
                │ Detection Mask    │
                │ Generation        │
                └────────┬─────────┘
                         │
                         ▼
                ┌──────────────────┐
                │ Region Filtering  │
                │ + Morphology      │
                └────────┬─────────┘
                         │
                         ▼
                ┌──────────────────┐
                │ Tampered Region   │
                │ Visualization     │
                └────────┬─────────┘
                         │
                         ▼
                ┌──────────────────┐
                │ Confidence Score  │
                │ + Final Verdict   │
                └──────────────────┘

---

## 🔬 Detection Techniques

### 1️⃣ Error Level Analysis (ELA)

**What it does:** Detects compression inconsistencies in an image.

When an image is edited and re-saved, the edited regions often have different compression levels compared to the rest of the image.

**Mathematical Formula:**
$$\text{ELA} = |\text{Original Image} − \text{Recompressed Image}|$$

**Interpretation:** Brighter regions in the ELA map indicate possible tampering.

---

### 2️⃣ Gradient Flow Analysis

**What it does:** Detects unnatural structural edges introduced during editing.

**Mathematical Formula:**
$$G = \sqrt{G_x^2 + G_y^2}$$

**Interpretation:** This highlights boundaries that may indicate pasted or manipulated objects.

---

### 3️⃣ Noise Extraction

**What it does:** Analyzes sensor noise patterns to detect inconsistencies.

Every digital camera introduces sensor noise patterns. When an image is edited:

- The noise pattern may become inconsistent
- Edited regions may have different noise distributions

A **high-pass filter** is used to extract these inconsistencies.

---

## 🧩 Detection Mask Generation

The outputs from:
- **ELA**
- **Gradient analysis**
- **Noise extraction**

are combined into a single **anomaly score map**.

### Threshold Calculation

A statistical threshold is applied:

$$\text{Threshold} = \text{Mean} + 2 \times \text{Standard Deviation}$$

Pixels exceeding this threshold are classified as suspicious regions.

---

## 🧹 Mask Refinement

To improve detection quality, the system performs:

- Small region removal
- Morphological closing
- Hole filling
- Region property filtering

This removes noise and keeps only meaningful detected regions.

---

## 📂 Project Structure

```
Image-Tampering-Detection/
│
├── tampering_detection.m
│
├── demo_inputs/
│   ├── authentic_sample.jpg
│   └── tampered_sample.jpg
│
├── README_images/
│   ├── input_example.png
│   ├── ela_output.png
│   ├── gradient_output.png
│   ├── noise_output.png
│   ├── detection_mask.png
│   └── final_detection.png
│
└── README.md
```

---

## 🖼️ Input Example

Add a folder called `demo_inputs` in your repository and place sample images there.

**Sample Structure:**
```
demo_inputs/
   ├── authentic_sample.jpg
   └── tampered_sample.jpg
```

**Example input image:** `README_images/input_example.png`

---

## 🔍 Forensic Analysis Output

The system produces intermediate forensic maps:

### Error Level Analysis
![ELA Output](README_images/ela_output.png)

### Gradient Flow Map
![Gradient Output](README_images/gradient_output.png)

### Noise Map
![Noise Output](README_images/noise_output.png)

---

## 🚨 Tampering Detection Result

### Detection Mask
![Detection Mask](README_images/detection_mask.png)

### Detected Tampered Regions
![Final Detection](README_images/final_detection.png)

Suspicious regions are highlighted with contours.

---

## 📊 Final Output

The system outputs:

1. **Detection Mask** - Binary mask of suspected regions
2. **Highlighted Tampered Regions** - Visual representation with contours
3. **Confidence Score** - Numerical confidence level
4. **Tampering Verdict** - Final classification

**Example verdict:**
```
FINAL VERDICT: TAMPERED (HIGH SUSPICION)
CONFIDENCE LEVEL: 78.4%
```

---

## 🚀 How to Run the Project

### Requirements

- **MATLAB** (R2020 or later recommended)
- **Image Processing Toolbox**

### Steps

**1️⃣ Clone the repository**
```bash
git clone https://github.com/yourusername/image-tampering-detection.git
```

**2️⃣ Open MATLAB**
- Navigate to the project folder

**3️⃣ Run the script**
```matlab
tampering_detection.m
```

**4️⃣ Select an image**
- The system will automatically perform forensic analysis and display results.

---

## 📸 Sample Input & Output Gallery

### Test Case 1: Bird Image

#### Input Image
![Bird Input](https://github.com/user-attachments/assets/03062ebd-33c4-4120-9559-1ecde14ce246)

#### ELA Analysis Output
![ELA Output](https://github.com/user-attachments/assets/ef94a818-e46c-479d-aef2-e4218639688a)

#### ELA Result Map
![ELA Result](https://github.com/user-attachments/assets/44acafff-b6ca-400e-9efe-fd7a08cbbd9b)

---

### Test Case 2

#### Input Image
![Test 2 Input](https://github.com/user-attachments/assets/31db9dcd-befd-4405-b4b7-56fd06421478)

#### Gradient Flow Analysis
![Gradient Output](https://github.com/user-attachments/assets/d5a3a3f7-7781-4eaf-936a-bb65f82bfa96)

#### Gradient Result Map
![Gradient Result](https://github.com/user-attachments/assets/4966ea30-35ac-40ff-a2b7-7c6e5990f594)

---

### Test Case 3

#### Input Image
![Test 3 Input](https://github.com/user-attachments/assets/05662956-600b-4037-8948-88dbdf556885)

#### Noise Analysis Output
![Noise Output](https://github.com/user-attachments/assets/8324a7e8-1330-4c54-abe1-05a0d63c5c47)

---

### Test Case 4

#### Input Image
![Test 4 Input](https://github.com/user-attachments/assets/7a4cea65-93c2-473c-a2a5-3acf77a9f5aa)

#### Forensic Analysis Output
![Test 4 Analysis](https://github.com/user-attachments/assets/321855f5-92e8-4406-873c-a82a9ee958df)

#### Detection Result
![Test 4 Result](https://github.com/user-attachments/assets/f8fecd25-faca-4dc4-ad0d-613a06dbafa5)

#### Final Detection Map
![Test 4 Final](https://github.com/user-attachments/assets/e176eb0e-896e-4cd6-95c3-c694a3c89b92)

---

### Test Case 5

#### Input Image
![Test 5 Input](https://github.com/user-attachments/assets/584e6a0f-1548-4979-aecf-b68727a3702c)

#### Combined Analysis Output
![Test 5 Analysis](https://github.com/user-attachments/assets/23373022-a965-48bc-ad45-ed3fc82af171)

#### Tampering Detection Result
![Test 5 Result](https://github.com/user-attachments/assets/1f1a6c6a-7d77-4566-b773-21ef86140a11)

#### Final Verdict Map
![Test 5 Final](https://github.com/user-attachments/assets/db78044b-6dd6-445e-9771-53a0bdd15655)

---

### Test Case 6

#### Input Image
![Test 6 Input](https://github.com/user-attachments/assets/409bc8e3-164d-41f8-ad9e-8e3fdc412219)

#### Comprehensive Analysis Output
![Test 6 Analysis](https://github.com/user-attachments/assets/eac61b9e-8748-46cd-b4d8-18669040a31f)

#### Detection Report
![Test 6 Report](https://github.com/user-attachments/assets/d2782d3c-9d75-4c6a-8e60-48f55fe1006a)

#### Final Tampering Detection
![Test 6 Final](https://github.com/user-attachments/assets/e000082b-5565-423e-ba99-2a92a59a72d0)

---

## Final Verdict Example

**Sample Detection Report:**

```
═══════════════════════════════════════
  DIGITAL TAMPERING DETECTION REPORT
═══════════════════════════════════════
Image: test_sample.jpg
Dimensions: 1920 x 1080 pixels
Format: JPEG

FORENSIC ANALYSIS RESULTS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ELA Score:           78.5%
Gradient Anomaly:    72.3%
Noise Inconsistency: 81.2%

COMBINED CONFIDENCE:  77.3%

FINAL VERDICT: TAMPERED (HIGH SUSPICION)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Detected Region Area: 12.5% of image
Location: (482, 291) - (1047, 856)

Recommendation: Further investigation recommended
═══════════════════════════════════════
```

---

## ✅ Key Advantages

- ✔️ **No training dataset required**
- ✔️ **Fast and lightweight** execution
- ✔️ **Fully interpretable** detection pipeline
- ✔️ **Suitable for academic demonstrations**

---

## ⚠️ Limitations

- Highly blended manipulations may be difficult to detect
- Uniformly recompressed images may reduce ELA effectiveness
- Complex textures may cause false positives
- Sensitivity depends on image properties and compression

---

## 🔮 Future Improvements

Future work may include:

- Deep learning-based tampering detection
- Copy-move forgery detection
- Metadata analysis
- Real-time forensic tools
- Multi-scale analysis
- GPU acceleration

---

## 🎓 Academic Context

Developed as a **Digital Image Processing (DIP)** course project to demonstrate classical image forensics techniques.
