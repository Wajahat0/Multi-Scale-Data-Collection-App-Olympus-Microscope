![Demo_Pic](https://user-images.githubusercontent.com/79640349/124239509-355c7980-db33-11eb-8cc2-d95496af4357.png)

# 🔬 Multi-Scale Data Collection App for Olympus Microscope

This MATLAB-based application enables **multi-scale tracking and image capturing** of blood smear slides using Olympus microscopes. The app is designed specifically for **educational and research purposes**, allowing users to track a **1000x blood patch** at lower magnifications (100x and 400x), and collect labeled data efficiently.

---

## 📌 Key Features

- ✅ **Multi-scale slide tracking** at 100x, 400x, and 1000x magnifications.
- ✅ Manual entry of **approximate X, Y coordinates** for precise patch tracking.
- ✅ Support for image acquisition, preview, and saving for dataset generation.
- ✅ Designed with **MATLAB App Designer** (Tested on MATLAB 2019a).
- ✅ Utilizes:
  - **Image Acquisition Toolbox**
  - **Image Processing Toolbox**
  - **Computer Vision Toolbox**

---

## 🧰 Requirements

- MATLAB 2019a or newer
- App Designer
- Image Acquisition Toolbox
- Image Processing Toolbox
- Computer Vision Toolbox

---

## 📂 Usage Instructions

1. Open the `.mlapp` file using **MATLAB App Designer**.
2. Connect the Olympus Microscope via supported acquisition interface.
3. Enter the estimated X, Y coordinates of the 1000x patch to track.
4. Capture and save frames at 100x and 400x magnification.
5. Use the collected data for educational annotation or research analysis.

---

## 📄 Documentation

Detailed instructions are available in the `IML Information Document` included in the repository. Please read it carefully for setup and configuration.

---

## 📚 Citation

If you use this app or build on it for academic purposes, please cite the following paper:

```bibtex
@INPROCEEDINGS{9878617,
  author    = {Sultani, Waqas and Nawaz, Wajahat and Javed, Syed and Danish, Muhammad Sohail and Saadia, Asma and Ali, Mohsen},
  title     = {Towards Low-Cost and Efficient Malaria Detection},
  booktitle = {2022 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR)},
  year      = {2022},
  pages     = {20655-20664},
  doi       = {10.1109/CVPR52688.2022.02003},
  keywords  = {Medical microscopy; Computer vision for social good; Pattern recognition; Malaria detection; Dataset generation}
}
