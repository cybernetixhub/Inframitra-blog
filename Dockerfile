FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy your blog files
COPY . /usr/share/nginx/html

# Ensure correct permissions (optional but safe)
RUN chmod -R 755 /usr/share/nginx/html
