# Priority 3 Setup Guide

This guide covers the setup and usage of Priority 3 features: GitHub Pages documentation site, automated link checking, and social preview image.

## ✅ What's Been Created

### 1. GitHub Pages Documentation Site (VitePress)

**Files Created:**
- `package.json` - Dependencies and scripts
- `docs/.vitepress/config.js` - VitePress configuration
- `docs/index.md` - Home page with hero section
- `docs/guide/getting-started.md` - Getting started guide
- `docs/guide/how-to-use.md` - Usage instructions
- `docs/guide/contributing.md` - Contributing guide
- `docs/README.md` - Documentation about the docs
- `docs/create-symlink.ps1` - Windows symlink script
- `docs/create-symlink.sh` - Linux/Mac symlink script

**Features:**
- ✅ Full-text search (built-in)
- ✅ Mobile responsive design
- ✅ Dark/light mode toggle
- ✅ All 84 topics in navigation
- ✅ Mermaid diagram support
- ✅ Edit on GitHub links

### 2. GitHub Actions Workflows

**`.github/workflows/deploy-docs.yml`**
- Automatically builds and deploys documentation to GitHub Pages
- Triggers on push to main branch
- Can be manually triggered

**`.github/workflows/link-checker.yml`**
- Checks all markdown files for broken links
- Runs on push, pull requests, and weekly schedule
- Creates issues for broken links found on main branch
- Excludes social media links (LinkedIn, Twitter)

### 3. Social Preview Image

**File:** `.github/assets/social-preview.png`
- Professional 1280x640px image
- Dark background with Node.js branding
- Shows repository title and key information
- Ready to upload to GitHub settings

## 🔧 Setup Instructions

### Step 1: Install Dependencies

```bash
# Install VitePress and dependencies
npm install
```

### Step 2: Create Symlink

The documentation site needs a symlink from `docs/sections` to `src` to avoid duplicating content.

**Windows (PowerShell as Administrator):**
```powershell
cd docs
.\create-symlink.ps1
```

**Linux/Mac:**
```bash
cd docs
chmod +x create-symlink.sh
./create-symlink.sh
```

### Step 3: Test Locally

```bash
# Start development server
npm run docs:dev
```

Visit `http://localhost:5173` to preview the documentation site.

### Step 4: Enable GitHub Pages

1. Go to **Settings** → **Pages**
2. Source: **GitHub Actions**
3. Save

The site will be deployed automatically on the next push to main.

### Step 5: Upload Social Preview Image

1. Go to **Settings** → **General**
2. Scroll to **Social preview**
3. Click **Edit**
4. Upload `.github/assets/social-preview.png`
5. Save

### Step 6: Verify Workflows

After pushing to GitHub:

1. Check **Actions** tab
2. Verify "Deploy Documentation" workflow runs successfully
3. Verify "Link Checker" workflow runs successfully
4. Visit your documentation site at: `https://muthukumar-js-dev.github.io/muthu-nodejs-playbook/`

## 📝 Usage

### Local Development

```bash
# Start dev server with hot reload
npm run docs:dev

# Build for production
npm run docs:build

# Preview production build
npm run docs:preview
```

### Updating Documentation

1. Edit content in `src/` directory
2. Changes automatically reflect in docs (via symlink)
3. Update `docs/.vitepress/config.js` if adding new sections
4. Push to main to deploy

### Manual Deployment

```bash
# Trigger deployment manually
# Go to Actions → Deploy Documentation → Run workflow
```

### Link Checking

The link checker runs:
- On every push to main
- On every pull request
- Weekly on Mondays at 9 AM UTC
- Manually via Actions tab

To run manually:
1. Go to **Actions** → **Link Checker**
2. Click **Run workflow**

## 🎨 Customization

### Update Site Title/Description

Edit `docs/.vitepress/config.js`:

```js
export default defineConfig({
  title: 'Your Title',
  description: 'Your Description',
  // ...
})
```

### Update Navigation

Edit the `nav` array in `docs/.vitepress/config.js`

### Update Sidebar

Edit the `sidebar` array in `docs/.vitepress/config.js`

### Change Theme Colors

VitePress uses CSS variables. Create `docs/.vitepress/theme/custom.css` for customization.

## 🐛 Troubleshooting

### Symlink Creation Fails (Windows)

**Solution:**
1. Run PowerShell as Administrator
2. Enable Developer Mode in Windows Settings
3. Run the script again

### Build Fails

**Solution:**
```bash
# Clean install
rm -rf node_modules package-lock.json
npm install
npm run docs:build
```

### Search Not Working

**Solution:**
Search index is built during production build. Run:
```bash
npm run docs:build
npm run docs:preview
```

### Link Checker False Positives

**Solution:**
Add exclusions to `.github/workflows/link-checker.yml`:
```yaml
--exclude 'example.com'
```

### GitHub Pages Not Deploying

**Solution:**
1. Check Actions tab for errors
2. Verify GitHub Pages is enabled in Settings
3. Ensure source is set to "GitHub Actions"
4. Check workflow permissions in Settings → Actions

## 📊 Monitoring

### Documentation Site

- **Live URL**: `https://muthukumar-js-dev.github.io/muthu-nodejs-playbook/`
- **Build Status**: Check Actions tab
- **Analytics**: Add Google Analytics in config if needed

### Link Checker

- **Status Badge**: Shows in README
- **Weekly Reports**: Check Actions tab every Monday
- **Issues**: Automatically created for broken links

## 🚀 Next Steps

1. **Push all changes to GitHub**
2. **Enable GitHub Pages** in repository settings
3. **Upload social preview image**
4. **Test documentation site** locally
5. **Verify workflows** run successfully
6. **Share documentation URL** with users

## 📚 Additional Resources

- [VitePress Documentation](https://vitepress.dev/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Lychee Link Checker](https://github.com/lycheeverse/lychee)

---

**All Priority 3 features are now complete!** 🎉
