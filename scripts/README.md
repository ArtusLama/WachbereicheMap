# Release Server Scripts

These scripts allow you to run the generated static site locally using `npx serve`.

## Requirements

- **Node.js and npm** (get it from https://nodejs.org/)
- The `serve` package will be installed automatically via `npx`

## Usage

### Windows
Double-click `serve.bat` or run from command prompt:
```cmd
serve.bat
```

### Linux / macOS
Run from terminal:
```bash
chmod +x serve.sh
./serve.sh
```

Or use npx directly:
```bash
npx serve .
```

## What Happens

1. A local HTTP server starts on `http://localhost:3000`
2. Open your browser and navigate to that address
3. You'll see the FlipperMap application running
4. Press `Ctrl+C` in the terminal to stop the server

## Why npx serve?

- **Built-in npm tooling** - comes with Node.js
- **No installation needed** - npx runs it directly
- **Production-ready** - better performance and features than Python's http.server
- **SPA support** - handles single-page app routing properly

## What is npx serve?

`npx serve` is a lightweight HTTP server package that:
- Serves static files efficiently
- Handles SPA routing (useful for Vue/Nuxt apps)
- Provides helpful development features
- Is widely used in the JavaScript community

## Notes

- The first run of `npx serve` may take a moment to install the package (cached after that)
- The server will automatically serve `index.html` for nested routes (SPA routing)
- For production, use a proper web server with better performance and security options
