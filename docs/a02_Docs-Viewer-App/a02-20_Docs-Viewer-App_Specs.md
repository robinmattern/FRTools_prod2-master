# Simple Client/Server Application Specifications

## A. Data Structure
Location: `./data/documents.json`

Document Record Schema:
```json
{
  "id": "string (UUID)",
  "title": "string",
  "type": "string (txt, json, md, html, pdf, docx, xlsx)",
  "filepath": "string (relative path to file in sources folder)",
  "dateUploaded": "string (ISO date)",
  "lastModified": "string (ISO date)"
}
```

## B. Server Structure
Location: `./server/s02_docs-viewer-api/`

### Setup and Running
1. Installation:
Note: Run the `npm install` command in the server folder, not in each app folder  
   ```bash
   cd server
   npm init -y
   npm install express cors multer@2 uuid
   ```

2. Running the server:
   ```bash
   cd server/s02_docs-viewer-api
   node server.mjs
   ```

3. Testing endpoints:
   - Use curl or Postman
   - Base URL: http://localhost:3052/api/docs
   - Example: GET http://localhost:3052/api/docs (lists all documents)

### 1. server.mjs
- Initialize Express application
- Configure middleware (cors, json parser, multer)
- Import and use document routes
- Set server port and start listener
- Basic error handling

### 2. routes.mjs
API Endpoints:
- GET /api/docs - List all documents
- GET /api/docs/:id - Get specific document
- POST /api/docs - Upload new document
- PUT /api/docs/:id - Update document
- DELETE /api/docs/:id - Delete document

Error Handling:
- 404 for document not found
- 400 for invalid requests
- 500 for server errors

File Storage:
- Physical files stored in `./sources` directory
- Filenames preserved with UUID prefix to prevent conflicts
- File paths stored in documents.json relative to sources folder

### 3. Static File Serving
Add static file serving for document access:
- Serve files from `./sources` directory
- Enable CORS for cross-origin requests
- Add endpoint: GET /sources/:filename

## C. Client Interface
Location: `./client/c02_docs-viewer-app/`
API_BASE: `http://localhost:3052/api/docs`

### Files
1. `index.html` - Main HTML interface
2. `index.js`   - Client-side JavaScript logic
3. `viewer.js`  - Document rendering module for different file types

### Loading the Client
1. Using Python HTTP Server:
   ```bash
   cd client/c02_docs-viewer-app
   npm install -g http-server
   http-server -p 3002   
   ```
   Then visit: http://localhost:3002

2. Using VS Code Live Server:
   - Right-click on index.html
   - Select "Open with Live Server"
   - Browser will open automatically

### Wire Diagram

```ascii
+----------------------------------------+
|           Document Manager             |
+----------------------------------------+
| Upload Document:                       |
| [Choose File]  [Upload Button]         |
+----------------------------------------+
| Select Document:                       |
| [Dropdown Menu▼]                       |
+----------------------------------------+
+----------------------------------------+
| +-----------------------------------+  |
| |  Title: sample.pdf                |  |
| |  Path: ./sources/4f5cab72d0s45... |  |
| |  Updated: 2024-01-15 08:20p       |  |
| |  Type: pdf                        |  |
| +-----------------------------------+  |
| [View] [Delete] [Download]             |
+----------------------------------------+
| Document Viewer:                       |
| +-----------------------------------+  |
| |                                   |  |
| |     [Document Content Area]       |  |
| |                                   |  |
| +-----------------------------------+  |
+----------------------------------------+
```

### Interface Elements:
1. File Upload Section
   - File input field
   - Upload button (Green)
   - Progress indicator (optional)

2. Document Selection
   - Dropdown populated with available documents
   - Auto-refresh after operations

3. Document Information Display
   - Show document metadata
   - Display file path
   - Last modified date
   - File type

4. Document Viewer Section
   - Large content area for displaying documents
   - Dynamic rendering based on file type
   - Scrollable container for large documents

5. Action Buttons
   - View button to render document in viewer (Blue)
   - Delete button with confirmation dialog (Red)
   - Download button to retrieve file (Green)

## D. Document Renderer Module
Location: `./client/c02_docs-viewer-app/viewer.js`

### Purpose
Handles rendering of different document types in the viewer area using client-side libraries.

### Supported File Types
1. **Text (.txt)**    - Plain text display with line numbers
2. **JSON (.json)**   - Formatted JSON with syntax highlighting
3. **Markdown (.md)** - Rendered HTML using Marked.js from CDN
4. **HTML (.html)**   - Iframe rendering with sandbox
5. **PDF (.pdf)**     - PDF.js viewer from CDN
6. **Word (.docx)**   - Mammoth.js converter from CDN
7. **Excel (.xlsx)**  - SheetJS viewer from CDN

### CDN Dependencies (loaded in index.html)
```html
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"                  ></script> <!-- Markdown rendering -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js"  ></script> <!-- PDF rendering -->
<script src="https://cdn.jsdelivr.net/npm/mammoth@1.6.0/mammoth.browser.min.js"  ></script> <!-- Word document rendering -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script> <!-- Excel rendering -->
```

### Renderer Functions
- `renderDocument(fileType, fileUrl, containerId)` - Main rendering function
- `renderText(    content, container)` - Plain text with line numbers
- `renderJSON(    content, container)` - Formatted JSON display
- `renderMarkdown(content, container)` - Convert MD to HTML
- `renderHTML(    fileUrl, container)` - Iframe with sandbox
- `renderPDF(     fileUrl, container)` - PDF.js canvas rendering
- `renderWord(    fileUrl, container)` - Mammoth.js conversion
- `renderExcel(   fileUrl, container)` - SheetJS table display

### Error Handling
- Fallback to download link if rendering fails
- Display error messages in viewer area
- Timeout handling for large files

## D. Running app client and server:
Location: `./{Project Root Folder}`
Runs the server first, then the client 
```bash
   bash run-app.sh a02
```
