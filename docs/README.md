# VitePress Documentation

This directory contains the VitePress documentation site for the Node.js Production Playbook.

## Local Development

### Prerequisites

- Node.js 18+ 
- npm or yarn

### Setup

```bash
# Install dependencies
npm install

# Start dev server
npm run docs:dev
```

The site will be available at `http://localhost:5173`

### Build

```bash
# Build for production
npm run docs:build

# Preview production build
npm run docs:preview
```

## Structure

```
docs/
├── .vitepress/
│   └── config.js          # VitePress configuration
├── guide/                 # Getting started guides
│   ├── getting-started.md
│   ├── how-to-use.md
│   └── contributing.md
├── sections/              # Symlinks to ../src/ content
└── index.md               # Home page
```

## Content Organization

The actual content lives in `../src/` directory. The `sections/` folder should contain symlinks to the source content to avoid duplication.

### Creating Symlinks (Windows)

```powershell
# From the docs directory
New-Item -ItemType SymbolicLink -Path "sections" -Target "..\src"
```

### Creating Symlinks (Linux/Mac)

```bash
# From the docs directory
ln -s ../src sections
```

## Features

- ✅ Full-text search (built-in)
- ✅ Mobile responsive
- ✅ Dark/light mode
- ✅ Mermaid diagram support
- ✅ Sidebar navigation
- ✅ Edit on GitHub links

## Deployment

The site is automatically deployed to GitHub Pages when changes are pushed to the `main` branch via GitHub Actions.

Live site: `https://muthukumar-js-dev.github.io/muthu-nodejs-playbook/`

## Configuration

Main configuration is in `.vitepress/config.js`. Key settings:

- **base**: `/muthu-nodejs-playbook/` (GitHub Pages path)
- **title**: Site title
- **description**: Meta description
- **themeConfig**: Navigation, sidebar, search, etc.

## Customization

### Adding New Topics

1. Add the markdown file to `../src/` in the appropriate section
2. Update `.vitepress/config.js` sidebar configuration
3. The symlink will automatically make it available

### Updating Navigation

Edit the `nav` array in `.vitepress/config.js`

### Updating Sidebar

Edit the `sidebar` array in `.vitepress/config.js`

## Troubleshooting

### Symlinks not working on Windows

Run PowerShell as Administrator and enable Developer Mode in Windows Settings.

### Build fails

1. Delete `node_modules` and `package-lock.json`
2. Run `npm install` again
3. Try `npm run docs:build`

### Search not working

Search is built during the build process. Run `npm run docs:build` to generate the search index.

## Contributing

See the main [CONTRIBUTING.md](https://github.com/muthukumar-js-dev/muthu-nodejs-playbook/blob/main/CONTRIBUTING.md) for contribution guidelines.
