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
