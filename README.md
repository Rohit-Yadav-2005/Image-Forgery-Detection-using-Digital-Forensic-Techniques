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
<img width="283" height="227" alt="image" src="https://github.com/user-attachments/assets/0fd10517-c620-4aec-ba44-0398a575cf5c" />

### Gradient Flow Map
<img width="281" height="226" alt="image" src="https://github.com/user-attachments/assets/c6d101e0-4ed9-4d6c-8c15-0501d8fb2434" />

### Noise Map
<img width="281" height="228" alt="image" src="https://github.com/user-attachments/assets/5ff08d88-fac5-45ce-9e8a-575ed96b9cea" />

---

## 🚨 Tampering Detection Result

### Detection Mask
<img width="283" height="232" alt="image" src="https://github.com/user-attachments/assets/64938135-30d4-49ec-99ea-7e54112a90a5" />

### Detected Tampered Regions
<img width="281" height="227" alt="image" src="https://github.com/user-attachments/assets/c42c4641-0eaf-47df-aae7-77b47ef8950a" />

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

**Input Image:**

![Bird Input](https://github.com/user-attachments/assets/03062ebd-33c4-4120-9559-1ecde14ce246)

**Detection Results:**

![Bird Output](https://github.com/user-attachments/assets/ef94a818-e46c-479d-aef2-e4218639688a)

---

### Test Case 2

**Input Image:**

![Test 2 Input](https://github.com/user-attachments/assets/44acafff-b6ca-400e-9efe-fd7a08cbbd9b)

**Detection Results:**

![Test 2 Output](https://github.com/user-attachments/assets/31db9dcd-befd-4405-b4b7-56fd06421478)

---

### Test Case 3

**Input Image:**

![Test 3 Input](https://github.com/user-attachments/assets/d5a3a3f7-7781-4eaf-936a-bb65f82bfa96)

**Detection Results:**

![Test 3 Output](https://github.com/user-attachments/assets/4966ea30-35ac-40ff-a2b7-7c6e5990f594)

---

### Test Case 4

**Input Image:**

![Test 4 Input](https://github.com/user-attachments/assets/8324a7e8-1330-4c54-abe1-05a0d63c5c47)

**Detection Results:**

![Test 4 Output](https://github.com/user-attachments/assets/05662956-600b-4037-8948-88dbdf556885)

---

### Test Case 5

**Input Image:**

![Test 5 Input](https://github.com/user-attachments/assets/bdd52713-806b-4437-93b1-328413b79df6)

**Detection Results:**

![Test 5 Output](https://github.com/user-attachments/assets/321855f5-92e8-4406-873c-a82a9ee958df)

---

### Test Case 6

**Input Image:**

![Test 6 Input](https://github.com/user-attachments/assets/f8fecd25-faca-4dc4-ad0d-613a06dbafa5)

**Detection Results:**

![Test 6 Output](https://github.com/user-attachments/assets/e176eb0e-896e-4cd6-95c3-c694a3c89b92)

---

### Test Case 7

**Input Image:**

![Test 7 Input](https://github.com/user-attachments/assets/584e6a0f-1548-4979-aecf-b68727a3702c)

**Detection Results:**

![Test 7 Output](https://github.com/user-attachments/assets/23373022-a965-48bc-ad45-ed3fc82af171)

---

### Test Case 8

**Input Image:**

![Test 8 Input](https://github.com/user-attachments/assets/1f1a6c6a-7d77-4566-b773-21ef86140a11)

**Detection Results:**

![Test 8 Output](https://github.com/user-attachments/assets/db78044b-6dd6-445e-9771-53a0bdd15655)

---

### Test Case 9

**Input Image:**

![Test 9 Input](https://github.com/user-attachments/assets/409bc8e3-164d-41f8-ad9e-8e3fdc412219)

**Detection Results:**

![Test 9 Output](https://github.com/user-attachments/assets/eac61b9e-8748-46cd-b4d8-18669040a31f)

---

### Test Case 10

**Input Image:**

![Test 10 Input](https://github.com/user-attachments/assets/d2782d3c-9d75-4c6a-8e60-48f55fe1006a)

**Detection Results:**

![Test 10 Output](https://github.com/user-attachments/assets/e000082b-5565-423e-ba99-2a92a59a72d0)

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
