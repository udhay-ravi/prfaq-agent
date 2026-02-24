Export the current PRFAQ to PDF, Google Doc (DOCX), or HTML format.

Usage: `/save-as` (will prompt for format) or specify inline: `/save-as pdf`, `/save-as gdoc`, `/save-as html`, `/save-as all`

## Steps

1. Find the most recently updated session in `output/`. If none exists, tell the user to run `/start`.

2. Check that `final-prfaq.md` exists in the session directory. If not, suggest running `/export` first to generate the markdown.

3. If no format was specified, ask the user:
   ```
   What format would you like?
     (a) PDF — for sharing and printing
     (b) Google Doc (DOCX) — for collaborative editing in Google Docs
     (c) HTML — for web viewing
     (d) All formats
   ```

4. Read `skills/prfaq-formats.skill.md` for the conversion instructions.

5. **Detect available tools:**
   Run `which pandoc` to check if pandoc is installed.
   Run `which npx` to check if npx is available.

6. **Convert based on format:**

   **For PDF:**
   - If pandoc is available, use pandoc to convert markdown to PDF
   - If pandoc is not available but npx is, use `npx md-to-pdf`
   - If neither is available, tell the user what to install

   **For Google Doc (DOCX):**
   - If pandoc is available, convert markdown to DOCX
   - Provide instructions for uploading to Google Drive:
     ```
     📄 Google Doc ready: output/<slug>/final-prfaq.docx

     To open in Google Docs:
     1. Go to drive.google.com
     2. Drag & drop the file, or click "New" → "File upload"
     3. Right-click the file → "Open with" → "Google Docs"
     ```

   **For HTML:**
   - If pandoc is available, convert with embedded CSS
   - Otherwise, generate a basic HTML file with inline styles using a simple script

   **For All:**
   - Generate PDF, DOCX, and HTML in sequence

7. **Display results:**
   ```
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
     Export Complete: <format>
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
     📄 output/<slug>/final-prfaq.pdf    ← PDF
     📄 output/<slug>/final-prfaq.docx   ← Google Docs
     📄 output/<slug>/final-prfaq.html   ← HTML
     📄 output/<slug>/final-prfaq.md     ← Markdown
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   ```

8. If conversion fails due to missing tools, provide clear install instructions:
   ```
   ⚠️  Pandoc is required for PDF/DOCX export.

   Install with:
     macOS:   brew install pandoc
     Ubuntu:  sudo apt install pandoc
     Windows: choco install pandoc

   For PDF specifically, you also need a LaTeX engine:
     macOS:   brew install --cask mactex-no-gui
     Ubuntu:  sudo apt install texlive-xetex

   Or use the lighter alternative:
     npm install -g md-to-pdf

   Then run /save-as again.
   ```
