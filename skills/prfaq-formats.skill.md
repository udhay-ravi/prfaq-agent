# Skill: PRFAQ Export Formats

This skill defines how to export the final PRFAQ document as a PDF or Google Doc, in addition to the default Markdown format.

## Available Formats

| Format | Output File | How |
|--------|------------|-----|
| **Markdown** (default) | `final-prfaq.md` | Direct write — always generated |
| **PDF** | `final-prfaq.pdf` | Convert markdown to PDF via CLI tools |
| **Google Doc** | Google Drive link | Upload to Google Docs via `gdocs` CLI or conversion |
| **HTML** | `final-prfaq.html` | Convert markdown to styled HTML |

## Format: PDF

### Method 1: Pandoc (Preferred)

If `pandoc` is available on the system:

```bash
pandoc output/<slug>/final-prfaq.md \
  -o output/<slug>/final-prfaq.pdf \
  --pdf-engine=xelatex \
  -V geometry:margin=1in \
  -V fontsize=11pt \
  -V mainfont="Helvetica" \
  --highlight-style=tango \
  --toc \
  --toc-depth=2 \
  -V colorlinks=true \
  -V linkcolor=blue \
  -V urlcolor=blue \
  --metadata title="PRFAQ: <Product Name>"
```

### Method 2: mdpdf

If `mdpdf` is available:

```bash
npx mdpdf output/<slug>/final-prfaq.md --output output/<slug>/final-prfaq.pdf
```

### Method 3: md-to-pdf

If `md-to-pdf` is available:

```bash
npx md-to-pdf output/<slug>/final-prfaq.md --dest output/<slug>/final-prfaq.pdf
```

### Method 4: Chrome/Puppeteer Fallback

If no PDF tools are available, convert to HTML first then use a headless browser:

```bash
# Step 1: Convert to HTML
pandoc output/<slug>/final-prfaq.md -o output/<slug>/final-prfaq.html --standalone --css=templates/pdf-style.css

# Step 2: Print to PDF via Chrome
# (only if Chrome is available)
```

### PDF Detection Flow

1. Check if `pandoc` is installed: `which pandoc`
2. If not, check if `npx` is available: `which npx`
3. If npx available, use `md-to-pdf` (no global install needed)
4. If nothing available, tell the user what to install:
   ```
   ⚠️  No PDF converter found. Install one of:
      • brew install pandoc          (recommended)
      • npm install -g md-to-pdf     (Node.js option)
      • npm install -g mdpdf         (Node.js option)

   Then run /save-as pdf again.
   ```

### PDF Styling

When generating PDF, apply professional styling:
- Clean sans-serif font (Helvetica or system default)
- 1-inch margins
- Auto-generated table of contents
- Syntax-highlighted code blocks
- Colored links
- Page numbers in footer
- Product name in header
- Tables with borders and alternating row colors

## Format: Google Doc

### Method 1: Pandoc to DOCX + Google Drive Upload

Convert markdown to DOCX (Google Docs compatible) then optionally upload:

```bash
# Step 1: Convert to DOCX
pandoc output/<slug>/final-prfaq.md \
  -o output/<slug>/final-prfaq.docx \
  --reference-doc=templates/prfaq-reference.docx \
  --toc \
  --toc-depth=2

# Step 2: Upload to Google Drive (if gdrive CLI available)
# gdrive upload output/<slug>/final-prfaq.docx --mime application/vnd.google-apps.document
```

### Method 2: Direct DOCX Generation

If pandoc is available, generate a `.docx` file that can be opened directly in Google Docs:

```bash
pandoc output/<slug>/final-prfaq.md \
  -o output/<slug>/final-prfaq.docx \
  --toc \
  --toc-depth=2
```

The user can then:
1. Open Google Drive
2. Click "New" → "File upload"
3. Upload `final-prfaq.docx`
4. Open with Google Docs (auto-converts)

### Method 3: Google Docs API (if credentials available)

If the user has Google Docs API credentials configured:

```bash
# Using google-docs-cli or similar
# This is optional and requires user setup
```

### Google Doc Detection Flow

1. Check if `pandoc` is installed: `which pandoc`
2. If yes, convert to `.docx`
3. Check if Google Drive CLI is available
4. If yes, offer to upload directly
5. If not, provide the `.docx` file with instructions to upload manually:
   ```
   📄 Google Doc export ready:
      output/<slug>/final-prfaq.docx

   To upload to Google Docs:
   1. Go to drive.google.com
   2. Click "New" → "File upload"
   3. Select final-prfaq.docx
   4. Right-click → "Open with" → "Google Docs"

   Or drag & drop the file into your browser on Google Drive.
   ```

### DOCX Styling

When generating DOCX:
- Professional heading styles (H1 = Title, H2 = Section, H3 = Subsection)
- Table formatting with borders
- Blockquote styling for customer quotes
- Bulleted and numbered list formatting
- Page breaks between major sections
- Table of contents that Google Docs can refresh

## Format: HTML

### Generation

```bash
pandoc output/<slug>/final-prfaq.md \
  -o output/<slug>/final-prfaq.html \
  --standalone \
  --toc \
  --toc-depth=2 \
  --css=templates/prfaq-style.css \
  --metadata title="PRFAQ: <Product Name>"
```

### HTML Styling

Generate a self-contained HTML file with embedded CSS:
- Clean, readable typography
- Responsive layout
- Styled tables with hover effects
- Collapsible FAQ sections (optional)
- Print-friendly styles
- Company branding placeholder

## /save-as Command Flow

When the user runs `/save-as <format>`:

1. **Validate:** Check that `final-prfaq.md` exists. If not, suggest `/export` first.

2. **Detect tools:** Check what conversion tools are available on the system.

3. **Convert:**
   - `pdf` → Convert to PDF using best available tool
   - `gdoc` or `google-doc` → Convert to DOCX with upload instructions
   - `docx` → Convert to DOCX directly
   - `html` → Convert to HTML with embedded styles
   - `all` → Generate all formats

4. **Report:**
   ```
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
     Format Export Complete
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
     📄 output/<slug>/final-prfaq.pdf   (PDF)
     📄 output/<slug>/final-prfaq.docx  (Google Docs compatible)
     📄 output/<slug>/final-prfaq.md    (Markdown)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   ```

## /export Integration

When `/export` runs, after generating the markdown file, ask:

```
📄 PRFAQ exported as Markdown: output/<slug>/final-prfaq.md

Would you also like to export as:
  (a) PDF — for sharing and printing
  (b) Google Doc — for collaborative editing
  (c) Both PDF + Google Doc
  (d) Markdown only (already done)
```

If the user selects a format, proceed with the conversion.
