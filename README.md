![UTVCBanner](https://i.imgur.com/7xlVfeE.png)

# Unity Transparent Video Converter

The **Unity Transparent Video Converter (UTVC)** is a versatile tool designed to facilitate the integration of transparent videos with audio into Unity projects. It supports various input formats and automates the conversion process, ensuring seamless compatibility with Unity's Video Player.

## Key Features:

- **Media Formats:** UTVC accepts both PNG sequences and MOV files for video input.

- **Audio Formats:** It supports audio inputs in MP3 and WAV formats.

- **Automatic Audio Merging:** If the Input has one Media Format and one Audio Format, It merges them up to create a transparent video that uses the newly Inputted Audio

## How It Works:

UTVC utilizes a batch script powered by FFmpeg to process and convert the provided media files. The script automates tasks such as sequencing images into video, ensuring alpha channel preservation for transparency, and synchronizing audio tracks. This automation simplifies the workflow, allowing developers to focus on creating immersive content without delving into complex conversion procedures.

## Usage Instructions:

### 1. Prepare Your Media Files:

- **For PNG Sequences:** Ensure all images are named sequentially (e.g., frame001.png, frame002.png, etc.) and are stored in a single directory.

- **For MOV Files:** Place the MOV file in the designated input directory.

- **Audio Files:** Store corresponding MP3 or WAV audio files in the same directory as your media inputs.

### 2. Run the Converter Script:

- Execute the `Converter.bat` script provided in the UTVC repository. This script will process the input files, perform necessary conversions, and generate output files compatible with Unity.

### 3. Import into Unity:

- After conversion, import the resulting video files into your Unity project.

- Utilize Unity's Video Player component to incorporate the transparent videos into your scenes as needed.

**Tutorial & Support:**

[For a step-by-step tutorial on how to use UTVC, check out the YouTube video by clicking on this text](https://www.youtube.com/watch?v=vefFgerTgPc)

For any questions or feedback, please leave a comment on the YouTube tutorial linked above. Your input is valuable and will help improve the tool.

**Additional Resources:**

- **FFmpeg Documentation:** For a deeper understanding of the underlying processes and potential customization, refer to the [FFmpeg documentation](https://ffmpeg.org/ffmpeg.html).

- **Community Support:** If you encounter issues or have questions, consider reaching out to the community through forums or the UTVC repository's issue tracker.

By leveraging UTVC, developers can efficiently integrate transparent videos with audio into their Unity projects, enhancing the visual and interactive quality of their applications.
