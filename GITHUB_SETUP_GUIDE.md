# GitHub Setup & Deployment Guide for blog.inframitra.com

## Quick Start (5 Minutes)

### Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Fill in:
   - **Repository name**: `blog`
   - **Description**: "InfraMitra Blog - Daily IT Infrastructure Insights for Indian Startups and SMBs"
   - **Visibility**: Public
   - **Add .gitignore**: Select "Node" (we'll replace it)
   - **License**: MIT License

3. Click **"Create repository"**

### Step 2: Clone & Push Code

```bash
# Clone the repository to your local machine
git clone https://github.com/YOUR_USERNAME/blog.git
cd blog

# Add all files
git add .

# Commit changes
git commit -m "Initial commit: InfraMitra Blog platform"

# Push to GitHub
git push -u origin main
```

### Step 3: Enable GitHub Pages

1. Go to repository Settings
2. Scroll to **"Pages"** section
3. Under **"Source"**, select **"main"** branch
4. Click **"Save"**

### Step 4: Connect Custom Domain

1. In Settings → Pages section:
   - Enter custom domain: **blog.inframitra.com**
   - Check "Enforce HTTPS"
   - Click "Save"

2. Update DNS records at your domain registrar:
   ```
   CNAME: blog.inframitra.com → YOUR_USERNAME.github.io
   ```

3. Wait 24-48 hours for DNS propagation

4. Verify domain is connected (green checkmark in Settings)

---

## DNS Configuration

### Option 1: Using CNAME (Recommended for subdomain)

Add this DNS record at your domain registrar:

```
Type:  CNAME
Name:  blog
Value: inframitra.github.io
TTL:   3600 (or default)
```

### Option 2: Using A Records (For root domain)

Add these DNS records:

```
Type: A
Name: blog
IPs:
  185.199.108.153
  185.199.109.153
  185.199.110.153
  185.199.111.153
```

---

## Repository Structure

```
blog/
├── index.html                 # Homepage (blog.inframitra.com)
├── admin/
│   └── dashboard.html         # Admin dashboard
├── posts/
│   ├── amc-support-peace-of-mind.html
│   ├── startup-saves-50-lakhs.html
│   └── [more blog posts]
├── css/
│   ├── style.css
│   └── responsive.css
├── js/
│   ├── app.js
│   ├── admin.js
│   └── analytics.js
├── assets/
│   ├── images/
│   ├── logo.svg
│   └── favicon.svg
├── CNAME                      # Custom domain
├── _config.yml                # Jekyll config
├── README.md
├── LICENSE
└── .gitignore
```

---

## Updating Content

### Add New Blog Post

1. Create file: `posts/your-post-slug.html`
2. Use the blog post template
3. Commit and push:
   ```bash
   git add posts/your-post-slug.html
   git commit -m "Add new blog post: Your Post Title"
   git push origin main
   ```

### Update Home Page

1. Edit `index.html`
2. Commit and push:
   ```bash
   git add index.html
   git commit -m "Update home page content"
   git push origin main
   ```

### Manage Admin Dashboard

1. Edit `admin/dashboard.html`
2. Update blog post data in JavaScript
3. Commit and push

---

## Automated Workflow

### GitHub Actions (Optional)

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Build site
        run: |
          echo "Blog site ready to deploy"
      
      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./
          cname: blog.inframitra.com
```

---

## SSL Certificate

GitHub Pages automatically provides:
- ✅ Free HTTPS certificate (Let's Encrypt)
- ✅ Auto-renewal
- ✅ Enforces HTTPS for custom domains

---

## Performance Optimization

### Enable GitHub Pages Features:

1. **Minify CSS/JS** - GitHub automatically compresses assets
2. **Compress Images** - Use tools like TinyPNG
3. **Enable Caching** - GitHub CDN automatically caches

### Local Performance Testing:

```bash
# Install Jekyll locally
gem install jekyll bundler

# Run local server
bundle exec jekyll serve --livereload

# Visit http://localhost:4000
```

---

## SEO & Analytics

### Add Google Analytics

1. Get tracking ID from Google Analytics
2. Add to `_config.yml`:
   ```yaml
   google_analytics: UA-XXXXX-Y
   ```

### Submit Sitemap

1. GitHub automatically creates `/sitemap.xml`
2. Add to Google Search Console: https://search.google.com
3. Submit sitemap: `https://blog.inframitra.com/sitemap.xml`

### Add robots.txt

Create `robots.txt`:
```
User-agent: *
Allow: /
Sitemap: https://blog.inframitra.com/sitemap.xml
```

---

## Troubleshooting

### Custom domain not working?

1. ✅ Verify CNAME file exists in repo
2. ✅ Check DNS records at domain registrar
3. ✅ Wait 24-48 hours for propagation
4. ✅ Clear browser cache
5. ✅ Use `nslookup blog.inframitra.com` to verify DNS

### Site not updating after push?

1. ✅ Check GitHub Actions status
2. ✅ Clear browser cache (Ctrl+Shift+Delete)
3. ✅ Try incognito window
4. ✅ Wait 2-5 minutes for deploy

### 404 errors on pages?

1. ✅ Verify file paths are correct
2. ✅ Check `.gitignore` - file might be ignored
3. ✅ Ensure files use `.html` extension
4. ✅ Check case sensitivity (Linux is case-sensitive)

---

## Collaboration Workflow

### For Team Members:

1. **Fork** the repository
2. **Clone** your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/blog.git
   ```

3. **Create feature branch**:
   ```bash
   git checkout -b feature/new-blog-post
   ```

4. **Make changes** and commit:
   ```bash
   git commit -am "Add new blog post"
   ```

5. **Push** to your fork:
   ```bash
   git push origin feature/new-blog-post
   ```

6. **Create Pull Request** on main repo
7. **Review** and merge

---

## Deployment Checklist

- [ ] GitHub repository created
- [ ] Code pushed to main branch
- [ ] GitHub Pages enabled
- [ ] CNAME file added
- [ ] Custom domain configured
- [ ] DNS records updated at registrar
- [ ] HTTPS verified (green lock icon)
- [ ] Site accessible at https://blog.inframitra.com
- [ ] Homepage loads correctly
- [ ] Blog posts display properly
- [ ] Navigation works
- [ ] Newsletter signup works
- [ ] Admin dashboard accessible
- [ ] Mobile responsive
- [ ] Fast page load times

---

## Post-Deployment

### Monitor Performance:

1. **GitHub Analytics**: Settings → Pages → View deployment history
2. **Google Search Console**: Monitor indexing and search performance
3. **Google Analytics**: Track user behavior and conversions

### Regular Maintenance:

- [ ] Update blog posts regularly (1-2 per week minimum)
- [ ] Monitor page performance
- [ ] Check for broken links
- [ ] Update content for accuracy
- [ ] Add new features as needed

### Content Publishing Schedule:

- Monday-Friday: 1 post per day at 10:00 AM IST
- Category rotation: Cost → Speed → AMC → Sustainability
- Mix of original content and case studies
- Regular AMC support messaging

---

## Support & Resources

- **GitHub Docs**: https://docs.github.com/en/pages
- **Jekyll Docs**: https://jekyllrb.com/docs/
- **Custom Domain Guide**: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site

---

## Next Steps

1. ✅ Create GitHub repository
2. ✅ Push code (use commands above)
3. ✅ Enable GitHub Pages
4. ✅ Configure custom domain
5. ✅ Update DNS records
6. ✅ Verify HTTPS
7. ✅ Start publishing blog posts
8. ✅ Setup automated workflow
9. ✅ Add analytics tracking
10. ✅ Promote on social media

---

**GitHub Repository URL:**
```
https://github.com/inframitra/blog
```

**Live Blog URL:**
```
https://blog.inframitra.com
```

---

For questions or issues, contact: blog@inframitra.com
